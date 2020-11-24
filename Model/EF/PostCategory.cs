namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PostCategory")]
    public partial class PostCategory
    {
        public long ID { get; set; }

        [StringLength(250)]
        public string Title { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        public long? ParentID { get; set; }

        public int? DisplayOrder { get; set; }

        [StringLength(250)]
        public string SeoTitle { get; set; }

        public DateTime? CreatedDate { get; set; }


        public DateTime? ModifiledDate { get; set; }


        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MeteDescriptions { get; set; }

        public bool? Status { get; set; }

        public bool? ShowOnHome { get; set; }
    }
}
