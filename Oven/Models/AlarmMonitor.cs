namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AlarmMonitor")]
    public partial class AlarmMonitor
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int batchid { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int started { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int duration { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(200)]
        public string error { get; set; }

        public int? step { get; set; }

        [StringLength(1)]
        public string type { get; set; }

        public virtual HeatingBatch HeatingBatch { get; set; }
    }
}
