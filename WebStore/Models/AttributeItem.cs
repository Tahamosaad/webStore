using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebStore.Models
{
    public class AttributeItem
    {
        public int itemID { get; set; }
        public string itemName { get; set; }
        public bool isSelected { get; set; }
    }
}