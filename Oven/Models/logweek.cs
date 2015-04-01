namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("logweek")]
    public partial class logweek
    {
        public int id { get; set; }

        [StringLength(10)]
        public string lw { get; set; }

        public int? cw { get; set; }

        public int? yr { get; set; }

        [StringLength(20)]
        public string dateone { get; set; }

        [StringLength(20)]
        public string datework { get; set; }

        [StringLength(20)]
        public string machine { get; set; }

        [StringLength(20)]
        public string status { get; set; }

        [StringLength(255)]
        public string remarks { get; set; }

        public DateTime? created_at { get; set; }

        public DateTime? updated_at { get; set; }

        [StringLength(25)]
        public string created_by { get; set; }

        [StringLength(25)]
        public string updated_by { get; set; }
    }
}
