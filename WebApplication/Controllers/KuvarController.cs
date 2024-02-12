using cloudscribe.Pagination.Models;
using DataAccessLayer.UnitOfWork;
using Domain;
using Json.Net;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Hosting.Internal;
using System.Drawing.Printing;
using System.Linq.Expressions;
using WebApplication.Models;

namespace WebApplication.Controllers
{
    public class KuvarController : Controller
    {
        private readonly IUnitOfWork uow;
        private readonly IWebHostEnvironment hostingEnvironment; //Zbog slike

        public KuvarController(IUnitOfWork iow, IWebHostEnvironment hostingEnvironment)
        {
            this.uow = iow;
            this.hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public KuvarViewModel ModelVM { get; set; }

        public IActionResult Index(string searchString, int pageNumber = 1, int pageSize = 6)
        { 

            ViewBag.CurrentFilter = searchString;
            int ExcludeRecords = (pageNumber * pageSize) - pageSize;

            var model = from j in uow.KuvarRepository.GetAll() select j;
            var kuvarCount = model.Count();

            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(a => a.ToString().ToUpper().Contains(searchString.ToUpper()));
                kuvarCount = model.Count();
            }

            model = model.Skip(ExcludeRecords).Take(pageSize);

            List<KuvarViewModel> list = new List<KuvarViewModel>();
            list = model.Select(m => new KuvarViewModel()
            {
                KuvarIme = m.KuvarIme,
                KuvarId = m.KuvarId,
                KuvarPrezime = m.KuvarPrezime,
                Specijalnost = m.Specijalnost,
                Slika = m.Slika,
                DatumRodjenja = m.DatumRodjenja
            }).ToList();


            var result = new PagedResult<KuvarViewModel>
            {
                Data = list,
                TotalItems = kuvarCount,
                PageNumber = pageNumber,
                PageSize = pageSize
            };

            
            return View(result);
        }


        public IActionResult Create()
        {
            return View();
        }

        [HttpPost, ActionName("Create")]
        public IActionResult Create(KuvarViewModel Kuvar)
        {
            if (!ModelState.IsValid)
            {
                return Create();
            }

            Kuvar k = new Kuvar() { Specijalnost = Kuvar.Specijalnost, DatumRodjenja = Kuvar.DatumRodjenja, KuvarIme = Kuvar.KuvarIme, KuvarPrezime = Kuvar.KuvarPrezime};

            uow.KuvarRepository.Add(k);
            uow.Save();

            var KuvarId = k.KuvarId;

            string wwwroothPath = hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;

            if (files.Count != 0)
            {
                var Slika = @"assets\img\chefs";
                var Extension = Path.GetExtension(files[0].FileName);
                var RelativeSlika = Slika + KuvarId + Extension;
                var AbsSlika = Path.Combine(wwwroothPath, RelativeSlika);


                using (var fileStream = new FileStream(AbsSlika, FileMode.Create))
                {
                    files[0].CopyTo(fileStream);
                }

                //Čuvanje slike u bazi
                k.Slika = RelativeSlika;
                uow.Save();
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var Kuvar = uow.KuvarRepository.SearchById(id);
            if (Kuvar is null)
            {
                return NotFound();
            }

            uow.KuvarRepository.Delete(Kuvar);
            uow.Save();

            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            Kuvar k = uow.KuvarRepository.SearchByEntity(new Kuvar() { KuvarId = id }); //Obavezno Entity!!!
            var kuvari = uow.KuvarRepository.GetAll();

            ModelVM = new KuvarViewModel()
            {
                KuvarId = id,
                Specijalnost = k.Specijalnost,
                KuvarIme = k.KuvarIme,
                KuvarPrezime = k.KuvarPrezime,
                DatumRodjenja = k.DatumRodjenja               
            };


            if (ModelVM is null)
            {
                return NotFound();
            }
            return View(ModelVM);
        }


        [HttpPost, ActionName("Edit")]
        public IActionResult EditPost(KuvarViewModel v)
        {
            Kuvar k = uow.KuvarRepository.SearchById(ModelVM.KuvarId);

            if (!ModelState.IsValid)
            {
                return View(ModelVM);
            }

            k.KuvarIme = v.KuvarIme;
            k.KuvarPrezime = v.KuvarPrezime;
            k.Specijalnost = v.Specijalnost;
            k.DatumRodjenja = v.DatumRodjenja;

            UploadImageIfAvalible(k, v.KuvarId);

            uow.Save();

            return RedirectToAction("Index");
        }


        private void UploadImageIfAvalible(Kuvar a, int id)
        {
            var savedKuvar = uow.KuvarRepository.SearchById(id);
            var KuvarId = id;

            string wwwroothPath = hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;

            if (files.Count != 0)
            {
                var Slika = @"assets\img\chefs\";
                var FileNamePath = Path.GetFileNameWithoutExtension(files[0].FileName);
                var Extension = Path.GetExtension(files[0].FileName);
                var RelativeSlika = Slika + FileNamePath + Extension;
                var AbsSlika = Path.Combine(wwwroothPath, RelativeSlika);

                using (var fileStream = new FileStream(AbsSlika, FileMode.Create))
                {
                    files[0].CopyTo(fileStream);
                }
                //Čuvanje slike u bazi

                savedKuvar.Slika = RelativeSlika;
                uow.KuvarRepository.Update(savedKuvar);
            }
        }
    }
}
