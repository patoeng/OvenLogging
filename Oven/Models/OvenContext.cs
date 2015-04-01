namespace Oven.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class OvenContext : DbContext
    {
        public OvenContext()
            : base("name=MYOVEN")
        {
        }

        public virtual DbSet<batchApproval> batchApprovals { get; set; }
        public virtual DbSet<BatchLOT> BatchLOTs { get; set; }
        public virtual DbSet<batchmonitor> batchmonitors { get; set; }
        public virtual DbSet<BatchPattern> BatchPatterns { get; set; }
        public virtual DbSet<HeatingBatch> HeatingBatches { get; set; }
        public virtual DbSet<logweek> logweeks { get; set; }
        public virtual DbSet<OvenDB> OvenDBs { get; set; }
        public virtual DbSet<OvenGraphSetting> OvenGraphSettings { get; set; }
        public virtual DbSet<OvenPattern> OvenPatterns { get; set; }
        public virtual DbSet<pm> pms { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<user> users { get; set; }
        public virtual DbSet<AlarmMonitor> AlarmMonitors { get; set; }
        public virtual DbSet<BatchTemperature> BatchTemperatures { get; set; }
        public virtual DbSet<pattern_fix> pattern_fix { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<batchApproval>()
                .Property(e => e.remarks)
                .IsUnicode(false);

            modelBuilder.Entity<batchApproval>()
                .Property(e => e.checked_by)
                .IsUnicode(false);

            modelBuilder.Entity<BatchLOT>()
                .Property(e => e.device)
                .IsUnicode(false);

            modelBuilder.Entity<BatchLOT>()
                .Property(e => e.package)
                .IsUnicode(false);

            modelBuilder.Entity<BatchLOT>()
                .Property(e => e.lotnumber)
                .IsUnicode(false);

            modelBuilder.Entity<BatchLOT>()
                .Property(e => e.loaded_by)
                .IsUnicode(false);

            modelBuilder.Entity<batchmonitor>()
                .Property(e => e._checked)
                .IsUnicode(false);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.stepnumber)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.start_level)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step1)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level1)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step2)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level2)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step3)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level3)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step4)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level4)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step5)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level5)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step6)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level6)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step7)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level7)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step8)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level8)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step9)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level9)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step10)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level10)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.step_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.level_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.alarm_wait)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.shutdown_level)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.allow_start_low)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.allow_start_high)
                .HasPrecision(4, 0);

            modelBuilder.Entity<BatchPattern>()
                .Property(e => e.interrupt_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<HeatingBatch>()
                .Property(e => e.OvenID)
                .IsUnicode(false);

            modelBuilder.Entity<HeatingBatch>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<HeatingBatch>()
                .Property(e => e.HeatingType)
                .IsUnicode(false);

            modelBuilder.Entity<HeatingBatch>()
                .Property(e => e.SetPoint1)
                .HasPrecision(8, 2);

            modelBuilder.Entity<HeatingBatch>()
                .Property(e => e.SetPoint2)
                .HasPrecision(8, 2);

            modelBuilder.Entity<HeatingBatch>()
                .Property(e => e.Tolerance)
                .HasPrecision(8, 2);

            modelBuilder.Entity<HeatingBatch>()
                .Property(e => e.dummyname)
                .IsUnicode(false);

            modelBuilder.Entity<HeatingBatch>()
                .HasOptional(e => e.BatchPattern)
                .WithRequired(e => e.HeatingBatch);

            modelBuilder.Entity<HeatingBatch>()
                .HasMany(e => e.AlarmMonitors)
                .WithRequired(e => e.HeatingBatch)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.lw)
                .IsUnicode(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.dateone)
                .IsUnicode(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.datework)
                .IsUnicode(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.machine)
                .IsUnicode(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.remarks)
                .IsUnicode(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<logweek>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.OvenID)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.HeatingType)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.SetPoint1)
                .HasPrecision(8, 2);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.SetPoint2)
                .HasPrecision(8, 2);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.tolerance)
                .HasPrecision(5, 2);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.ProbeIPAddr)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.AlarmIPAddr)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.IsRunning)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.lastalarm)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.barcode)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .Property(e => e.dateone)
                .IsUnicode(false);

            modelBuilder.Entity<OvenDB>()
                .HasOptional(e => e.OvenGraphSetting)
                .WithRequired(e => e.OvenDB);

            modelBuilder.Entity<OvenDB>()
                .HasOptional(e => e.OvenPattern)
                .WithRequired(e => e.OvenDB);

            modelBuilder.Entity<OvenDB>()
                .HasMany(e => e.pms)
                .WithRequired(e => e.OvenDB)
                .HasForeignKey(e => e.asset_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<OvenGraphSetting>()
                .Property(e => e.OvenID)
                .IsUnicode(false);

            modelBuilder.Entity<OvenGraphSetting>()
                .Property(e => e.upper_limit_color)
                .IsUnicode(false);

            modelBuilder.Entity<OvenGraphSetting>()
                .Property(e => e.lower_limit_color)
                .IsUnicode(false);

            modelBuilder.Entity<OvenGraphSetting>()
                .Property(e => e.target_color)
                .IsUnicode(false);

            modelBuilder.Entity<OvenGraphSetting>()
                .Property(e => e.background_color)
                .IsUnicode(false);

            modelBuilder.Entity<OvenGraphSetting>()
                .Property(e => e.graph_color)
                .IsUnicode(false);

            modelBuilder.Entity<OvenGraphSetting>()
                .Property(e => e.alias)
                .IsUnicode(false);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.OvenID)
                .IsUnicode(false);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.stepnumber)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.start_level)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step1)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level1)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step2)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level2)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step3)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level3)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step4)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level4)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step5)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level5)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step6)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level6)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step7)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level7)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step8)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level8)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step9)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level9)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step10)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level10)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.step_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.level_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.alarm_wait)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.shutdown_level)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.allow_start_low)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.allow_start_high)
                .HasPrecision(4, 0);

            modelBuilder.Entity<OvenPattern>()
                .Property(e => e.interrupt_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pm>()
                .Property(e => e.asset_id)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.logweek_id)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.todo)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.pic)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.remarks)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.dateone)
                .IsUnicode(false);

            modelBuilder.Entity<pm>()
                .Property(e => e.datework)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.fullname)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.role)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.dept)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.ern)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.grade)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.shift)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<AlarmMonitor>()
                .Property(e => e.error)
                .IsUnicode(false);

            modelBuilder.Entity<AlarmMonitor>()
                .Property(e => e.type)
                .IsUnicode(false);

            modelBuilder.Entity<BatchTemperature>()
                .Property(e => e.Temperature)
                .HasPrecision(8, 2);

            modelBuilder.Entity<BatchTemperature>()
                .Property(e => e.UOM)
                .IsUnicode(false);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.step1)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.level1)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.step2)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.level2)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.step3)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.level3)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.step4)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.level4)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.step5)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.level5)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.step_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.level_tolerancy)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.alarm_wait)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.shutdown_level)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.allow_start_low)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.allow_start_high)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.start_level)
                .HasPrecision(4, 0);

            modelBuilder.Entity<pattern_fix>()
                .Property(e => e.interrupt_tolerancy)
                .HasPrecision(4, 0);
        }

        public System.Data.Entity.DbSet<Oven.Models.AllStock> AllStocks { get; set; }
    }
}
