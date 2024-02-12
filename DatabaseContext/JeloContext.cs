using Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseContext
{
    public class JeloContext : IdentityDbContext<User, IdentityRole<int>, int>
    {
        public JeloContext() //Obavezno mora prazan konstruktor!!!
        {

        }

        public JeloContext([NotNull] DbContextOptions options) : base(options)
        {

        }

        public DbSet<Jelo> Jela { get; set; }
        public DbSet<Kuvar> Kuvari { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Porudzbina> Porudzbine { get; set; }
        public DbSet<PorudzbinaUser> PorudzbineUsers { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=RestoranNapredneNet;Integrated Security=True;");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Jelo>().ToTable("Jela");

            modelBuilder.Entity<Porudzbina>().HasMany(p => p.Jela).WithMany(a => a.Porudzbine);

            modelBuilder.Entity<PorudzbinaUser>().ToTable("PorudzbinaUser");
            modelBuilder.Entity<PorudzbinaUser>().HasKey(p => new { p.PorudzbinaId, p.UserId, p.DatumPorudzbine });
            modelBuilder.Entity<PorudzbinaUser>().HasOne(p => p.Porudzbina).WithMany(p => p.PorudzbineUsers).HasForeignKey(p => p.PorudzbinaId);
            modelBuilder.Entity<PorudzbinaUser>().HasOne(p => p.User).WithMany(p => p.PorudzbinaUsers).HasForeignKey(p => p.UserId);
        }
    }
}
