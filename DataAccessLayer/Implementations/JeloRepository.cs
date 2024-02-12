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
    public class JeloRepository : IJeloRepository
    {
        private readonly JeloContext context;

        public JeloRepository(JeloContext context)
        {
            this.context = context;
        }
        public void Add(Jelo entity)
        {
            context.Add(entity);
        }

        public void Delete(Jelo entity)
        {
            context.Remove(entity);
        }

        public List<Jelo> GetAll()
        {
            List<Jelo> jela = context.Jela.ToList();
            return context.Jela.Include(v => v.Kuvar).ToList();
        }

        public List<Jelo> SearchBy(Expression<Func<Jelo, bool>> predicate)
        {
            return context.Jela.Where(predicate).ToList();
        }

        public Jelo SearchByEntity(Jelo entity)
        {
            return context.Jela.Include(v => v.Kuvar).First(a => a.JeloId == entity.JeloId);
        }

        public Jelo SearchById(int id)
        {
            return context.Jela.First(a => a.JeloId == id);
        }

        public void Update(Jelo entity)
        {
            context.Update(entity);
        }
    }
}
