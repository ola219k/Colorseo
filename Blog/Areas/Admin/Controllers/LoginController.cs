using Common;
using Model.Dao;
using Blog.Common;
using Blog.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.Areas.Admin.Models;

namespace Blog.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        public string USER_SESSION { get; private set; }

        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session[CommonConstans.USER_SESSION] = null;
            return Redirect("/Admin/Login");
        }

        public ActionResult Login(LoginModels model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UsersDao();
                var result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password), true);
                if (result == 1)
                {
                    var user = dao.GetById(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    userSession.GroupID = user.GroupID;

                    var listCredentials = dao.GetListCredential(model.UserName);
                    Session.Add(CommonConstans.USER_SESSION, userSession);
                    Session.Add(CommonConstans.SESSION_CREDENTIALS, listCredentials);

                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập.");
                }
                else
                {
                    ModelState.AddModelError("", "đăng nhập không đúng.");
                }
            }
            return View("Index");
        }
    }
}