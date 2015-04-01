namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HeatingBatch")]
    public partial class HeatingBatch
    {
        public HeatingBatch()
        {
            batchApprovals = new HashSet<batchApproval>();
            AlarmMonitors = new HashSet<AlarmMonitor>();
        }

        [Key]
        public int BatchID { get; set; }

        [StringLength(20)]
        public string OvenID { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        [StringLength(10)]
        public string HeatingType { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? SetPoint1 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? SetPoint2 { get; set; }

        public int? Interval1 { get; set; }

        public int? Interval2 { get; set; }

        public int? Interval3 { get; set; }

        public int? TotalHeatTime { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? Tolerance { get; set; }

        [StringLength(20)]
        public string dummyname { get; set; }

        public bool is_overrided { get; set; }

        public int overrideid { get; set; }

        public bool is_dummy { get; set; }

        public bool manual { get; set; }

        public virtual ICollection<batchApproval> batchApprovals { get; set; }

        public virtual BatchPattern BatchPattern { get; set; }

        public virtual ICollection<AlarmMonitor> AlarmMonitors { get; set; }

        public virtual OvenDB OvenDB { get; set; }

    }
}
