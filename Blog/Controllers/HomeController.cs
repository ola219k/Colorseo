using Model.Dao;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.Common;
using Blog.Models;

namespace Blog.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var postDao = new PostDao();
            ViewBag.NewPosts = postDao.ListNewPost(4);
            ViewBag.ListFeaturePosts = postDao.ListFeaturePost(4);
            //set seo title
            ViewBag.Title = ConfigurationManager.AppSettings["HomeTitle"];
            ViewBag.Keywords = ConfigurationManager.AppSettings["HomeKeyword"];
            ViewBag.Descriptions = ConfigurationManager.AppSettings["HomeDescriptions"];
            return View();
        }

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var model = new MenuDao().ListByGroupId(1);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            var model = new MenuDao().ListByGroupId(2);
            return PartialView(model);
        }


        /*[ChildActionOnly]
        public ActionResult Footer()
        {
            var model = new FooterDao().GetFooter();
            return PartialView(model);
        }*/
    }
}