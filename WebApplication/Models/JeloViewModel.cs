using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;
using WebApplication.Helpers;

namespace WebApplication.Models
{
    public class JeloViewModel
    {
        public int JeloId { get; set; }

        [Required(ErrorMessage = "Morate uneti naziv jela!")]
        public string? Naziv { get; set; }

        [Required(ErrorMessage = "Morate uneti cenu jela!")]
        [Display(Name = "Cena jela")]
        public double? CenaJela { get; set; }

        [Required(ErrorMessage = "Morate uneti tip jela!")]
        [RegularExpression("Predjela|Glavna jela|Salate|Slatki specijaliteti", 
                            ErrorMessage = "Morate pravilno uneti tip jela (Predjela, Glavna jela, Salate, Slatki specijaliteti)")]
        [Display(Name = "Tip jela")]
        public string? TipJela { get; set; }

        [Display(Name = "Opis jela")]
        public string? OpisJela { get; set; }

        public int KuvarId { get; set; }
        public string? KuvarIme { get; set; }
        public List<SelectListItem>? Kuvari { get; set; } = new List<SelectListItem>();

        [Display(Name = "Slika")]
        public string? Slika { get; set; }

    }
}
