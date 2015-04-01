namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("batchmonitor")]
    public partial class batchmonitor
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Batchid { get; set; }

        public short startstep { get; set; }

        public short laststep { get; set; }

        [Column("checked")]
        [Required]
        [StringLength(1)]
        public string _checked { get; set; }

        public bool first { get; set; }
    }
}
