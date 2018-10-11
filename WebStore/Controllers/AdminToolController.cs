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
            List<MainCategories> MainCat_List = db.MainCategories.ToList();
            ViewBag.CategoriesList = new SelectList(MainCat_List, "MainCategoryID", "MainCategoryName");
            ViewBag.Attribute_idx = db.Attributes_Index.ToList();
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