using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Blog.Models
{
    public class RegisterModel
    {
        [Key]
        public long ID { set; get; }
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage ="Yêu cầu nhập tên đăng nhập.")]
        public string UserName { set; get; }

        [Display(Name = "Mật khẩu")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "Độ dài mật khẩu ít nhất 6 ký tự.")]
        [Required(ErrorMessage = "Yêu cầu nhập mật khẩu.")]
        public string Password { set; get; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("Password", ErrorMessage = "Xác nhận mật khẩu không đúng.")]
        public string ConfirmPassword { set; get; }

        [Display(Name = "Họ")]
        [Required(ErrorMessage = "Yêu cầu nhập họ cua ban.")]
        public string FirstName { set; get; }

        [Display(Name = "Ten")]
        [Required(ErrorMessage = "Yêu cầu nhập ten cua ban.")]
        public string LastName { set; get; }

        [Display(Name = "Địa chỉ")] 
        public string Address { set; get; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Yêu cầu nhập email.")]
        public string Email { set; get; }

        [Display(Name = "Số điện thoại")]
        public string Phone { set; get; }

        [Display(Name = "Tỉnh/thành")]
        public string  ProvinceID { set; get; }

        [Display(Name = "Quận/huyện")]
        public string DistrictID { set; get; }
    }
}