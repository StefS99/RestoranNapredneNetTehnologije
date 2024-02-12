using DataAccessLayer.Interfaces;
using DatabaseContext;
using Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Implementations
{
    public class PorudzbinaRepository : IPorudzbinaRepository
    {
        private readonly JeloContext context;

        public PorudzbinaRepository(JeloContext context)
        {
            this.context = context;
        }

        public void Add(Porudzbina entity)
        {
            context.Add(entity);
        }

        public void Delete(Porudzbina entity)
        {
            context.Porudzbine.Remove(entity);
        }

        public List<Porudzbina> GetAll()
        {
            return context.Porudzbine.Include(p => p.Jela).ToList();
        }

        public List<Porudzbina> SearchBy(Expression<Func<Porudzbina, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public Porudzbina SearchByEntity(Porudzbina entity)
        {
            return context.Porudzbine.Include(p => p.Jela).First();
        }

        public Porudzbina SearchById(int id)
        {
            return context.Porudzbine.Include(p => p.Jela).First(p => p.PorudzbinaId == id); ;

        }

        public void Update(Porudzbina entity)
        {
            context.Update(entity);
        }
    }
}
