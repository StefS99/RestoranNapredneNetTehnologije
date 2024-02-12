using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Jelo
    {
        public int JeloId { get; set; }
        public string? Naziv { get; set; }
        public double? CenaJela { get; set; }
        public string? TipJela { get; set; }
        public string? OpisJela { get; set; }

        public int KuvarId { get; set; }
        public Kuvar? Kuvar { get; set; }
        
        public string? Slika { get; set; }
        public List<Porudzbina>? Porudzbine { get; set; }

        public override bool Equals(object? obj)
        {
            return obj is Jelo jelo &&
                TipJela == jelo.TipJela &&
                CenaJela == jelo.CenaJela &&
                Naziv == jelo.Naziv &&
                KuvarId == jelo.KuvarId;
        }
    }
}
