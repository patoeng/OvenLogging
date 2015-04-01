namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("all_stock_hourly")]
    public class AllStock
    {
        public int id { get; set; }
        [StringLength(50)]
        public string process_class { get; set; }
        [StringLength(50)]
        public string product_type { get; set; }
        [StringLength(50)]
        public string operation { get; set; }
        [StringLength(50)]
        public string qty { get; set; }
        [StringLength(50)]
        public string equipment { get; set; }
        [StringLength(50)]
        public string facility { get; set; }
        public DateTime date { get; set; }
    }
}