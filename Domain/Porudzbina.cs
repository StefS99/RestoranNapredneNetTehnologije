using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Porudzbina
    {
        public int PorudzbinaId { get; set; }
        public string? Naziv { get; set; }
        public double? Cena { get; set; }
        public string? Slika { get; set; }

        public DateTime? Datum { get; set; }
        public string? Adresa { get; set; }

        public List<PorudzbinaUser>? PorudzbineUsers { get; set; } = new List<PorudzbinaUser>();
        public List<Jelo>? Jela { get; set; } = new List<Jelo>();
    }
}
