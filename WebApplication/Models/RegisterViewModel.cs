using System.ComponentModel.DataAnnotations;

namespace WebApplication.Models
{
    public class RegisterViewModel
    {
        [Required]
        public string? Ime { get; set; }
        [Required]
        public string? Prezime { get; set; }
        [Required]
        [Display(Name = "Korisničko ime")]
        public string? Username { get; set; }
        [Required]
        [Display(Name = "Lozinka")]
        public string? Password { get; set; }
        [Required]
        [Compare("Password")]
        [Display(Name = "Potvrdite lozinku")]
        public string? PasswordProvera { get; set; }

        public bool Admin { get; set; }
    }
}
