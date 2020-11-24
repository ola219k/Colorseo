using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using Model.Dao;
using Model.EF;
using Blog.Common;
using PagedList.Mvc;

namespace Blog.Areas.Admin.Controllers
{
    public class UsersController : BaseController
    {
        // GET: Admin/User
        [HasCredential(RoleID = "VIEW_USER")]
        public ActionResult Index(string searchString ,int page = 1, int pageSize = 10)
        {
            var dao = new UsersDao();
            var model = dao.listAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            return View();
        }

        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id)
        {
            var user = new UsersDao().ViewDetail(id);
            return View(user);
        }

        [HttpPost]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create(Users user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UsersDao();
                var encryptedMD5Pas = Encryptor.MD5Hash(user.Password);
                user.Password = encryptedMD5Pas;

                long id = dao.Insert(user);
                if (id > 0)
                {
                    SetAlert("Thêm người dùng thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm người dùng không thành công");
                }
            }
            return View("Index");
        }

        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(Users user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UsersDao();
                if (!string.IsNullOrEmpty(user.Password))
                {
                    var encryptedMD5Pas = Encryptor.MD5Hash(user.Password);
                    user.Password = encryptedMD5Pas;
                }
                var result = dao.Update(user);
                if (result)
                {
                    SetAlert("Sửa người dùng thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Sửa người dùng không thành công");
                }
            }
            return View("Index");
        }

        [HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            if(new UsersDao().Delete(id))
            {
                SetAlert("Xóa người dùng thành công", "success");
            }
            
            return RedirectToAction("Index");
        }

        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public JsonResult ChangeStatus(long id)
        {
            var result = new UsersDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}