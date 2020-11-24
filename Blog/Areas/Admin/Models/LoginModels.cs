using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Blog.Areas.Admin.Models
{
    public class LoginModels
    {
        [Required(ErrorMessage = "Mời Nhập UserName")]
        public string UserName { set; get; }
        [Required(ErrorMessage = "Mời Nhập Password")]
        public string Password { set; get; }
        public bool RememberMe { set; get; }
    }
}