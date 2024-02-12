using cloudscribe.Pagination.Models;
using DataAccessLayer.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Drawing.Printing;
using WebApplication.Helpers;
using WebApplication.Models;

namespace WebApplication.Controllers
{

    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly IUnitOfWork uow;
        private readonly IWebHostEnvironment hostingEnvironment;

        public HomeController(ILogger<HomeController> logger, IUnitOfWork uow, IWebHostEnvironment hostingEnvironment)
        {
            _logger = logger;
            this.uow = uow;
            this.hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public JeloViewModel ModelVM { get; set; }


        // GET: JeloController
 
        public IActionResult Index()
        {

            var model = from j in uow.JeloRepository.GetAll() select j;
            var jeloCount = model.Count();

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
            };

            return View(result);
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
