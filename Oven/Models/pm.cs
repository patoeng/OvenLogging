namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("pm")]
    public partial class pm
    {
        public int id { get; set; }

        [Required]
        [StringLength(20)]
        public string asset_id { get; set; }

        [Required]
        [StringLength(10)]
        public string logweek_id { get; set; }

        [StringLength(30)]
        public string todo { get; set; }

        [StringLength(30)]
        public string pic { get; set; }

        [Required]
        [StringLength(30)]
        public string status { get; set; }

        [StringLength(255)]
        public string remarks { get; set; }

        public DateTime? created_at { get; set; }

        public DateTime? updated_at { get; set; }

        [StringLength(25)]
        public string created_by { get; set; }

        [StringLength(25)]
        public string updated_by { get; set; }

        [StringLength(20)]
        public string dateone { get; set; }

        [StringLength(20)]
        public string datework { get; set; }

        public int? yr { get; set; }

        public virtual OvenDB OvenDB { get; set; }
    }
}
