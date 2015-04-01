namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class pattern_fix
    {
        [Key]
        [Column(Order = 0, TypeName = "numeric")]
        public decimal step1 { get; set; }

        [Key]
        [Column(Order = 1, TypeName = "numeric")]
        public decimal level1 { get; set; }

        [Key]
        [Column(Order = 2, TypeName = "numeric")]
        public decimal step2 { get; set; }

        [Key]
        [Column(Order = 3, TypeName = "numeric")]
        public decimal level2 { get; set; }

        [Key]
        [Column(Order = 4, TypeName = "numeric")]
        public decimal step3 { get; set; }

        [Key]
        [Column(Order = 5, TypeName = "numeric")]
        public decimal level3 { get; set; }

        [Key]
        [Column(Order = 6, TypeName = "numeric")]
        public decimal step4 { get; set; }

        [Key]
        [Column(Order = 7, TypeName = "numeric")]
        public decimal level4 { get; set; }

        [Key]
        [Column(Order = 8, TypeName = "numeric")]
        public decimal step5 { get; set; }

        [Key]
        [Column(Order = 9, TypeName = "numeric")]
        public decimal level5 { get; set; }

        [Key]
        [Column(Order = 10, TypeName = "numeric")]
        public decimal step_tolerancy { get; set; }

        [Key]
        [Column(Order = 11, TypeName = "numeric")]
        public decimal level_tolerancy { get; set; }

        [Key]
        [Column(Order = 12, TypeName = "numeric")]
        public decimal alarm_wait { get; set; }

        [Key]
        [Column(Order = 13, TypeName = "numeric")]
        public decimal shutdown_level { get; set; }

        [Key]
        [Column(Order = 14, TypeName = "numeric")]
        public decimal allow_start_low { get; set; }

        [Key]
        [Column(Order = 15, TypeName = "numeric")]
        public decimal allow_start_high { get; set; }

        [Key]
        [Column(Order = 16, TypeName = "numeric")]
        public decimal start_level { get; set; }

        [Key]
        [Column(Order = 17, TypeName = "numeric")]
        public decimal interrupt_tolerancy { get; set; }
    }
}
