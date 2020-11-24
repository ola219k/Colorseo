using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

namespace Blog.Controllers
{
    public class PostController : Controller
    {
        // GET: Post
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult PostCategory()
        {
            var model = new PostCategoryDao().ListAll();
            return PartialView(model);
        }

        public JsonResult ListName(string q)
        {
            var data = new PostDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Category(long cateId, int page = 1, int pageSize = 4)
        {
            var category = new CategoryDao().ViewDetail(cateId);
            ViewBag.Category = category;
            int totalRecord = 0;
            var model = new PostDao().ListByCategoryId(cateId, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
                
            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult Search(string keyword, int page = 1, int pageSize = 1)
        {
            int totalRecord = 0;
            var model = new PostDao().Search(keyword, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.Keyword = keyword;
            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        [OutputCache(CacheProfile = "Cache1DayForPost")]
        public ActionResult Detail(long id)
        {
            var Post = new PostDao().ViewDetail(id);
            ViewBag.category = new PostCategoryDao().ViewDetail(Post.CategoryID.Value);
            ViewBag.RelatedPosts = new PostDao().ListRelatedPosts(id);
            return View(Post);
        }
    }
}