using Model.Dao;
using Model.EF;
using Blog.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml.Linq;

namespace Blog.Areas.Admin.Controllers
{
    public class PostController : BaseController
    {
        // GET: Admin/Post

        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new PostDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);

            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        public JsonResult LoadImages(long id)
        {
            PostDao dao = new PostDao();
            var Post = dao.ViewDetail(id);
            var images = Post.MoreImages;
            XElement xImages = XElement.Parse(images);
            List<string> listImagesReturn = new List<string>();

            foreach (XElement element in xImages.Elements())
            {
                listImagesReturn.Add(element.Value);
            }
            return Json(new
            {
                data = listImagesReturn
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveImages(long id, string images)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var listImages = serializer.Deserialize<List<string>>(images);

            XElement xElement = new XElement("Images");

            foreach (var item in listImages)
            {
                var subStringItem = item.Substring(21);
                xElement.Add(new XElement("Image", subStringItem));
            }
            PostDao dao = new PostDao();
            try
            {
                dao.UpdateImages(id, xElement.ToString());
                return Json(new
                {
                    status = true
                });
            }
            catch (Exception)
            {
                return Json(new
                {
                    status = false
                });
            }

        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Post model)
        {
            if (ModelState.IsValid)
            {
                var session = (UserLogin)Session[CommonConstans.USER_SESSION];
                var culture = Session[CommonConstans.CurrentCulture];
                new PostDao().Create(model);
                return RedirectToAction("Index");
            }
            SetViewBag();
            return View();
        }

        public void SetViewBag(long? selectedId = null)
        {
            var dao = new PostCategoryDao();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }
    }
}
