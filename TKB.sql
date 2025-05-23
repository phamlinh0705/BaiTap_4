USE [master]
GO
/****** Object:  Database [BTVN4]    Script Date: 4/15/2025 3:08:55 PM ******/
CREATE DATABASE [BTVN4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTVN4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.WINCC\MSSQL\DATA\BTVN4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BTVN4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.WINCC\MSSQL\DATA\BTVN4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BTVN4] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTVN4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTVN4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTVN4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTVN4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTVN4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTVN4] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTVN4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTVN4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTVN4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTVN4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTVN4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTVN4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTVN4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTVN4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTVN4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTVN4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTVN4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTVN4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTVN4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTVN4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTVN4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTVN4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTVN4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTVN4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BTVN4] SET  MULTI_USER 
GO
ALTER DATABASE [BTVN4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTVN4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTVN4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTVN4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BTVN4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BTVN4] SET QUERY_STORE = OFF
GO
USE [BTVN4]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BTVN4]
GO
/****** Object:  User [SIMATIC HMI VIEWER User]    Script Date: 4/15/2025 3:08:55 PM ******/
CREATE USER [SIMATIC HMI VIEWER User] FOR LOGIN [LAPTOP-PD7H3O52\SIMATIC HMI VIEWER]
GO
/****** Object:  User [SIMATIC HMI User]    Script Date: 4/15/2025 3:08:55 PM ******/
CREATE USER [SIMATIC HMI User] FOR LOGIN [LAPTOP-PD7H3O52\SIMATIC HMI]
GO
/****** Object:  DatabaseRole [SIMATIC HMI VIEWER role]    Script Date: 4/15/2025 3:08:55 PM ******/
CREATE ROLE [SIMATIC HMI VIEWER role]
GO
/****** Object:  DatabaseRole [SIMATIC HMI role]    Script Date: 4/15/2025 3:08:55 PM ******/
CREATE ROLE [SIMATIC HMI role]
GO
ALTER ROLE [SIMATIC HMI VIEWER role] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [SIMATIC HMI role] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER role]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI role]
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 4/15/2025 3:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[MaGV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
 CONSTRAINT [PK_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHP]    Script Date: 4/15/2025 3:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHP](
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](100) NULL,
 CONSTRAINT [PK_LopHP] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 4/15/2025 3:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [varchar](10) NOT NULL,
	[TenMonHoc] [nvarchar](50) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TKB]    Script Date: 4/15/2025 3:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKB](
	[TKB] [varchar](10) NOT NULL,
	[MaGV] [varchar](10) NULL,
	[MaMH] [varchar](10) NULL,
	[MaLop] [varchar](10) NULL,
	[GioVao] [time](7) NULL,
	[GioRa] [time](7) NULL,
	[Ngay] [date] NULL,
	[PhongHoc] [nvarchar](50) NULL,
 CONSTRAINT [PK_TKB_1] PRIMARY KEY CLUSTERED 
(
	[TKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'01', N'P.T.T.Hiền')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'02', N'T.C.Nhung')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'03', N'Đ.T.Hiên')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'04', N'N.T.Duy')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'05', N'N.T.Linh')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'06', N'N.V.Tính')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'07', N'T.T.Thanh')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'08', N'Đ.D.Cốp')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'09', N'N.V.Huy')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'10', N'T.T.N.Linh')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'11', N'N.T.Hương')
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen]) VALUES (N'12', N'N.M.Ngọc')
GO
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M1', N'58CDT3')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M10', N'58CDT1')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M11', N'59KC1')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M12', N'58TDT2')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M13', N'60CNTDH2')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M14', N'60CNTDH7')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M15', N'60CNTDH3')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M16', N'60KMT')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M17', N'58CLCDT')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M2', N'58KTD2')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M3', N'58KTP')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M4', N'60CNTDH5')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M5', N'58KTD1')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M6', N'60CNTDH1')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M7', N'59KMT')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M8', N'59KC2')
INSERT [dbo].[LopHP] ([MaLop], [TenLop]) VALUES (N'M9', N'57KMT')
GO
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE0211', N'Tin học trong kỹ thuật')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE0343', N'Chuyển đổi số')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE0478', N'Khoa học dữ liệu')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE0479', N'Lập trình Python')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE0480', N'Công nghệ phần mềm')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE408', N'Vi xử lý – Vi điều khiển')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE415', N'Kiến trúc máy tính')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE433', N'Quản trị mạng')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE560', N'Hệ quản trị cơ sở dữ liệu')
INSERT [dbo].[MonHoc] ([MaMH], [TenMonHoc]) VALUES (N'TEE567', N'Phân tích và thiết kế hệ thống')
GO
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB1', N'01', N'TEE408', N'M1', CAST(N'06:30:00' AS Time), CAST(N'07:45:00' AS Time), CAST(N'2025-04-08' AS Date), N'A16-401
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB10', N'10', N'TEE0211', N'M6', CAST(N'10:45:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2025-04-08' AS Date), N'A10-102
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB11', N'11', N'TEE0480', N'M8', CAST(N'12:30:00' AS Time), CAST(N'15:10:00' AS Time), CAST(N'2025-04-08' AS Date), N'A9-102
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB12', N'12', N'TEE0343', N'M7', CAST(N'13:55:00' AS Time), CAST(N'16:35:00' AS Time), CAST(N'2025-04-08' AS Date), N'A10-503
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB2 ', N'02', N'TEE408', N'M10', CAST(N'13:55:00' AS Time), CAST(N'16:35:00' AS Time), CAST(N'2025-04-08' AS Date), N'A10-401
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB3', N'03', N'TEE0211', N'M11', CAST(N'06:30:00' AS Time), CAST(N'09:10:00' AS Time), CAST(N'2025-04-09' AS Date), N'A9-302
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB4', N'04', N'TEE408', N'M17', CAST(N'13:55:00' AS Time), CAST(N'15:10:00' AS Time), CAST(N'2025-04-10' AS Date), N'A7-203
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB5', N'05', N'TEE408', N'M2', CAST(N'06:30:00' AS Time), CAST(N'09:10:00' AS Time), CAST(N'2025-04-08' AS Date), N'A10-404
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB6', N'06', N'TEE433', N'M3', CAST(N'10:45:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2025-04-08' AS Date), N'A9-204
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB7', N'07', N'TEE0211', N'M16', CAST(N'09:20:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2025-04-10' AS Date), N'A16-401
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB8', N'08', N'TEE560', N'M3', CAST(N'12:30:00' AS Time), CAST(N'15:10:00' AS Time), CAST(N'2025-04-08' AS Date), N'A9-102
')
INSERT [dbo].[TKB] ([TKB], [MaGV], [MaMH], [MaLop], [GioVao], [GioRa], [Ngay], [PhongHoc]) VALUES (N'TKB9', N'09', N'TEE0479', N'M3', CAST(N'12:30:00' AS Time), CAST(N'15:10:00' AS Time), CAST(N'2025-04-08' AS Date), N'A8-303
')
GO
ALTER TABLE [dbo].[TKB]  WITH CHECK ADD  CONSTRAINT [FK_TKB_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[TKB] CHECK CONSTRAINT [FK_TKB_GiaoVien]
GO
ALTER TABLE [dbo].[TKB]  WITH CHECK ADD  CONSTRAINT [FK_TKB_LopHP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHP] ([MaLop])
GO
ALTER TABLE [dbo].[TKB] CHECK CONSTRAINT [FK_TKB_LopHP]
GO
ALTER TABLE [dbo].[TKB]  WITH CHECK ADD  CONSTRAINT [FK_TKB_MonHoc] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[TKB] CHECK CONSTRAINT [FK_TKB_MonHoc]
GO
/****** Object:  DdlTrigger [OnTriggerDboSchema]    Script Date: 4/15/2025 3:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [OnTriggerDboSchema] ON database FOR create_table, create_view AS BEGIN   DECLARE @xmlEventData xml   SELECT    @xmlEventData = eventdata()   DECLARE @schemaName nvarchar(max)   DECLARE @objectName nvarchar(max)   DECLARE @DynSql nvarchar(max)      SET @schemaName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/SchemaName/text()'))   SET @objectName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/ObjectName/text()'))   IF(@schemaName='')   BEGIN     SET @DynSql = N'alter schema [dbo] transfer [' + @schemaName + N'].[' + @objectName + N']'     EXEC sp_executesql @statement=@DynSql   END END SET QUOTED_IDENTIFIER ON SET ANSI_NULLS ON 
GO
ENABLE TRIGGER [OnTriggerDboSchema] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [BTVN4] SET  READ_WRITE 
GO
