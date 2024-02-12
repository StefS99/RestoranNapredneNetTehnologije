using cloudscribe.Pagination.Models;
using DataAccessLayer.UnitOfWork;
using Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using WebApplication.Models;

namespace WebApplication.Controllers
{
    public class JeloController : Controller
    {

        private readonly IUnitOfWork uow;
        private readonly IWebHostEnvironment hostingEnvironment;
        public JeloController(IUnitOfWork uow, IWebHostEnvironment hostingEnvironment)
        {
            this.uow = uow;
            this.hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public JeloViewModel ModelVM { get; set; }


        // GET: JeloController
        public IActionResult Index(string searchString, string sortOrder, int pageNumber = 1, int pageSize = 8)
        {
            ViewBag.CurrentSortOrder = sortOrder;
            ViewBag.CurrentFilter = searchString;
            ViewBag.TipJelaParam = String.IsNullOrEmpty(sortOrder) ? "tip_desc" : "";

            int ExcludeRecords = (pageNumber * pageSize) - pageSize;

            var model = from j in uow.JeloRepository.GetAll() select j;
            var jeloCount = model.Count();

            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(a => a.Naziv.ToUpper().Contains(searchString.ToUpper()));
                jeloCount = model.Count();
            }

            switch (sortOrder)
            {
                case "tip_desc":
                    model = model.OrderByDescending(b => b.Naziv);
                    break;
                default:
                    model = model.OrderBy(b => b.Naziv);
                    break;
            }

            model = model.Skip(ExcludeRecords).Take(pageSize);

            List<JeloViewModel> list = new List<JeloViewModel>();
            list = model.Select(m => new JeloViewModel()
            {
                TipJela = m.TipJela,
                Naziv = m.Naziv,
                CenaJela = m.CenaJela,
                OpisJela = m.OpisJela,
                JeloId = m.JeloId,
                KuvarId = m.KuvarId,
                KuvarIme = m.Kuvar.ToString(),
                Slika = m.Slika
            }).ToList();



            var result = new PagedResult<JeloViewModel>
            {
                Data = list,
                TotalItems = jeloCount,
                PageNumber = pageNumber,
                PageSize = pageSize
            };


            return View(result);
        }

        // GET: JeloController/Create
        public IActionResult Create()
        {
            var kuvari = uow.KuvarRepository.GetAll();
            JeloViewModel vm = new JeloViewModel();

            vm.Kuvari = kuvari.Select(p => new SelectListItem(p.ToString(), p.KuvarId.ToString())).ToList();
            return View(vm);
        }

        // POST: JeloController/Create
        [HttpPost, ActionName("Create")]
        public IActionResult CreatePost(JeloViewModel v)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            Jelo a = new Jelo() { TipJela = v.TipJela, CenaJela = v.CenaJela, Naziv = v.Naziv, OpisJela = v.OpisJela, KuvarId = v.KuvarId };

            uow.JeloRepository.Add(a);
            uow.Save();


            var JeloId = a.JeloId;

            string wwwroothPath = hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;



            if (files.Count != 0)
            {
                var Slika = @"assets\img\menu";
                var Extension = Path.GetExtension(files[0].FileName);
                var RelativeSlika = Slika + JeloId + Extension;
                var AbsSlika = Path.Combine(wwwroothPath, RelativeSlika);


                using (var fileStream = new FileStream(AbsSlika, FileMode.Create))
                {
                    files[0].CopyTo(fileStream);
                }
                //Čuvanje slike u bazi

                a.Slika = RelativeSlika;
                uow.Save();

            }


            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            Jelo a = uow.JeloRepository.SearchByEntity(new Jelo() { JeloId = id }); //Obavezno Entity!!!
            var kuvari = uow.KuvarRepository.GetAll();

            ModelVM = new JeloViewModel()
            {
                JeloId = id,
                TipJela = a.TipJela,
                CenaJela = a.CenaJela,
                OpisJela = a.OpisJela,
                Kuvari = kuvari.Select(p => new SelectListItem(p.ToString(), p.KuvarId.ToString())).ToList(),
                Naziv = a.Naziv,
                KuvarId = a.KuvarId
            };


            if (ModelVM is null)
            {
                return NotFound();
            }
            return View(ModelVM);
        }

        [HttpPost, ActionName("Edit")]
        public IActionResult EditPost(JeloViewModel v)
        {
            Jelo a = uow.JeloRepository.SearchById(ModelVM.JeloId);

            if (!ModelState.IsValid)
            {
                return View();
            }

            a.Naziv = v.Naziv;
            a.TipJela = v.TipJela;
            a.CenaJela = v.CenaJela;
            a.OpisJela = v.OpisJela;
            a.KuvarId = v.KuvarId;

            UploadImageIfAvalible(a, v.JeloId);

            uow.Save();

            return RedirectToAction("Index");
        }

        private void UploadImageIfAvalible(Jelo a, int id)
        {
            var savedJelo = uow.JeloRepository.SearchById(id);
            var JeloId = id;

            string wwwroothPath = hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;

            if (files.Count != 0)
            {
                var Slika = @"assets\img\menu";
                var Extension = Path.GetExtension(files[0].FileName);
                var RelativeSlika = Slika + JeloId + Extension;
                var AbsSlika = Path.Combine(wwwroothPath, RelativeSlika);

                using (var fileStream = new FileStream(AbsSlika, FileMode.Create))
                {
                    files[0].CopyTo(fileStream);
                }
                //Čuvanje slike u bazi

                savedJelo.Slika = RelativeSlika;
                uow.JeloRepository.Update(savedJelo);
            }
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            Jelo a = uow.JeloRepository.SearchById(id);

            if (a is null)
            {
                return NotFound();
            }

            uow.JeloRepository.Delete(a);
            uow.Save();

            return RedirectToAction("Index");
        }
    }
}
