namespace Oven.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("BatchTemperature")]
    public partial class BatchTemperature
    {
        [Key]
        public int id { get; set; }
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int BatchID { get; set; }
        public int? FetchTime { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? Temperature { get; set; }

        [StringLength(50)]
        public string UOM { get; set; }

    }
}
