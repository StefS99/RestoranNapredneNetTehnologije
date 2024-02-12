using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.UnitOfWork
{
    public interface IUnitOfWork
    {
        public IJeloRepository JeloRepository { get; set; }
        public IKuvarRepository KuvarRepository { get; set; }
        public IPorudzbinaRepository PorudzbinaRepository { get; set; }
        public IUserRepository UserRepository { get; set; }

        public void Save();
    }
}
