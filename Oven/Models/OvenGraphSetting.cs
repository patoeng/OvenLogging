namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OvenGraphSetting")]
    public partial class OvenGraphSetting
    {
        [Key]
        [StringLength(20)]
        public string OvenID { get; set; }

        public short max_x { get; set; }

        public short max_y { get; set; }

        public short ticksize { get; set; }

        public short limit { get; set; }

        public short limit_tolerance { get; set; }

        [Required]
        [StringLength(10)]
        public string upper_limit_color { get; set; }

        [Required]
        [StringLength(10)]
        public string lower_limit_color { get; set; }

        [Required]
        [StringLength(10)]
        public string target_color { get; set; }

        [Required]
        [StringLength(10)]
        public string background_color { get; set; }

        [Required]
        [StringLength(50)]
        public string graph_color { get; set; }

        [StringLength(50)]
        public string alias { get; set; }

        public virtual OvenDB OvenDB { get; set; }
    }
}
