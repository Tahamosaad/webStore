//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebStore.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Attributes_Index
    {
        public int SubCat_ID { get; set; }
        public bool has_Size { get; set; }
        public bool has_Wight { get; set; }
        public bool has_Hight { get; set; }
        public bool has_Width { get; set; }
        public bool has_Color { get; set; }
        public bool has_Gender { get; set; }
        public bool has_Describtion { get; set; }
    
        public virtual SubCategories SubCategories { get; set; }
    }
}