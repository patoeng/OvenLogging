namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BatchLOT")]
    public partial class BatchLOT
    {
        public int id { get; set; }

        public int batchid { get; set; }

        [StringLength(20)]
        public string device { get; set; }

        [StringLength(20)]
        public string package { get; set; }

        [Required]
        [StringLength(12)]
        public string lotnumber { get; set; }

        public int qty { get; set; }

        [Required]
        [StringLength(12)]
        public string loaded_by { get; set; }

        public DateTime? date { get; set; }
    }
}
