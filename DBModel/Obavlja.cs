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
    
    public partial class Obavlja
    {
        public int MagacionerMbr { get; set; }
        public int TransportId { get; set; }
    
        public virtual Magacioner Magacioner { get; set; }
        public virtual Transport Transport { get; set; }
    }
}
