USE [master]
GO
/****** Object:  Database [CustomerDB]    Script Date: 20/06/2019 22:28:41 ******/
CREATE DATABASE [CustomerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CustomerDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CustomerDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CustomerDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CustomerDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerDB] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CustomerDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CustomerDB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 20/06/2019 22:28:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Name] [varchar](200) NULL,
	[Mobile] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 20/06/2019 22:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[Currency] [varchar](3) NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

GO
INSERT [dbo].[Customers] ([CustomerId], [Email], [Name], [Mobile]) VALUES (1, N'userone@email.com', N'user one', CAST(1234567890 AS Numeric(18, 0)))
GO
INSERT [dbo].[Customers] ([CustomerId], [Email], [Name], [Mobile]) VALUES (2, N'usertwo@email.com', N'user two', CAST(9876543210 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (2, 1, CAST(N'2019-06-20 18:51:47.640' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'INR', N'Success')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (3, 1, CAST(N'2019-06-20 18:51:47.640' AS DateTime), CAST(2.00 AS Decimal(18, 2)), N'INR', N'Failed')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (4, 1, CAST(N'2019-06-20 18:51:47.640' AS DateTime), CAST(3.60 AS Decimal(18, 2)), N'INR', N'Cancelled')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (5, 2, CAST(N'2019-06-20 18:52:26.730' AS DateTime), CAST(17.10 AS Decimal(18, 2)), N'INR', N'Failed')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (6, 1, CAST(N'2019-06-20 18:52:26.730' AS DateTime), CAST(2.00 AS Decimal(18, 2)), N'USD', N'Success')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (7, 1, CAST(N'2019-06-20 18:52:26.730' AS DateTime), CAST(93.69 AS Decimal(18, 2)), N'INR', N'Success')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (8, 1, CAST(N'2019-06-20 18:53:11.143' AS DateTime), CAST(17.10 AS Decimal(18, 2)), N'INR', N'Failed')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (9, 2, CAST(N'2019-06-20 18:53:11.143' AS DateTime), CAST(2.70 AS Decimal(18, 2)), N'USD', N'Cancelled')
GO
INSERT [dbo].[Transactions] ([TransactionId], [CustomerId], [TransactionDate], [Amount], [Currency], [Status]) VALUES (10, 2, CAST(N'2019-06-20 18:53:11.143' AS DateTime), CAST(99.90 AS Decimal(18, 2)), N'INR', N'Failed')
GO
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Customers]
GO
USE [master]
GO
ALTER DATABASE [CustomerDB] SET  READ_WRITE 
GO
