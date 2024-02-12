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
    public class UserRepository : IUserRepository
    {
        private readonly JeloContext context;

        public UserRepository(JeloContext context)
        {
            this.context = context;
        }

        public void Add(User entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(User entity)
        {
            throw new NotImplementedException();
        }

        public List<User> GetAll()
        {
            return context.Users.ToList();
        }

        public List<User> SearchBy(Expression<Func<User, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public User SearchByEntity(User entity)
        {
            throw new NotImplementedException();
        }

        public User SearchById(int id)
        {
            return context.Users.Include(p => p.PorudzbinaUsers).First(a => a.Id == id);
        }

        public void Update(User entity)
        {
            throw new NotImplementedException();
        }
    }
}
