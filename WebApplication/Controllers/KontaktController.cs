using Microsoft.AspNetCore.Mvc;

namespace WebApplication.Controllers
{
    public class KontaktController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
