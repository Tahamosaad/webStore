using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebStore.Models;
namespace WebStore.Controllers
{
    public class AdminToolController : Controller
    {
        WebStoreDBEntities1 db = new WebStoreDBEntities1();
        // GET: Test

        public ActionResult Index()
        {
            List<MainCategories> MainCat_List = db.MainCategories.ToList();
            ViewBag.CategoriesList = new SelectList(MainCat_List, "MainCategoryID", "MainCategoryName");

            return View(db.SubCategories.ToList());

        }
        public ActionResult AddCategory()
        {

            return View();
        }
        [HttpPost]
        public ActionResult AddCategory(MainCategories MainCat)
        {
            try
            {
                MainCategories Cat = new MainCategories();
                Cat.MainCategoryName = MainCat.MainCategoryName;
                db.MainCategories.Add(Cat);
                db.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }

            return RedirectToAction("Index");
        }
        public ActionResult SubCategory()
        {
            List<AttributeItem> itemlist = new List<AttributeItem>();
            itemlist.Add(new AttributeItem { AttributeID = 1, AttributeName = "Has Size", isSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 2, AttributeName = "Has Color", isSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 3, AttributeName = "Has High", isSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 4, AttributeName = "Has Wight", isSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 5, AttributeName = "Has Width", isSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 6, AttributeName = "Has Description", isSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 7, AttributeName = "Has Gender", isSelected = true });

            List<MainCategories> MainCat_List = db.MainCategories.ToList();
            ViewBag.CategoriesList = new SelectList(MainCat_List, "MainCategoryID", "MainCategoryName");
            ViewBag.ItemAttribute = itemlist;
            return View();
        }
        [HttpPost]
        public ActionResult SubCategory(SubCategories subcategories)
        {
            try
            {
                SubCategories Cat = new SubCategories();
                Cat.SubCategoryName = subcategories.SubCategoryName;
                Cat.MainCat_ID = subcategories.MainCat_ID;
                db.SubCategories.Add(Cat);
                db.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }

            return RedirectToAction("Index");
        }
        //public ActionResult Attributes()
        //{
        //    List<SubCategories> sub_List = db.SubCategories.ToList();
        //    ViewBag.subcatList = new SelectList(sub_List, "SubCategoryID", "SubCategoryName");
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult Attributes(Attributes attributes)
        //{
        //    try
        //    {
        //        Attributes att = new Attributes();
        //        att.Color = attributes.Color;
        //        att.Hight = attributes.Hight;
        //        att.Size = attributes.Size;
        //        att.Width = attributes.Width;
        //        att.Wight = attributes.Wight;
        //        att.Gender = attributes.Gender;
        //        att.Describtion = attributes.Describtion;
        //        db.Attributes.Add(att);
        //        db.SaveChanges();
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }

        //    return RedirectToAction("Index");
        //}

    }
    }