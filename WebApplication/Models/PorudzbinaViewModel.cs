using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;
using WebApplication.Helpers;

namespace WebApplication.Models
{
    public class PorudzbinaViewModel
    {
        public int PorudzbinaId { get; set; }
        public string? Naziv { get; set; }
        public double? Cena { get; set; } = 0;
        public string? Slika { get; set; }

        //[ValidacijaGodina] //U Helpers se nalazi implementacija ovog atributa

        [Required(ErrorMessage = "Neophodno je da unesete datum porudžbine!")]
        [Display(Name = "Datum porudžbine")]
        public DateTime? Datum { get; set; }

        [Required(ErrorMessage = "Neophodno je da unesete adresu!")]
        public string? Adresa { get; set; }

        public List<SelectListItem>? Jela { get; set; } = new List<SelectListItem>();
        public List<SelectListItem>? OstalaJela { get; set; } = new List<SelectListItem>();

        [Required(ErrorMessage = "Neophodno je da izaberete bar jedno jelo!")]
        public List<int>? NovoJeloUPorudzbini { get; set; } = new List<int>();
    }
}
