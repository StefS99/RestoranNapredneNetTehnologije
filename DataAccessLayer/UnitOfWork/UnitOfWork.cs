using DataAccessLayer.Implementations;
using DataAccessLayer.Interfaces;
using DatabaseContext;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly JeloContext context;
        public UnitOfWork(JeloContext context)
        {
            this.context = context;
            JeloRepository = new JeloRepository(context);
            KuvarRepository = new KuvarRepository(context);
            PorudzbinaRepository = new PorudzbinaRepository(context);
            UserRepository = new UserRepository(context);
        }
        public IJeloRepository JeloRepository { get; set; }
        public IKuvarRepository KuvarRepository { get; set; }
        public IPorudzbinaRepository PorudzbinaRepository { get; set; }
        public IUserRepository UserRepository { get; set; }

        public void Save()
        {
            context.SaveChanges();
        }
    }
}
