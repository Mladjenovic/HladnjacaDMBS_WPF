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
    using System.Collections.Generic;
    
    public partial class Karton
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Karton()
        {
            this.Otkupljujes = new HashSet<Otkupljuje>();
        }
    
        public int Id { get; set; }
        public string Vrsta { get; set; }
        public int UgovorId { get; set; }
        public int UgovorKlijentId { get; set; }
        public int UgovorHladnjacaId { get; set; }
    
        public virtual Ugovor Ugovor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Otkupljuje> Otkupljujes { get; set; }
    }
}
