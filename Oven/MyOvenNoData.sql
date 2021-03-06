USE [master]
GO
/****** Object:  Database [MYOVEN]    Script Date: 04/13/2015 15:23:11 ******/
CREATE DATABASE [MYOVEN] ON  PRIMARY 
( NAME = N'MYOVEN', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MYOVEN.mdf' , SIZE = 756224KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MYOVEN_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MYOVEN_1.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MYOVEN] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MYOVEN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MYOVEN] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MYOVEN] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MYOVEN] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MYOVEN] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MYOVEN] SET ARITHABORT OFF
GO
ALTER DATABASE [MYOVEN] SET AUTO_CLOSE ON
GO
ALTER DATABASE [MYOVEN] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MYOVEN] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MYOVEN] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MYOVEN] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MYOVEN] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MYOVEN] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MYOVEN] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MYOVEN] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MYOVEN] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MYOVEN] SET  DISABLE_BROKER
GO
ALTER DATABASE [MYOVEN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MYOVEN] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MYOVEN] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MYOVEN] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MYOVEN] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MYOVEN] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MYOVEN] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MYOVEN] SET  READ_WRITE
GO
ALTER DATABASE [MYOVEN] SET RECOVERY SIMPLE
GO
ALTER DATABASE [MYOVEN] SET  MULTI_USER
GO
ALTER DATABASE [MYOVEN] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MYOVEN] SET DB_CHAINING OFF
GO
USE [MYOVEN]
GO
/****** Object:  Table [dbo].[BatchAlarm]    Script Date: 04/13/2015 15:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchAlarm](
	[BatchID] [int] NULL,
	[Alarm] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_stock_hourly]    Script Date: 04/13/2015 15:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[all_stock_hourly](
	[lot] [varchar](50) NULL,
	[process_class] [varchar](50) NULL,
	[product_type] [varchar](50) NULL,
	[operation] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[equipment] [varchar](50) NULL,
	[facility] [varchar](50) NULL,
	[date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[batchmonitor]    Script Date: 04/13/2015 15:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[batchmonitor](
	[Batchid] [int] NOT NULL,
	[startstep] [smallint] NOT NULL,
	[laststep] [smallint] NOT NULL,
	[checked] [varchar](1) NOT NULL,
	[first] [bit] NOT NULL,
 CONSTRAINT [PK_batchmonitor] PRIMARY KEY CLUSTERED 
(
	[Batchid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BatchLOT]    Script Date: 04/13/2015 15:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BatchLOT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[batchid] [int] NOT NULL,
	[device] [varchar](20) NULL,
	[package] [varchar](20) NULL,
	[lotnumber] [varchar](12) NOT NULL,
	[qty] [int] NOT NULL,
	[loaded_by] [varchar](12) NOT NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_BatchLOT_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_Table] UNIQUE NONCLUSTERED 
(
	[batchid] ASC,
	[lotnumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pattern_fix]    Script Date: 04/13/2015 15:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pattern_fix](
	[step1] [numeric](4, 0) NOT NULL,
	[level1] [numeric](4, 0) NOT NULL,
	[step2] [numeric](4, 0) NOT NULL,
	[level2] [numeric](4, 0) NOT NULL,
	[step3] [numeric](4, 0) NOT NULL,
	[level3] [numeric](4, 0) NOT NULL,
	[step4] [numeric](4, 0) NOT NULL,
	[level4] [numeric](4, 0) NOT NULL,
	[step5] [numeric](4, 0) NOT NULL,
	[level5] [numeric](4, 0) NOT NULL,
	[step_tolerancy] [numeric](4, 0) NOT NULL,
	[level_tolerancy] [numeric](4, 0) NOT NULL,
	[alarm_wait] [numeric](4, 0) NOT NULL,
	[shutdown_level] [numeric](4, 0) NOT NULL,
	[allow_start_low] [numeric](4, 0) NOT NULL,
	[allow_start_high] [numeric](4, 0) NOT NULL,
	[start_level] [numeric](4, 0) NOT NULL,
	[interrupt_tolerancy] [numeric](4, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 04/13/2015 15:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[fullname] [varchar](50) NULL,
	[password] [varchar](100) NOT NULL,
	[isactive] [tinyint] NULL,
	[role] [varchar](50) NULL,
	[dept] [varchar](50) NULL,
	[ern] [varchar](50) NULL,
	[grade] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[shift] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[email_reciever] [bit] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OvenDB]    Script Date: 04/13/2015 15:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OvenDB](
	[OvenID] [varchar](20) NOT NULL,
	[HeatingType] [varchar](20) NULL,
	[SetPoint1] [numeric](8, 2) NULL,
	[SetPoint2] [numeric](8, 2) NULL,
	[interval1] [int] NULL,
	[interval2] [int] NULL,
	[interval3] [int] NULL,
	[totalHeatTime] [int] NULL,
	[tolerance] [numeric](5, 2) NULL,
	[ProbeIPAddr] [varchar](15) NULL,
	[ProbeUDPPort] [int] NULL,
	[AlarmIPAddr] [varchar](15) NULL,
	[AlarmUDPPort] [int] NULL,
	[IsRunning] [varchar](1) NULL,
	[lastalarm] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[status] [varchar](50) NULL,
	[barcode] [varchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alarm_main] [int] NOT NULL,
	[dateone] [varchar](20) NULL,
	[blinkalarm] [int] NULL,
	[alarmautofixed] [bit] NULL,
	[alarmFetchStart] [int] NULL,
	[currentBatchStep] [smallint] NULL,
 CONSTRAINT [PK_OvenDB] PRIMARY KEY CLUSTERED 
(
	[OvenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logweek]    Script Date: 04/13/2015 15:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logweek](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lw] [varchar](10) NULL,
	[cw] [int] NULL,
	[yr] [int] NULL,
	[dateone] [varchar](20) NULL,
	[datework] [varchar](20) NULL,
	[machine] [varchar](20) NULL,
	[status] [varchar](20) NULL,
	[remarks] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [varchar](25) NULL,
	[updated_by] [varchar](25) NULL,
 CONSTRAINT [PK_logweek] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HeatingBatch]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeatingBatch](
	[BatchID] [int] IDENTITY(1,1) NOT NULL,
	[OvenID] [varchar](20) NULL,
	[Status] [varchar](10) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[HeatingType] [varchar](10) NULL,
	[SetPoint1] [numeric](8, 2) NULL,
	[SetPoint2] [numeric](8, 2) NULL,
	[Interval1] [int] NULL,
	[Interval2] [int] NULL,
	[Interval3] [int] NULL,
	[TotalHeatTime] [int] NULL,
	[Tolerance] [numeric](8, 2) NULL,
	[dummyname] [varchar](20) NULL,
	[is_overrided] [bit] NOT NULL,
	[overrideid] [int] NOT NULL,
	[is_dummy] [bit] NOT NULL,
	[manual] [bit] NOT NULL,
 CONSTRAINT [PK_HeatingBatch] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_getOvenAlarms]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_getOvenAlarms]
	
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	 SELECT OvenID,alarm_main,blinkalarm from OvenDB where OvenID not like '%alarm%' order by OvenID
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_get_oven_Ip]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_get_oven_Ip] 
   @ovenid nvarchar(20)=NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
		select A.OvenID,A.ProbeIPAddr,A.ProbeIPAddr from OvenDB A where A.OvenID=@ovenid or @ovenid is null
         
	COMMIT
GO
/****** Object:  Table [dbo].[pm]    Script Date: 04/13/2015 15:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pm](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[asset_id] [varchar](20) NOT NULL,
	[logweek_id] [varchar](10) NOT NULL,
	[todo] [varchar](30) NULL,
	[pic] [varchar](30) NULL,
	[status] [varchar](30) NOT NULL,
	[remarks] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [varchar](25) NULL,
	[updated_by] [varchar](25) NULL,
	[dateone] [varchar](20) NULL,
	[datework] [varchar](20) NULL,
	[yr] [int] NULL,
 CONSTRAINT [PK_pm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_AlarmIndividual]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AlarmIndividual]
@ovenid nvarchar(20)= NULL,
@status bit='0'	
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN
   IF @ovenid is NULL 
	 Update OvenDB set blinkalarm=@status
	 else
	 Update OvenDB set blinkalarm=@status where OvenID=@ovenid
	 
COMMIT
GO
/****** Object:  Table [dbo].[OvenPattern]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OvenPattern](
	[OvenID] [varchar](20) NOT NULL,
	[stepnumber] [numeric](4, 0) NOT NULL,
	[start_level] [numeric](4, 0) NOT NULL,
	[step1] [numeric](4, 0) NOT NULL,
	[level1] [numeric](4, 0) NOT NULL,
	[guard1] [bit] NOT NULL,
	[step2] [numeric](4, 0) NOT NULL,
	[level2] [numeric](4, 0) NOT NULL,
	[guard2] [bit] NOT NULL,
	[step3] [numeric](4, 0) NOT NULL,
	[level3] [numeric](4, 0) NOT NULL,
	[guard3] [bit] NOT NULL,
	[step4] [numeric](4, 0) NOT NULL,
	[level4] [numeric](4, 0) NOT NULL,
	[guard4] [bit] NOT NULL,
	[step5] [numeric](4, 0) NOT NULL,
	[level5] [numeric](4, 0) NOT NULL,
	[guard5] [bit] NOT NULL,
	[step6] [numeric](4, 0) NOT NULL,
	[level6] [numeric](4, 0) NOT NULL,
	[guard6] [bit] NOT NULL,
	[step7] [numeric](4, 0) NOT NULL,
	[level7] [numeric](4, 0) NOT NULL,
	[guard7] [bit] NOT NULL,
	[step8] [numeric](4, 0) NOT NULL,
	[level8] [numeric](4, 0) NOT NULL,
	[guard8] [bit] NOT NULL,
	[step9] [numeric](4, 0) NOT NULL,
	[level9] [numeric](4, 0) NOT NULL,
	[guard9] [bit] NOT NULL,
	[step10] [numeric](4, 0) NOT NULL,
	[level10] [numeric](4, 0) NOT NULL,
	[guard10] [bit] NOT NULL,
	[step_tolerancy] [numeric](4, 0) NOT NULL,
	[level_tolerancy] [numeric](4, 0) NOT NULL,
	[alarm_wait] [numeric](4, 0) NOT NULL,
	[shutdown_level] [numeric](4, 0) NOT NULL,
	[allow_start_low] [numeric](4, 0) NOT NULL,
	[allow_start_high] [numeric](4, 0) NOT NULL,
	[interrupt_tolerancy] [numeric](4, 0) NOT NULL,
	[autoprint] [bit] NOT NULL,
	[stretch] [bit] NOT NULL,
	[stretch_value] [int] NOT NULL,
	[BigScreen_blink_on_error] [bit] NOT NULL,
 CONSTRAINT [PK_OvenPattern] PRIMARY KEY CLUSTERED 
(
	[OvenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OvenGraphSetting]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OvenGraphSetting](
	[OvenID] [varchar](20) NOT NULL,
	[max_x] [smallint] NOT NULL,
	[max_y] [smallint] NOT NULL,
	[ticksize] [smallint] NOT NULL,
	[limit] [smallint] NOT NULL,
	[limit_tolerance] [smallint] NOT NULL,
	[upper_limit_color] [varchar](10) NOT NULL,
	[lower_limit_color] [varchar](10) NOT NULL,
	[target_color] [varchar](10) NOT NULL,
	[background_color] [varchar](10) NOT NULL,
	[graph_color] [varchar](50) NOT NULL,
	[alias] [varchar](50) NULL,
 CONSTRAINT [PK_OvenGraphSetting] PRIMARY KEY CLUSTERED 
(
	[OvenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_checkPM]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_checkPM] 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	declare @DateOne as nvarchar(40)
	SET @DateOne = (select top 1 a.dateone from logweek a where CONVERT(datetime,a.dateone,120)<=GETDATE() order by a.dateone DESC)	
      
    
    -- clean PM for pass and next LW and pm Done
    update OvenDB set [status]= NULL,dateone=NULL
    from OvenDB A
    left join pm B on a.OvenID=b.asset_id and B.dateone=@DateOne
    where A.dateone!=@DateOne OR B.[status]='D'
    
    -- set PM on oven db for nt running mc
    update OvenDB set [status]='PM',dateone=B.dateone
    from OvenDB A
    left join pm B on a.OvenID=b.asset_id and B.dateone=@DateOne
    where A.dateone=@DateOne and A.IsRunning='0' and B.[status]='N' and B.datework >=GETDATE()
    
    -- update late PM
    update pm set [status]='L'
    where pm.dateone < @DateOne and pm.[status]='N'
       
    --
	COMMIT
GO
/****** Object:  Table [dbo].[batchApproval]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[batchApproval](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[batchid] [int] NULL,
	[checked] [bit] NOT NULL,
	[result] [bit] NULL,
	[remarks] [varchar](max) NULL,
	[checked_by] [varchar](50) NULL,
	[check_date] [datetime] NULL,
	[production] [bit] NULL,
 CONSTRAINT [PK_batchApproval] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlarmMonitor]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmMonitor](
	[batchid] [int] NOT NULL,
	[started] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[error] [varchar](200) NOT NULL,
	[step] [int] NULL,
	[type] [varchar](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_AddOven]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AddOven]
	@ovenid varchar(max),
	@IP nvarchar(max),
	@udp int,
	@tcp int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN
	
	INSERT INTO OvenDB (OvenID,ProbeIPAddr,AlarmIPAddr,ProbeUDPPort,AlarmUDPPort)
	SELECT @ovenid,@IP,@IP,@tcp,@udp
	
	INSERT INTO OvenGraphSetting
	SELECT @ovenid,'450','200','10','175','5','FF850A','3414FF','FFDD33','DBDBDB','10943C',@ovenid
	
	INSERT INTO HeatingBatch         
	     ([OvenID]
           ,[Status]
           ,[StartDate]
           ,[EndDate]
           ,[HeatingType]
           ,[SetPoint1]
           ,[SetPoint2]
           ,[Interval1]
           ,[Interval2]
           ,[Interval3]
           ,[TotalHeatTime]
           ,[Tolerance]
           ,[dummyname]
           ,[is_overrided]
           ,[overrideid]
           ,[is_dummy]
           ,[manual])
	SELECT  @ovenid, 'FIN',GETDATE(),GETDATE(),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0'
	
	INSERT INTO OvenPattern
	SELECT @ovenid,	'3','35','60','175','0','240','175','1','90','60','0','0','0','0','0','0','0','0'	,'0'	,'0'	,'0',	'0'	,'0',	'0',	'0',	'0'	,'0'	,'0'	,'0'	,'0'	,'0','0',	'30',	'5',	'120'	,'1500',	'35'	,'175'	,'30'	,'0',	'0'	,'600','1'
COMMIT
GO
/****** Object:  Trigger [TableName_IUD]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TableName_IUD]
ON [dbo].[OvenPattern]
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
    SET NOCOUNT ON;

    --
    -- Check if this is an INSERT, UPDATE or DELETE Action.
    -- 
    DECLARE @action as char(1);

    SET @action = 'I'; -- Set Action to Insert by default.
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
        SET @action = 
            CASE
                WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' -- Set Action to Updated.
                ELSE 'D' -- Set Action to Deleted.       
            END
    END
    ELSE
    BEGIN 
        IF NOT EXISTS(SELECT * FROM INSERTED) RETURN; -- Nothing updated or inserted.
    END
    IF @action='U'
    BEGIN
		UPDATE
			OvenDB
		SET
			OvenDB.blinkalarm = B.BigScreen_blink_on_error
			
		FROM
			OvenDB A
		INNER JOIN
			inserted B
		ON
			A.OvenID = B.OvenID
    END
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateOven_FIN]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UpdateOven_FIN] 
   @ovenid nvarchar(20),
   @Temperature nvarchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
		--get batchid
		declare @batchid as bigint
		declare @status as nvarchar(10)
		
		set @batchid = (select TOP 1 A.BatchID from HeatingBatch A where A.OvenID=@ovenid Order By A.BatchID DESC)
		set @status = (select A.[Status] from HeatingBatch A where A.BatchID=@batchid)
		IF @status is null OR @status='' OR @status<>'FIN'
		BEGIN
		  UPDATE HeatingBatch SET [Status]='FIN', EndDate=GETDATE()
		  UPDATE OvenDB SET IsRunning='0'
		END
         
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_RenameOven]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_RenameOven]
	@ovenid varchar(max),
	@new_ovenid nvarchar(max)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN
	ALTER TABLE OVENDB NOCHECK CONSTRAINT ALL
	ALTER TABLE HeatingBatch NOCHECK CONSTRAINT ALL
	ALTER TABLE OvenGraphSetting NOCHECK CONSTRAINT ALL
	ALTER TABLE Ovenpattern NOCHECK CONSTRAINT ALL
	ALTER TABLE pm NOCHECK CONSTRAINT ALL
	ALTER TABLE logweek NOCHECK CONSTRAINT ALL
	
	UPDATE HeatingBatch SET OvenID=@new_ovenid where OvenID=@ovenid
	Update OvenGraphSetting SET OvenID=@new_ovenid, alias=@new_ovenid where OvenID=@ovenid
	update OvenPattern SET OvenID=@new_ovenid where OvenID=@ovenid
	update pm set asset_id=@new_ovenid where asset_id=@ovenid
	update logweek set machine=@new_ovenid where machine=@ovenid
	update OvenDB set OvenID=@new_ovenid where OvenID=@ovenid
	
	
	ALTER TABLE OVENDB CHECK CONSTRAINT ALL
	ALTER TABLE HeatingBatch CHECK CONSTRAINT ALL
	ALTER TABLE OvenGraphSetting CHECK CONSTRAINT ALL
	ALTER TABLE Ovenpattern CHECK CONSTRAINT ALL
	ALTER TABLE pm CHECK CONSTRAINT ALL
	ALTER TABLE logweek CHECK CONSTRAINT ALL
	
COMMIT
GO
/****** Object:  Table [dbo].[BatchTemperature]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BatchTemperature](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NOT NULL,
	[FetchTime] [int] NULL,
	[Temperature] [numeric](8, 2) NULL,
	[UOM] [varchar](50) NULL,
 CONSTRAINT [PK_BatchTemperature] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BatchPattern]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchPattern](
	[Batchid] [int] NOT NULL,
	[stepnumber] [numeric](4, 0) NOT NULL,
	[start_level] [numeric](4, 0) NOT NULL,
	[step1] [numeric](4, 0) NOT NULL,
	[level1] [numeric](4, 0) NOT NULL,
	[guard1] [bit] NOT NULL,
	[step2] [numeric](4, 0) NOT NULL,
	[level2] [numeric](4, 0) NOT NULL,
	[guard2] [bit] NOT NULL,
	[step3] [numeric](4, 0) NOT NULL,
	[level3] [numeric](4, 0) NOT NULL,
	[guard3] [bit] NOT NULL,
	[step4] [numeric](4, 0) NOT NULL,
	[level4] [numeric](4, 0) NOT NULL,
	[guard4] [bit] NOT NULL,
	[step5] [numeric](4, 0) NOT NULL,
	[level5] [numeric](4, 0) NOT NULL,
	[guard5] [bit] NOT NULL,
	[step6] [numeric](4, 0) NOT NULL,
	[level6] [numeric](4, 0) NOT NULL,
	[guard6] [bit] NOT NULL,
	[step7] [numeric](4, 0) NOT NULL,
	[level7] [numeric](4, 0) NOT NULL,
	[guard7] [bit] NOT NULL,
	[step8] [numeric](4, 0) NOT NULL,
	[level8] [numeric](4, 0) NOT NULL,
	[guard8] [bit] NOT NULL,
	[step9] [numeric](4, 0) NOT NULL,
	[level9] [numeric](4, 0) NOT NULL,
	[guard9] [bit] NOT NULL,
	[step10] [numeric](4, 0) NOT NULL,
	[level10] [numeric](4, 0) NOT NULL,
	[guard10] [bit] NOT NULL,
	[step_tolerancy] [numeric](4, 0) NOT NULL,
	[level_tolerancy] [numeric](4, 0) NOT NULL,
	[alarm_wait] [numeric](4, 0) NOT NULL,
	[shutdown_level] [numeric](4, 0) NOT NULL,
	[allow_start_low] [numeric](4, 0) NOT NULL,
	[allow_start_high] [numeric](4, 0) NOT NULL,
	[interrupt_tolerancy] [numeric](4, 0) NOT NULL,
	[autoprint] [bit] NOT NULL,
	[stretch] [bit] NOT NULL,
	[stretch_value] [int] NOT NULL,
 CONSTRAINT [PK_BatchPattern] PRIMARY KEY CLUSTERED 
(
	[Batchid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Trigger [MonitorIt]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[MonitorIt]
ON [dbo].[BatchTemperature]
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
    SET NOCOUNT ON;

    --
    -- Check if this is an INSERT, UPDATE or DELETE Action.
    -- 
    DECLARE @action as char(1);

    SET @action = 'I'; -- Set Action to Insert by default.
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
        SET @action = 
            CASE
                WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' -- Set Action to Updated.
                ELSE 'D' -- Set Action to Deleted.       
            END
    END
    ELSE
    BEGIN 
        IF NOT EXISTS(SELECT * FROM INSERTED) RETURN; -- Nothing updated or inserted.
    END
   
   IF @action='I'
   BEGIN
		declare @suhu as float
		declare @fetchtime as int
		declare @batchid as int
		declare @OvenId as nvarchar(20)
		declare @limitAtas as float
		declare @limitBawah as float
		declare @step as smallint
		declare @step1length as int
		declare @step2length as int
		
		select top 1 @suhu=a.Temperature,@fetchtime=a.FetchTime,@batchid=a.BatchID,@OvenId=B.OvenID from inserted a
		LEFT JOIN HeatingBatch B on A.BatchID=B.BatchID
		
		IF @suhu >'180' --error condition
		BEGIN
		    Update OvenDB set alarm_main='1',alarmFetchStart=@fetchtime,alarmautofixed='1'
		    where OvenID = @OvenId And (alarmautofixed='0' OR @fetchtime-alarmFetchStart>'150') 
		END
		
		IF @suhu <= '180'
		BEGIN
			Update OvenDB set alarm_main='0', alarmFetchStart=NULL, alarmautofixed='0'
		    Where OvenID = @OvenId
		END
   END
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Temperature]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Insert_Temperature] 
   @ovenid nvarchar(20),
   @Temperature nvarchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
		--get batchid
		declare @batchid as bigint
		declare @status as nvarchar(10)
		
		select TOP 1 @batchid = A.BatchID,@status =A.[Status] from HeatingBatch A where A.OvenID=@ovenid Order By A.BatchID DESC
		IF @status is null OR @status='' SET @status='FIN'
		
		IF (@status='FIN')
		BEGIN
			INSERT INTO HeatingBatch (OvenID,[Status]) VALUES (@ovenid,'RUN')
			SET @batchid=SCOPE_IDENTITY()
			
			INSERT INTO batchmonitor (Batchid,[first],checked,laststep,startstep)
			SELECT @batchid,'0','N','5','0'
			
			INSERT INTO BatchPattern 
			SELECT @batchid ,[stepnumber],[start_level],[step1],[level1],[guard1],[step2],[level2],[guard2]
				  ,[step3],[level3],[guard3],[step4],[level4],[guard4],[step5],[level5],[guard5],[step6]
				  ,[level6],[guard6],[step7],[level7],[guard7],[step8],[level8],[guard8],[step9],[level9]
				  ,[guard9],[step10],[level10],[guard10],[step_tolerancy],[level_tolerancy],[alarm_wait]
				  ,[shutdown_level],[allow_start_low],[allow_start_high]
				  ,[interrupt_tolerancy],[autoprint],[stretch],[stretch_value]
			FROM [MYOVEN].[dbo].[OvenPattern] B where b.OvenID=@ovenid
			
			SET @status='RUN'
			
		END
		ELSE
		BEGIN
			IF (@status='READY')
			BEGIN
				UPDATE HeatingBatch SET [Status]='RUN'
				SET @status='RUN'
			END
		END
        IF (@status='RUN')
        BEGIN
            Declare @fetchtime as bigint
            declare @startdate as datetime
            SET @startdate = (SELECT A.StartDate from HeatingBatch A where a.BatchID=@batchid)
            SET @fetchtime = DATEDIFF(second,@startdate,GETDATE())
            
			INSERT INTO BatchTemperature (BatchID,FetchTime,Temperature,UOM)
			VALUES (@batchid,@fetchtime,@Temperature,'C')			
			UPDATE OvenDB SET IsRunning='1' where  OvenID=@ovenid
		END
         
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteBatch]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_deleteBatch] 
    @batchid int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON
BEGIN TRAN  
	DELETE [dbo].[batchtemperature] WHERE batchid =@batchid
    DELETE [dbo].[batchlot] WHERE batchid =@batchid
    DELETE [dbo].[batchpattern] WHERE batchid =@batchid
	DELETE [dbo].[batchmonitor] WHERE batchid =@batchid
    DELETE [dbo].[alarmmonitor] WHERE batchid =@batchid
    DELETE [dbo].[batchApproval] WHERE batchid =@batchid
    DELETE [dbo].[BatchAlarm] WHERE batchid =@batchid
    DELETE [dbo].[heatingbatch] WHERE batchid =@batchid
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_flatStep]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_flatStep] 
    @batchid int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	declare @level int
    declare @level_tolerancy int
	BEGIN TRAN
    Set @level = (select TOP 1 [level2] from [dbo].[batchpattern] where [batchid]=@batchid )
    Set @level_tolerancy = (select TOP 1 [level_tolerancy] from [dbo].[batchpattern] where [batchid]=@batchid )
    Set @level = @level-@level_tolerancy
	select (((select TOP 1 [fetchtime] from [dbo].[batchtemperature] where [temperature]>=@level and [batchid]=@batchid order by [fetchtime] DESC)-(select TOP 1 [fetchtime] from [dbo].[batchtemperature] where [temperature]>=@level and [batchid]=@batchid  order by [fetchtime] asc)))  AS result
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteOven]    Script Date: 04/13/2015 15:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DeleteOven]
	@ovenid varchar(max)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN
	declare @batchid as int
	declare cur CURSOR LOCAL for
				select batchid from heatingbatch where ovenid=@ovenid
				
				open cur

				fetch next from cur into @batchid
				while @@FETCH_STATUS = 0 BEGIN

					 exec usp_deleteBatch @batchid
					 
					fetch next from cur into @batchid
				END

				close cur
				deallocate cur
	DELETE OVENGraphSetting where ovenid=@ovenid
	DELETE OVenPattern Where ovenid=@ovenid
	
	DELETE LogWeek where machine=@ovenid
	DELETE pm where asset_id=@ovenid
	DELETE ovendb where ovenid=@ovenid
	
	
COMMIT
GO
/****** Object:  Default [DF__OvenDB__alarm_ma__31B762FC]    Script Date: 04/13/2015 15:23:12 ******/
ALTER TABLE [dbo].[OvenDB] ADD  DEFAULT ((0)) FOR [alarm_main]
GO
/****** Object:  Default [DF_OvenDB_currentBatchStep]    Script Date: 04/13/2015 15:23:12 ******/
ALTER TABLE [dbo].[OvenDB] ADD  CONSTRAINT [DF_OvenDB_currentBatchStep]  DEFAULT ((0)) FOR [currentBatchStep]
GO
/****** Object:  Default [status_default]    Script Date: 04/13/2015 15:23:12 ******/
ALTER TABLE [dbo].[logweek] ADD  CONSTRAINT [status_default]  DEFAULT ('N') FOR [status]
GO
/****** Object:  Default [DF_all_stock_hourly_date]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[all_stock_hourly] ADD  CONSTRAINT [DF_all_stock_hourly_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF__batchmoni__start__74AE54BC]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[batchmonitor] ADD  DEFAULT ((0)) FOR [startstep]
GO
/****** Object:  Default [DF__batchmoni__lasts__75A278F5]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[batchmonitor] ADD  DEFAULT ((5)) FOR [laststep]
GO
/****** Object:  Default [DF__batchmoni__check__76969D2E]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[batchmonitor] ADD  DEFAULT ('N') FOR [checked]
GO
/****** Object:  Default [DF_batchmonitor_first]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[batchmonitor] ADD  CONSTRAINT [DF_batchmonitor_first]  DEFAULT ((0)) FOR [first]
GO
/****** Object:  Default [DF_pattern_fix_step1]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_step1]  DEFAULT ((0)) FOR [step1]
GO
/****** Object:  Default [DF_pattern_fix_level1]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_level1]  DEFAULT ((0)) FOR [level1]
GO
/****** Object:  Default [DF_pattern_fix_step2]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_step2]  DEFAULT ((0)) FOR [step2]
GO
/****** Object:  Default [DF_pattern_fix_level2]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_level2]  DEFAULT ((0)) FOR [level2]
GO
/****** Object:  Default [DF_pattern_fix_step3]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_step3]  DEFAULT ((0)) FOR [step3]
GO
/****** Object:  Default [DF_pattern_fix_level3]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_level3]  DEFAULT ((0)) FOR [level3]
GO
/****** Object:  Default [DF_pattern_fix_step4]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_step4]  DEFAULT ((0)) FOR [step4]
GO
/****** Object:  Default [DF_pattern_fix_level4]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_level4]  DEFAULT ((0)) FOR [level4]
GO
/****** Object:  Default [DF_pattern_fix_level5]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_level5]  DEFAULT ((0)) FOR [level5]
GO
/****** Object:  Default [DF_pattern_fix_step_tolerance]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_step_tolerance]  DEFAULT ((0)) FOR [step_tolerancy]
GO
/****** Object:  Default [DF_pattern_fix_level_tolerance]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_level_tolerance]  DEFAULT ((0)) FOR [level_tolerancy]
GO
/****** Object:  Default [DF_pattern_fix_alarm_wait]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_alarm_wait]  DEFAULT ((0)) FOR [alarm_wait]
GO
/****** Object:  Default [DF_pattern_fix_allow_start_low]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_allow_start_low]  DEFAULT ((0)) FOR [allow_start_low]
GO
/****** Object:  Default [DF_pattern_fix_allow_start_high]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_allow_start_high]  DEFAULT ((0)) FOR [allow_start_high]
GO
/****** Object:  Default [DF_pattern_fix_start_level]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_start_level]  DEFAULT ((0)) FOR [start_level]
GO
/****** Object:  Default [DF_pattern_fix_interrupt_tolerancy]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pattern_fix] ADD  CONSTRAINT [DF_pattern_fix_interrupt_tolerancy]  DEFAULT ((10)) FOR [interrupt_tolerancy]
GO
/****** Object:  Default [DF_OvenPattern_stepnumber]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_stepnumber]  DEFAULT ((5)) FOR [stepnumber]
GO
/****** Object:  Default [DF_OvenPattern_start_level]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_start_level]  DEFAULT ((0)) FOR [start_level]
GO
/****** Object:  Default [DF_OvenPattern_step1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step1]  DEFAULT ((0)) FOR [step1]
GO
/****** Object:  Default [DF_OvenPattern_level1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level1]  DEFAULT ((0)) FOR [level1]
GO
/****** Object:  Default [DF_OvenPattern_guard1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard1]  DEFAULT ((1)) FOR [guard1]
GO
/****** Object:  Default [DF_OvenPattern_step2]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step2]  DEFAULT ((0)) FOR [step2]
GO
/****** Object:  Default [DF_OvenPattern_level2]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level2]  DEFAULT ((0)) FOR [level2]
GO
/****** Object:  Default [DF_OvenPattern_guard11]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard11]  DEFAULT ((1)) FOR [guard2]
GO
/****** Object:  Default [DF_OvenPattern_step3]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step3]  DEFAULT ((0)) FOR [step3]
GO
/****** Object:  Default [DF_OvenPattern_level3]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level3]  DEFAULT ((0)) FOR [level3]
GO
/****** Object:  Default [DF_OvenPattern_guard11_1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard11_1]  DEFAULT ((1)) FOR [guard3]
GO
/****** Object:  Default [DF_OvenPattern_step4]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step4]  DEFAULT ((0)) FOR [step4]
GO
/****** Object:  Default [DF_OvenPattern_level4]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level4]  DEFAULT ((0)) FOR [level4]
GO
/****** Object:  Default [DF_OvenPattern_guard31]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard31]  DEFAULT ((1)) FOR [guard4]
GO
/****** Object:  Default [DF_OvenPattern_step5]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step5]  DEFAULT ((0)) FOR [step5]
GO
/****** Object:  Default [DF_OvenPattern_level5]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level5]  DEFAULT ((0)) FOR [level5]
GO
/****** Object:  Default [DF_OvenPattern_guard31_1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard31_1]  DEFAULT ((1)) FOR [guard5]
GO
/****** Object:  Default [DF_OvenPattern_step6]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step6]  DEFAULT ((0)) FOR [step6]
GO
/****** Object:  Default [DF_OvenPattern_level6]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level6]  DEFAULT ((0)) FOR [level6]
GO
/****** Object:  Default [DF_OvenPattern_guard31_2]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard31_2]  DEFAULT ((1)) FOR [guard6]
GO
/****** Object:  Default [DF_OvenPattern_step7]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step7]  DEFAULT ((0)) FOR [step7]
GO
/****** Object:  Default [DF_OvenPattern_level7]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level7]  DEFAULT ((0)) FOR [level7]
GO
/****** Object:  Default [DF_OvenPattern_guard31_3]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard31_3]  DEFAULT ((1)) FOR [guard7]
GO
/****** Object:  Default [DF_OvenPattern_step8]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step8]  DEFAULT ((0)) FOR [step8]
GO
/****** Object:  Default [DF_OvenPattern_level8]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level8]  DEFAULT ((0)) FOR [level8]
GO
/****** Object:  Default [DF_OvenPattern_guard31_4]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard31_4]  DEFAULT ((1)) FOR [guard8]
GO
/****** Object:  Default [DF_OvenPattern_step9]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step9]  DEFAULT ((0)) FOR [step9]
GO
/****** Object:  Default [DF_OvenPattern_level9]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level9]  DEFAULT ((0)) FOR [level9]
GO
/****** Object:  Default [DF_OvenPattern_guard31_5]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard31_5]  DEFAULT ((1)) FOR [guard9]
GO
/****** Object:  Default [DF_OvenPattern_step10]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step10]  DEFAULT ((0)) FOR [step10]
GO
/****** Object:  Default [DF_OvenPattern_level10]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_level10]  DEFAULT ((0)) FOR [level10]
GO
/****** Object:  Default [DF_OvenPattern_guard91]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_guard91]  DEFAULT ((1)) FOR [guard10]
GO
/****** Object:  Default [DF_OvenPattern_step_tolerancy]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_step_tolerancy]  DEFAULT ((0)) FOR [step_tolerancy]
GO
/****** Object:  Default [DF_OvenPattern_alarm_wait]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_alarm_wait]  DEFAULT ((1)) FOR [alarm_wait]
GO
/****** Object:  Default [DF_OvenPattern_shutdown_level]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_shutdown_level]  DEFAULT ((0)) FOR [shutdown_level]
GO
/****** Object:  Default [DF_OvenPattern_allow_start_low]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_allow_start_low]  DEFAULT ((0)) FOR [allow_start_low]
GO
/****** Object:  Default [DF_OvenPattern_allow_start_high]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_allow_start_high]  DEFAULT ((0)) FOR [allow_start_high]
GO
/****** Object:  Default [DF_OvenPattern_interrupt_tolerancy]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_interrupt_tolerancy]  DEFAULT ((1)) FOR [interrupt_tolerancy]
GO
/****** Object:  Default [DF_OvenPattern_autoprint]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF_OvenPattern_autoprint]  DEFAULT ((0)) FOR [autoprint]
GO
/****** Object:  Default [DF__OvenPatte__stret__1EA48E88]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF__OvenPatte__stret__1EA48E88]  DEFAULT ('0') FOR [stretch]
GO
/****** Object:  Default [DF__OvenPatte__stret__1F98B2C1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern] ADD  CONSTRAINT [DF__OvenPatte__stret__1F98B2C1]  DEFAULT ('0') FOR [stretch_value]
GO
/****** Object:  Default [DF_OvenGraphSetting_max_x]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_max_x]  DEFAULT ((300)) FOR [max_x]
GO
/****** Object:  Default [DF_OvenGraphSetting_max_y]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_max_y]  DEFAULT ((200)) FOR [max_y]
GO
/****** Object:  Default [DF_OvenGraphSetting_ticksize]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_ticksize]  DEFAULT ((10)) FOR [ticksize]
GO
/****** Object:  Default [DF_OvenGraphSetting_limit]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_limit]  DEFAULT ((0)) FOR [limit]
GO
/****** Object:  Default [DF_OvenGraphSetting_limit_tolerance]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_limit_tolerance]  DEFAULT ((10)) FOR [limit_tolerance]
GO
/****** Object:  Default [DF_OvenGraphSetting_upper_limit_color]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_upper_limit_color]  DEFAULT ('3F21FF') FOR [upper_limit_color]
GO
/****** Object:  Default [DF_OvenGraphSetting_lower_limit_color]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_lower_limit_color]  DEFAULT ('FFE229') FOR [lower_limit_color]
GO
/****** Object:  Default [DF_OvenGraphSetting_target_color]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_target_color]  DEFAULT ('FF2F05') FOR [target_color]
GO
/****** Object:  Default [DF_OvenGraphSetting_background_color]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_background_color]  DEFAULT ('33FFF8') FOR [background_color]
GO
/****** Object:  Default [DF_OvenGraphSetting_graph_color]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting] ADD  CONSTRAINT [DF_OvenGraphSetting_graph_color]  DEFAULT ('FFE229') FOR [graph_color]
GO
/****** Object:  Default [startdate_default_constraint]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[HeatingBatch] ADD  CONSTRAINT [startdate_default_constraint]  DEFAULT (getdate()) FOR [StartDate]
GO
/****** Object:  Default [DF__HeatingBa__is_ov__236943A5]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[HeatingBatch] ADD  CONSTRAINT [DF__HeatingBa__is_ov__236943A5]  DEFAULT ('0') FOR [is_overrided]
GO
/****** Object:  Default [DF__HeatingBa__overr__245D67DE]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[HeatingBatch] ADD  CONSTRAINT [DF__HeatingBa__overr__245D67DE]  DEFAULT ('0') FOR [overrideid]
GO
/****** Object:  Default [DF__HeatingBa__is_du__25518C17]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[HeatingBatch] ADD  CONSTRAINT [DF__HeatingBa__is_du__25518C17]  DEFAULT ('0') FOR [is_dummy]
GO
/****** Object:  Default [DF__HeatingBa__manua__3C34F16F]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[HeatingBatch] ADD  CONSTRAINT [DF__HeatingBa__manua__3C34F16F]  DEFAULT ((0)) FOR [manual]
GO
/****** Object:  Default [DF_BatchPattern_stepnumber]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_stepnumber]  DEFAULT ((5)) FOR [stepnumber]
GO
/****** Object:  Default [DF_BatchPattern_start_level]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_start_level]  DEFAULT ((0)) FOR [start_level]
GO
/****** Object:  Default [DF_BatchPattern_step1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step1]  DEFAULT ((0)) FOR [step1]
GO
/****** Object:  Default [DF_BatchPattern_level1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level1]  DEFAULT ((0)) FOR [level1]
GO
/****** Object:  Default [DF_BatchPattern_guard1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard1]  DEFAULT ((1)) FOR [guard1]
GO
/****** Object:  Default [DF_BatchPattern_step2]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step2]  DEFAULT ((0)) FOR [step2]
GO
/****** Object:  Default [DF_BatchPattern_level2]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level2]  DEFAULT ((0)) FOR [level2]
GO
/****** Object:  Default [DF_BatchPattern_guard11]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard11]  DEFAULT ((1)) FOR [guard2]
GO
/****** Object:  Default [DF_BatchPattern_step3]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step3]  DEFAULT ((0)) FOR [step3]
GO
/****** Object:  Default [DF_BatchPattern_level3]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level3]  DEFAULT ((0)) FOR [level3]
GO
/****** Object:  Default [DF_BatchPattern_guard11_1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard11_1]  DEFAULT ((1)) FOR [guard3]
GO
/****** Object:  Default [DF_BatchPattern_step4]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step4]  DEFAULT ((0)) FOR [step4]
GO
/****** Object:  Default [DF_BatchPattern_level4]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level4]  DEFAULT ((0)) FOR [level4]
GO
/****** Object:  Default [DF_BatchPattern_guard31]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard31]  DEFAULT ((1)) FOR [guard4]
GO
/****** Object:  Default [DF_BatchPattern_step5]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step5]  DEFAULT ((0)) FOR [step5]
GO
/****** Object:  Default [DF_BatchPattern_level5]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level5]  DEFAULT ((0)) FOR [level5]
GO
/****** Object:  Default [DF_BatchPattern_guard31_1]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard31_1]  DEFAULT ((1)) FOR [guard5]
GO
/****** Object:  Default [DF_BatchPattern_step6]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step6]  DEFAULT ((0)) FOR [step6]
GO
/****** Object:  Default [DF_BatchPattern_level6]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level6]  DEFAULT ((0)) FOR [level6]
GO
/****** Object:  Default [DF_BatchPattern_guard31_2]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard31_2]  DEFAULT ((1)) FOR [guard6]
GO
/****** Object:  Default [DF_BatchPattern_step7]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step7]  DEFAULT ((0)) FOR [step7]
GO
/****** Object:  Default [DF_BatchPattern_level7]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level7]  DEFAULT ((0)) FOR [level7]
GO
/****** Object:  Default [DF_BatchPattern_guard31_3]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard31_3]  DEFAULT ((1)) FOR [guard7]
GO
/****** Object:  Default [DF_BatchPattern_step8]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step8]  DEFAULT ((0)) FOR [step8]
GO
/****** Object:  Default [DF_BatchPattern_level8]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level8]  DEFAULT ((0)) FOR [level8]
GO
/****** Object:  Default [DF_BatchPattern_guard31_4]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard31_4]  DEFAULT ((1)) FOR [guard8]
GO
/****** Object:  Default [DF_BatchPattern_step9]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step9]  DEFAULT ((0)) FOR [step9]
GO
/****** Object:  Default [DF_BatchPattern_level9]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level9]  DEFAULT ((0)) FOR [level9]
GO
/****** Object:  Default [DF_BatchPattern_guard31_5]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard31_5]  DEFAULT ((1)) FOR [guard9]
GO
/****** Object:  Default [DF_BatchPattern_step10]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step10]  DEFAULT ((0)) FOR [step10]
GO
/****** Object:  Default [DF_BatchPattern_level10]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_level10]  DEFAULT ((0)) FOR [level10]
GO
/****** Object:  Default [DF_BatchPattern_guard91]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_guard91]  DEFAULT ((1)) FOR [guard10]
GO
/****** Object:  Default [DF_BatchPattern_step_tolerancy]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_step_tolerancy]  DEFAULT ((0)) FOR [step_tolerancy]
GO
/****** Object:  Default [DF_BatchPattern_alarm_wait]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_alarm_wait]  DEFAULT ((1)) FOR [alarm_wait]
GO
/****** Object:  Default [DF_BatchPattern_shutdown_level]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_shutdown_level]  DEFAULT ((0)) FOR [shutdown_level]
GO
/****** Object:  Default [DF_BatchPattern_allow_start_low]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_allow_start_low]  DEFAULT ((0)) FOR [allow_start_low]
GO
/****** Object:  Default [DF_BatchPattern_allow_start_high]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_allow_start_high]  DEFAULT ((0)) FOR [allow_start_high]
GO
/****** Object:  Default [DF_BatchPattern_interrupt_tolerancy]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_interrupt_tolerancy]  DEFAULT ((1)) FOR [interrupt_tolerancy]
GO
/****** Object:  Default [DF_BatchPattern_autoprint]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  CONSTRAINT [DF_BatchPattern_autoprint]  DEFAULT ((0)) FOR [autoprint]
GO
/****** Object:  Default [DF__BatchPatt__stret__208CD6FA]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  DEFAULT ('0') FOR [stretch]
GO
/****** Object:  Default [DF__BatchPatt__stret__2180FB33]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern] ADD  DEFAULT ('0') FOR [stretch_value]
GO
/****** Object:  Default [DF_batchApproval_checked]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[batchApproval] ADD  CONSTRAINT [DF_batchApproval_checked]  DEFAULT ((0)) FOR [checked]
GO
/****** Object:  Default [DF_batchApproval_check_date]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[batchApproval] ADD  CONSTRAINT [DF_batchApproval_check_date]  DEFAULT (getdate()) FOR [check_date]
GO
/****** Object:  Default [DF__AlarmMoni__start__7D439ABD]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[AlarmMonitor] ADD  DEFAULT ((0)) FOR [started]
GO
/****** Object:  Default [DF__AlarmMoni__durat__7E37BEF6]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[AlarmMonitor] ADD  DEFAULT ((0)) FOR [duration]
GO
/****** Object:  Check [check_status]    Script Date: 04/13/2015 15:23:12 ******/
ALTER TABLE [dbo].[logweek]  WITH NOCHECK ADD  CONSTRAINT [check_status] CHECK  (([status]<>NULL AND [status]<>'' AND [status]<>' '))
GO
ALTER TABLE [dbo].[logweek] CHECK CONSTRAINT [check_status]
GO
/****** Object:  Check [ck_todo]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pm]  WITH NOCHECK ADD  CONSTRAINT [ck_todo] CHECK  (([todo]<>''))
GO
ALTER TABLE [dbo].[pm] CHECK CONSTRAINT [ck_todo]
GO
/****** Object:  Check [CK_OvenPattern_alarm_wait]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern]  WITH NOCHECK ADD  CONSTRAINT [CK_OvenPattern_alarm_wait] CHECK  (([alarm_wait]>=(1)))
GO
ALTER TABLE [dbo].[OvenPattern] CHECK CONSTRAINT [CK_OvenPattern_alarm_wait]
GO
/****** Object:  Check [CK_OvenPattern_Col]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern]  WITH NOCHECK ADD  CONSTRAINT [CK_OvenPattern_Col] CHECK  (([stepnumber]>=(1) AND [stepnumber]<=(10)))
GO
ALTER TABLE [dbo].[OvenPattern] CHECK CONSTRAINT [CK_OvenPattern_Col]
GO
/****** Object:  Check [CK_OvenPattern_interrupt_tolerancy]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern]  WITH NOCHECK ADD  CONSTRAINT [CK_OvenPattern_interrupt_tolerancy] CHECK  (([interrupt_tolerancy]>=(1)))
GO
ALTER TABLE [dbo].[OvenPattern] CHECK CONSTRAINT [CK_OvenPattern_interrupt_tolerancy]
GO
/****** Object:  Check [CK_BatchPattern_alarm_wait]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern]  WITH CHECK ADD  CONSTRAINT [CK_BatchPattern_alarm_wait] CHECK  (([alarm_wait]>=(1)))
GO
ALTER TABLE [dbo].[BatchPattern] CHECK CONSTRAINT [CK_BatchPattern_alarm_wait]
GO
/****** Object:  Check [CK_BatchPattern_Col]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern]  WITH CHECK ADD  CONSTRAINT [CK_BatchPattern_Col] CHECK  (([stepnumber]>=(1) AND [stepnumber]<=(10)))
GO
ALTER TABLE [dbo].[BatchPattern] CHECK CONSTRAINT [CK_BatchPattern_Col]
GO
/****** Object:  Check [CK_BatchPattern_interrupt_tolerancy]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern]  WITH CHECK ADD  CONSTRAINT [CK_BatchPattern_interrupt_tolerancy] CHECK  (([interrupt_tolerancy]>=(1)))
GO
ALTER TABLE [dbo].[BatchPattern] CHECK CONSTRAINT [CK_BatchPattern_interrupt_tolerancy]
GO
/****** Object:  ForeignKey [FK_pm_OvenDBNew]    Script Date: 04/13/2015 15:23:13 ******/
ALTER TABLE [dbo].[pm]  WITH NOCHECK ADD  CONSTRAINT [FK_pm_OvenDBNew] FOREIGN KEY([asset_id])
REFERENCES [dbo].[OvenDB] ([OvenID])
GO
ALTER TABLE [dbo].[pm] CHECK CONSTRAINT [FK_pm_OvenDBNew]
GO
/****** Object:  ForeignKey [FK_OvenPattern_OvenDB]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenPattern]  WITH NOCHECK ADD  CONSTRAINT [FK_OvenPattern_OvenDB] FOREIGN KEY([OvenID])
REFERENCES [dbo].[OvenDB] ([OvenID])
GO
ALTER TABLE [dbo].[OvenPattern] CHECK CONSTRAINT [FK_OvenPattern_OvenDB]
GO
/****** Object:  ForeignKey [FK_OvenGraphSetting_OvenGraphSetting]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[OvenGraphSetting]  WITH NOCHECK ADD  CONSTRAINT [FK_OvenGraphSetting_OvenGraphSetting] FOREIGN KEY([OvenID])
REFERENCES [dbo].[OvenDB] ([OvenID])
GO
ALTER TABLE [dbo].[OvenGraphSetting] CHECK CONSTRAINT [FK_OvenGraphSetting_OvenGraphSetting]
GO
/****** Object:  ForeignKey [FK_HeatingBatch_OvenDB]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[HeatingBatch]  WITH NOCHECK ADD  CONSTRAINT [FK_HeatingBatch_OvenDB] FOREIGN KEY([OvenID])
REFERENCES [dbo].[OvenDB] ([OvenID])
GO
ALTER TABLE [dbo].[HeatingBatch] CHECK CONSTRAINT [FK_HeatingBatch_OvenDB]
GO
/****** Object:  ForeignKey [FK_BatchPattern_HeatingBatch]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[BatchPattern]  WITH CHECK ADD  CONSTRAINT [FK_BatchPattern_HeatingBatch] FOREIGN KEY([Batchid])
REFERENCES [dbo].[HeatingBatch] ([BatchID])
GO
ALTER TABLE [dbo].[BatchPattern] CHECK CONSTRAINT [FK_BatchPattern_HeatingBatch]
GO
/****** Object:  ForeignKey [FK_batchApproval_HeatingBatch]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[batchApproval]  WITH CHECK ADD  CONSTRAINT [FK_batchApproval_HeatingBatch] FOREIGN KEY([batchid])
REFERENCES [dbo].[HeatingBatch] ([BatchID])
GO
ALTER TABLE [dbo].[batchApproval] CHECK CONSTRAINT [FK_batchApproval_HeatingBatch]
GO
/****** Object:  ForeignKey [FK_AlarmMonitor_HeatingBatch]    Script Date: 04/13/2015 15:23:14 ******/
ALTER TABLE [dbo].[AlarmMonitor]  WITH CHECK ADD  CONSTRAINT [FK_AlarmMonitor_HeatingBatch] FOREIGN KEY([batchid])
REFERENCES [dbo].[HeatingBatch] ([BatchID])
GO
ALTER TABLE [dbo].[AlarmMonitor] CHECK CONSTRAINT [FK_AlarmMonitor_HeatingBatch]
GO
