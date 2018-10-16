using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebStore.Models;
namespace WebStore.Controllers
{
    public class SubCategoriesController : Controller
    {
        // GET: SubCategories
        public ActionResult SubCategories()
        {
            Models. SubCategories SA = new Models.SubCategories();

            List<AttributeItem> itemlist = new List<AttributeItem>();

            itemlist.Add(new AttributeItem { AttributeID = 0, Attributename = "Has Size", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 1, Attributename = "Has Color", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 2, Attributename = "Has High", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 3, Attributename = "Has Wight", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 4, Attributename = "Has Width", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 5, Attributename = "Has Description", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 6, Attributename = "Has Gender", IsSelected = true });

            //AttributeModel subcat = new AttributeModel();
            using (WebStoreDBEntities1 db =new WebStoreDBEntities1() )
            {
                List<MainCategories> MainCat_List = db.MainCategories.ToList();
                ViewBag.CategoriesList = new SelectList(MainCat_List, "MainCategoryID", "MainCategoryName");
                List<SubCategories> sub_List = db.SubCategories.ToList();
              
                ViewBag.subcatList = new SelectList(sub_List, "SubCategoryID", "SubCategoryName");
                SA.selectedAttribute = itemlist;
                ViewBag.ItemAttribute = SA.selectedAttribute;
            }
            return View(SA);
        }
        [HttpPost]
        public ActionResult SubCategories(SubCategories model)
        {
            var selectedAttribute = model.selectedAttribute.Where(x => x.IsSelected == true).ToList();
            return Content(string.Join(",", selectedAttribute.Select(x => x.Attributename)));

        }
    }
}