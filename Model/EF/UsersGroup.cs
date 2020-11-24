namespace Model.EF
{

    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    namespace Model.EF
    {
        [Table("UsersGroup")]
        public class UsersGroup
        {
            [Key]
            [StringLength(20)]
            public string ID { get; set; }

            [StringLength(50)]
            public string Name { get; set; }
        }
    }
}

