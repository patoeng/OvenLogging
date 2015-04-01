namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("user")]
    public partial class user
    {
        public int id { get; set; }

        [Required]
        [StringLength(50)]
        public string username { get; set; }

        [StringLength(50)]
        public string fullname { get; set; }

        [Required]
        [StringLength(100)]
        public string password { get; set; }

        public byte? isactive { get; set; }

        [StringLength(50)]
        public string role { get; set; }

        [StringLength(50)]
        public string dept { get; set; }

        [StringLength(50)]
        public string ern { get; set; }

        [StringLength(50)]
        public string grade { get; set; }

        public DateTime? created_at { get; set; }

        public DateTime? updated_at { get; set; }

        [StringLength(50)]
        public string shift { get; set; }

        [StringLength(100)]
        public string email { get; set; }

        public bool? email_reciever { get; set; }
    }
}
