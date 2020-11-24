namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Post")]
    public partial class Post
    {
        public long ID { get; set; }

        public long AuthorID { get; set; }
        public long ParentID { get; set; }


        [StringLength(75)]
        public string Title { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        public string Summary { get; set; }
        [StringLength(250)]
        public string Image { get; set; }

        [Column(TypeName = "xml")]
         public string MoreImages { get; set; }

        public int? Published { get; set; }

        public long? CategoryID { get; set; }

        // [Column(TypeName = "ntext")]
        // public string Detail { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MeteDescriptions { get; set; }
            
        [StringLength(2500)]
        public string Content { get; set; }

        public bool? Status { get; set; }

        public DateTime? TopHot { get; set; }

        public int? ViewCount { get; set; }
    }
}
