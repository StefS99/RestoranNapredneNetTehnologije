using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class PorudzbinaUser
    {
        public int? PorudzbinaId { get; set; }
        public Porudzbina? Porudzbina { get; set; }
        public int? UserId { get; set; }
        public User? User { get; set; }

        public DateTime? DatumPorudzbine { get; set; }

    }
}
