namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("batchApproval")]
    public partial class batchApproval
    {
        public int id { get; set; }

        public int? batchid { get; set; }

        [Column("checked")]
        public bool _checked { get; set; }

        public bool? result { get; set; }

        public string remarks { get; set; }

        [StringLength(50)]
        public string checked_by { get; set; }

        public DateTime? check_date { get; set; }

        public bool? production { get; set; }

        public virtual HeatingBatch HeatingBatch { get; set; }
    }
}
