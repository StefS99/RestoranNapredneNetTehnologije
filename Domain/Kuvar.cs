using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Kuvar
    {
        public int KuvarId { get; set; }
        public string? KuvarIme { get; set; }
        public string? KuvarPrezime { get; set; }
        public DateTime? DatumRodjenja { get; set; }
        public string? Specijalnost { get; set; }
        public string? Slika {  get; set; }
        public List<Jelo>? Jela { get; set; }

        public override string ToString()
        {
            return $"{KuvarIme} {KuvarPrezime}";
        }
    }
}
