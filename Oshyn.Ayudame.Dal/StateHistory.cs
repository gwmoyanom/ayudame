//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Oshyn.Ayudame.Dal
{
    using System;
    using System.Collections.Generic;
    
    public partial class StateHistory
    {
        public long Id { get; set; }
        public string Order { get; set; }
        public int State { get; set; }
        public long ItemId { get; set; }
        public System.DateTime CreationDate { get; set; }
        public Nullable<System.DateTime> ModifyDate { get; set; }
    
        public virtual Element Element { get; set; }
    }
}
