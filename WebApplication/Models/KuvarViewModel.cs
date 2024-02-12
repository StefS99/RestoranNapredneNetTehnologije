using System.ComponentModel.DataAnnotations;

namespace WebApplication.Models
{
    public class KuvarViewModel
    {
        public int KuvarId { get; set; }

        [Required(ErrorMessage = "Morate uneti ime kuvara!")]
        [Display(Name = "Ime")]
        public string? KuvarIme { get; set; }

        [Required(ErrorMessage = "Morate uneti prezime kuvara!")]
        [Display(Name = "Prezime")]
        public string? KuvarPrezime { get; set; }

        [Required(ErrorMessage = "Morate uneti datum rođenja")]
        [Display(Name = "Datum rođenja")]
        public DateTime? DatumRodjenja { get; set; }

        public string? Slika { get; set; }

        [Required(ErrorMessage = "Morate uneti specijalnost kuvara!")]
        public string? Specijalnost { get; set; }

        public override string ToString()
        {
            return $"{KuvarIme} {KuvarPrezime}";
        }

    }
}
