namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Category")]
    public partial class Category
    {
        public long ID { get; set; }

        [StringLength(250)]
        [Display(Name="Category_Name", ResourceType = typeof(StaticResource.Resources))]
        [Required(ErrorMessageResourceName="Category_RequiredName", ErrorMessageResourceType =typeof(StaticResource.Resources))]
        public string Name { get; set; }

        [StringLength(250)]
        [Display(Name = "Category_MetaTitle", ResourceType = typeof(StaticResource.Resources))]
        public string MetaTitle { get; set; }

        [Display(Name = "Category_ParentID", ResourceType = typeof(StaticResource.Resources))]
        public long? ParentID { get; set; }

        [Display(Name = "Category_DisplayOrder", ResourceType = typeof(StaticResource.Resources))]
        public int? DisplayOrder { get; set; }

        [StringLength(250)]
        [Display(Name = "Category_SeoTitle", ResourceType = typeof(StaticResource.Resources))]
        public string SeoTitle { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiledDate { get; set; }

        [StringLength(50)]
        public string ModifiledBy { get; set; }

        [StringLength(250)]
        [Display(Name = "Category_MetaKeywords", ResourceType = typeof(StaticResource.Resources))]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        [Display(Name = "Category_MeteDescriptions", ResourceType = typeof(StaticResource.Resources))]
        public string MeteDescriptions { get; set; }

        [Display(Name = "Category_Status", ResourceType = typeof(StaticResource.Resources))]
        public bool? Status { get; set; }

        [Display(Name = "Category_ShowOnHome", ResourceType = typeof(StaticResource.Resources))]
        public bool? ShowOnHome { get; set; }

        public string Language { set; get; }
    }
}
