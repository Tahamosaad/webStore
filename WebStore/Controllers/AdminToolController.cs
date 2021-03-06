﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
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
            Models.SubCategories SA = new Models.SubCategories();
            List<AttributeItem> itemlist = new List<AttributeItem>();
            itemlist.Add(new AttributeItem { AttributeID = 0, Attributename = "Has Size", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 1, Attributename = "Has Color", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 2, Attributename = "Has High", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 3, Attributename = "Has Wight", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 4, Attributename = "Has Width", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 5, Attributename = "Has Description", IsSelected = true });
            itemlist.Add(new AttributeItem { AttributeID = 6, Attributename = "Has Gender", IsSelected = true });

            using (WebStoreDBEntities1 db = new WebStoreDBEntities1())
            {
                List<MainCategories> MainCat_List = db.MainCategories.ToList();
                ViewBag.CategoriesList = new SelectList(MainCat_List, "MainCategoryID", "MainCategoryName");
                List<SubCategories> sub_List = db.SubCategories.ToList();

                ViewBag.subcatList = new SelectList(sub_List, "SubCategoryID", "SubCategoryName");
                SA.selectedAttribute = itemlist;
                ViewBag.ItemAttribute = itemlist;
            }
            return View(SA);
        }
        [HttpPost]
        public ActionResult SubCategory(SubCategories subcategories)
        {
            var selectedAttribute = subcategories.selectedAttribute.Where(x => x.IsSelected == true).ToList();

            try
            {
                SubCategories Cat = new SubCategories();
                AttributeItem att = new AttributeItem();
                Cat.SubCategoryName = subcategories.SubCategoryName;
                Cat.MainCat_ID = subcategories.MainCat_ID;
                //Cat.selectedAttribute = subcategories.selectedAttribute;
                Cat.SelectedAttributes = string.Join(",", selectedAttribute.Select(x => x.AttributeID));
                db.SubCategories.Add(Cat);
                db.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                
            }

            return RedirectToAction("Index");
        }
        //[HttpPost]

        //public JsonResult Savelist(string itemList)
        //{

        //    string[] checkedarray = itemList.Split(',');
        //    foreach (var item in checkedarray)
        //    {
        //        var x = item;
        //    }
        //    return Json("", JsonRequestBehavior.AllowGet);
        //}
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