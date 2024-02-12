using DataAccessLayer.Interfaces;
using DatabaseContext;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Implementations
{
    public class KuvarRepository : IKuvarRepository
    {
        private readonly JeloContext context;

        public KuvarRepository(JeloContext context)
        {
            this.context = context;
        }

        public void Add(Kuvar entity)
        {
            context.Add(entity);
        }

        public void Delete(Kuvar entity)
        {
            context.Kuvari.Remove(entity);
        }

        public List<Kuvar> GetAll()
        {
            return context.Kuvari.ToList();
        }

        public List<Kuvar> SearchBy(Expression<Func<Kuvar, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public Kuvar SearchByEntity(Kuvar entity)
        {
            return context.Kuvari.First(v => v.KuvarId == entity.KuvarId);
        }

        public Kuvar SearchById(int id)
        {
            return context.Kuvari.First(v => v.KuvarId == id);
        }

        public void Update(Kuvar entity)
        {
            context.Kuvari.Update(entity);
        }
    }
}
