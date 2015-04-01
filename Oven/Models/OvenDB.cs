namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OvenDB")]
    public partial class OvenDB
    {
        public OvenDB()
        {
            HeatingBatches = new HashSet<HeatingBatch>();
            pms = new HashSet<pm>();
        }

        [Key]
        [StringLength(20)]
        public string OvenID { get; set; }

        [StringLength(20)]
        public string HeatingType { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? SetPoint1 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? SetPoint2 { get; set; }

        public int? interval1 { get; set; }

        public int? interval2 { get; set; }

        public int? interval3 { get; set; }

        public int? totalHeatTime { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? tolerance { get; set; }

        [StringLength(15)]
        public string ProbeIPAddr { get; set; }

        public int? ProbeUDPPort { get; set; }

        [StringLength(15)]
        public string AlarmIPAddr { get; set; }

        public int? AlarmUDPPort { get; set; }

        [StringLength(1)]
        public string IsRunning { get; set; }

        [StringLength(50)]
        public string lastalarm { get; set; }

        public DateTime? created_at { get; set; }

        public DateTime? updated_at { get; set; }

        [StringLength(50)]
        public string status { get; set; }

        [StringLength(50)]
        public string barcode { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public int alarm_main { get; set; }

        [StringLength(20)]
        public string dateone { get; set; }

        public int? blinkalarm { get; set; }

        public bool? alarmautofixed { get; set; }

        public int? alarmFetchStart { get; set; }

        public short? currentBatchStep { get; set; }

        public virtual ICollection<HeatingBatch> HeatingBatches { get; set; }

        public virtual OvenGraphSetting OvenGraphSetting { get; set; }

        public virtual OvenPattern OvenPattern { get; set; }

        public virtual ICollection<pm> pms { get; set; }

        public string ovenStatus { get { return IsRunning; } }
        public string ovenSetting { get { return "/GraphSettings/Edit/" + OvenID; } }
    }
}
