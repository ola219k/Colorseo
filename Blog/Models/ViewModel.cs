using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Blog.Models
{
    public class ViewModel
    {
        [Key]
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Bạn phải nhập tài khoản")]
        public string UserName { set; get; }

        [Required(ErrorMessage = "Bạn phải nhập mật khẩu")]
        [Display(Name = "Mật khẩu")]
        public string Password { set; get; }

        [Required(ErrorMessage = "Bạn phải nhập mật khẩu mới")]
        [Display(Name = "Mật khẩu mới")]
        public string NewPassword { set; get; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Yêu cầu nhập email.")]
        public string Email { set; get; }

        [Display(Name = "Số điện thoại")]
        public string Phone { set; get; }
    }
}