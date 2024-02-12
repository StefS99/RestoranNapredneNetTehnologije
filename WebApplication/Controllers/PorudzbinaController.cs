using cloudscribe.Pagination.Models;
using DataAccessLayer.UnitOfWork;
using DatabaseContext.Migrations;
using Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Security.Claims;
using WebApplication.Helpers;
using WebApplication.Models;

namespace WebApplication.Controllers
{
    public class PorudzbinaController : Controller
    {
        private readonly IUnitOfWork uow;
        private readonly IWebHostEnvironment hostingEnvironment;
        private readonly IHttpContextAccessor httpContextAccessor;

        [BindProperty]
        public PorudzbinaViewModel PorudzbinaVm { get; set; }

        public PorudzbinaController(IUnitOfWork iow, IWebHostEnvironment web, IHttpContextAccessor accessor)
        {
            this.uow = iow;
            this.hostingEnvironment = web;
            this.httpContextAccessor = accessor;
        }

        [Authorize(Roles = "Admin,Kupac")]
        public IActionResult Index(bool isChecked, string searchString, string checkBox, string sortOrder, string sortOrderDate, int pageNumber = 1, int pageSize = 3)
        {

            ViewBag.CurrentSortOrder = sortOrderDate;
            ViewBag.CurrentFilter = searchString;
            ViewBag.DateSortParam = String.IsNullOrEmpty(sortOrderDate) ? "date_asc" : "";
            ViewBag.CheckBox = string.IsNullOrEmpty(checkBox) ? "checked" : " ";

            int ExcludeRecords = (pageNumber * pageSize) - pageSize;

            var model = from a in uow.PorudzbinaRepository.GetAll() select a; //Ako je admin vidi sve porudžbine

            if (User.IsInRole(Roles.Kupac)) //Ako je kupac, samo za njegove unete porudžbine
            {
                var u = uow.UserRepository.SearchById(int.Parse(httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value));

                List<PorudzbinaUser> pus = u.PorudzbinaUsers;

                List<Porudzbina> porudzbine = new List<Porudzbina>();

                foreach(PorudzbinaUser pu in pus)
                {
                    porudzbine.Add(pu.Porudzbina);
                }

                model = porudzbine;

            }

            var PorudzbinaCount = model.Count();

            if (isChecked)
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    model = model.Where(a => a.Naziv.ToUpper().Contains(searchString.ToUpper()));
                    PorudzbinaCount = model.Count();
                }
                else
                {
                    PorudzbinaCount = model.Count();
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    model = model.Where(a => a.Naziv.ToUpper().Contains(searchString.ToUpper()));
                    PorudzbinaCount = model.Count();
                }
            }

            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(a => a.Naziv.ToUpper().Contains(searchString.ToUpper()));
                PorudzbinaCount = model.Count();
            }

            switch (ViewBag.DateSortParam)
            {
                case "date_asc":
                    model = model.OrderBy(b => b.Datum);
                    break;
                default:
                    model = model.OrderByDescending(b => b.Datum);
                    break;
            }

            model = model.Skip(ExcludeRecords).Take(pageSize);

            List<PorudzbinaViewModel> list = new List<PorudzbinaViewModel>();

            list = model.Select(m => new PorudzbinaViewModel()
            {
                Naziv = m.Naziv,
                PorudzbinaId = m.PorudzbinaId,
                Slika = m.Slika,
                Cena = m.Cena,
                Datum = m.Datum,
                Adresa = m.Adresa,
                Jela = m.Jela.Select(a => new SelectListItem(a.Naziv, a.JeloId.ToString())).ToList()

            }).ToList();

            var result = new PagedResult<PorudzbinaViewModel>
            {
                Data = list,
                TotalItems = PorudzbinaCount,
                PageNumber = pageNumber,
                PageSize = pageSize
            };


            return View("Index", result);
        }

        public IActionResult Create()
        {
            PorudzbinaViewModel vm = new PorudzbinaViewModel();
            var allJela = uow.JeloRepository.GetAll();

            vm.Jela = new List<SelectListItem>();
            vm.OstalaJela = allJela.Select(a => new SelectListItem() { Value = a.JeloId.ToString(), Text = a.Naziv }).ToList();


            return View(vm);
        }

  

        [HttpPost]
        public IActionResult Create(PorudzbinaViewModel vm)
        {

            if (!ModelState.IsValid)
            {
                return Create();
            }

            Porudzbina p = new Porudzbina()
            {
                Naziv = vm.Naziv,
                Cena = vm.Cena,
                Datum = vm.Datum,
                Adresa = vm.Adresa
            };

            foreach (int num in vm.NovoJeloUPorudzbini)
            {
                p.Jela.Add(uow.JeloRepository.SearchById(num));
            }
            foreach(var item in p.Jela)
            {
                p.Cena += item.CenaJela;
            }

            p.Cena += 300; //Cena dostave

            int brojac = 0;
            foreach(var item in p.Jela) //Slika porudžbine kao slika prvog jela
            {
                if(brojac != 1)
                {
                    p.Slika = item.Slika;
                }
                brojac++;
            }
            uow.PorudzbinaRepository.Add(p);
            uow.Save();

            //UploadImageIfAvalible(p, p.PorudzbinaId);

            User u = uow.UserRepository.SearchById(int.Parse(httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value));

            u.PorudzbinaUsers.Add(new PorudzbinaUser() { Porudzbina = p, User = u, DatumPorudzbine = p.Datum });

            uow.Save();

            return RedirectToAction("Index");
        }


        [HttpPost]
        public IActionResult Delete(int id)
        {
            Porudzbina a = uow.PorudzbinaRepository.SearchById(id);

            if (a is null)
            {
                return NotFound();
            }

            uow.PorudzbinaRepository.Delete(a);
            uow.Save();

            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            Porudzbina p = uow.PorudzbinaRepository.SearchById(id);
            var Jela = uow.JeloRepository.GetAll();
            var OstalaJela = Jela.Except(p.Jela);

            PorudzbinaVm = new PorudzbinaViewModel()
            {
                PorudzbinaId = id,
                Datum = p.Datum,
                Adresa = p.Adresa,
                Naziv = p.Naziv,
                Cena = p.Cena,
                Jela = p.Jela.Select(p => new SelectListItem(p.Naziv, p.JeloId.ToString())).ToList(),
               OstalaJela = OstalaJela.Select(p => new SelectListItem(p.Naziv, p.JeloId.ToString())).ToList()
            };

            if (PorudzbinaVm is null)
            {
                return NotFound();
            }
            return View(PorudzbinaVm);
        }


        [HttpPost, ActionName("Edit")]
        public IActionResult EditPost(PorudzbinaViewModel v)
        {
            Porudzbina p = uow.PorudzbinaRepository.SearchById(PorudzbinaVm.PorudzbinaId);

            if (!ModelState.IsValid)
            {
                return Edit(p.PorudzbinaId);
            }

            p.Naziv = v.Naziv;
            p.Cena = v.Cena;
            p.Datum = v.Datum;
            p.Adresa = v.Adresa;

            List<Jelo> Jela = new List<Jelo>();

            foreach (int num in v.NovoJeloUPorudzbini)
            {
                Jela.Add(uow.JeloRepository.SearchById(num));
            }
            p.Jela = null;
            p.Jela = Jela;

            foreach (var item in p.Jela)
            {
                p.Cena += item.CenaJela;
            }
            p.Cena += 300; //Cena dostave

            int brojac = 0;
            foreach (var item in p.Jela) //Slika porudžbine kao slika prvog jela
            {
                if (brojac != 1)
                {
                    p.Slika = item.Slika;
                }
                brojac++;
            }

            //UploadImageIfAvalible(p, v.PorudzbinaId);

            uow.Save();

            return RedirectToAction("Index");
        }


        private void UploadImageIfAvalible(Porudzbina a, int id)
        {
            var savedPorudzbina = uow.PorudzbinaRepository.SearchById(id);
            var PorudzbinaId = id;

            string wwwroothPath = hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;

            if (files.Count != 0)
            {
                var Slika = @"assets\img\menu\";
                var FileNamePath = Path.GetFileNameWithoutExtension(files[0].FileName);
                var Extension = Path.GetExtension(files[0].FileName);
                var RelativeSlika = Slika + FileNamePath + Extension;
                var AbsSlika = Path.Combine(wwwroothPath, RelativeSlika);

                using (var fileStream = new FileStream(AbsSlika, FileMode.Create))
                {
                    files[0].CopyTo(fileStream);
                }
                //sacuvaj imgPath u bazi

                savedPorudzbina.Slika = RelativeSlika;
                uow.PorudzbinaRepository.Update(savedPorudzbina);
            }
        }

    }
}
