//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class HladnjacaDBContext : DbContext
    {
        public HladnjacaDBContext()
            : base("name=HladnjacaDBContext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Hladnjaca> Hladnjacas { get; set; }
        public virtual DbSet<Komora> Komoras { get; set; }
        public virtual DbSet<OrganizacionaJedinica> OrganizacionaJedinicas { get; set; }
        public virtual DbSet<Zaposleni> Zaposlenis { get; set; }
        public virtual DbSet<Klijent> Klijents { get; set; }
        public virtual DbSet<Ugovor> Ugovors { get; set; }
        public virtual DbSet<Karton> Kartons { get; set; }
        public virtual DbSet<Voce> Voces { get; set; }
        public virtual DbSet<Predaje> Predajes { get; set; }
        public virtual DbSet<Otkupljuje> Otkupljujes { get; set; }
        public virtual DbSet<Transport> Transports { get; set; }
        public virtual DbSet<PrenosiSe> PrenosiSes { get; set; }
        public virtual DbSet<Obavlja> Obavljas { get; set; }
        public virtual DbSet<SmestaSe> SmestaSes { get; set; }
    }
}
