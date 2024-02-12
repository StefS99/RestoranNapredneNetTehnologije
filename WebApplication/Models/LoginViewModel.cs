using System.ComponentModel.DataAnnotations;

namespace WebApplication.Models
{
    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Korisničko ime")]
        public string? Username { get; set; }

        [Required]
        [Display(Name = "Lozinka")]
        public string? Password { get; set; }
    }
}
