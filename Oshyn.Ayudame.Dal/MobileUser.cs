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
    
    public partial class MobileUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MobileUser()
        {
            this.Requests = new HashSet<Request>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string MobileId { get; set; }
        public string Email { get; set; }
        public byte[] Photo { get; set; }
        public int RoleId { get; set; }
        public string LastName { get; set; }
        public string MobileType { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Request> Requests { get; set; }
    }
}
