namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OvenPattern")]
    public partial class OvenPattern
    {
        [Key]
        [StringLength(20)]
        public string OvenID { get; set; }

        [Column(TypeName = "numeric")]
        public decimal stepnumber { get; set; }

        [Column(TypeName = "numeric")]
        public decimal start_level { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step1 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level1 { get; set; }

        public bool guard1 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step2 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level2 { get; set; }

        public bool guard2 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step3 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level3 { get; set; }

        public bool guard3 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step4 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level4 { get; set; }

        public bool guard4 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step5 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level5 { get; set; }

        public bool guard5 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step6 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level6 { get; set; }

        public bool guard6 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step7 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level7 { get; set; }

        public bool guard7 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step8 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level8 { get; set; }

        public bool guard8 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step9 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level9 { get; set; }

        public bool guard9 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step10 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level10 { get; set; }

        public bool guard10 { get; set; }

        [Column(TypeName = "numeric")]
        public decimal step_tolerancy { get; set; }

        [Column(TypeName = "numeric")]
        public decimal level_tolerancy { get; set; }

        [Column(TypeName = "numeric")]
        public decimal alarm_wait { get; set; }

        [Column(TypeName = "numeric")]
        public decimal shutdown_level { get; set; }

        [Column(TypeName = "numeric")]
        public decimal allow_start_low { get; set; }

        [Column(TypeName = "numeric")]
        public decimal allow_start_high { get; set; }

        [Column(TypeName = "numeric")]
        public decimal interrupt_tolerancy { get; set; }

        public bool autoprint { get; set; }

        public bool stretch { get; set; }

        public int stretch_value { get; set; }

        public bool BigScreen_blink_on_error { get; set; }

        public virtual OvenDB OvenDB { get; set; }
    }
}
