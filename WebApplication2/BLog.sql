USE [master]
GO
/****** Object:  Database [Blog]    Script Date: 4/5/2019 10:55:18 PM ******/
CREATE DATABASE [Blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Blog.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Blog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Blog_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Blog] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blog] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Blog] SET  MULTI_USER 
GO
ALTER DATABASE [Blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blog] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Blog]
GO
/****** Object:  StoredProcedure [dbo].[BanTin_Delete]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BanTin_Delete](
	@IDBanTin int
)
AS
Begin
	Delete FROM BanTin WHERE IDBanTin=@IDBanTin
END

GO
/****** Object:  StoredProcedure [dbo].[BanTin_Insert]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BanTin_Insert](
	@noiDung nvarchar(50)
)
AS
Begin
	INSERT INTO BanTin(noiDung) VALUES (@noiDung)
End

GO
/****** Object:  StoredProcedure [dbo].[BanTin_SelectAll]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BanTin_SelectAll]
AS
Begin
	SELECT* FROM BanTin
End

GO
/****** Object:  StoredProcedure [dbo].[BanTin_Update]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BanTin_Update](
	@noiDung nvarchar(50),
	@IDBanTin int
)
AS
Begin
	Update BanTin SET noiDung= @noiDung WHERE IDBanTin=@IDBanTin
End

GO
/****** Object:  StoredProcedure [dbo].[ChiTiet_ID]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChiTiet_ID](
	@IDBanTin int
)
AS
Begin
	SELECT * FROM ChiTiet WHERE IDBanTin=@IDBanTin
END

GO
/****** Object:  StoredProcedure [dbo].[ChiTiet_Insert]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChiTiet_Insert](
	@tieuDe nvarchar(200),
	@noiDung nvarchar(max),
	@ngayDang datetime,
	@IDBanTin int
)
AS
Begin
	INSERT INTO ChiTiet(tieuDe,noiDung,ngayDang, IDBanTin)
	VALUES (@tieuDe, @noiDung, @ngayDang, @IDBanTin)
END

GO
/****** Object:  StoredProcedure [dbo].[ChiTiet_SelectAll]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChiTiet_SelectAll]
AS
Begin
	SELECT * FROM ChiTiet
END

GO
/****** Object:  StoredProcedure [dbo].[ChiTiet_SELECTID]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChiTiet_SELECTID](
	@ID int
)
AS
Begin
	SELECT * FROM ChiTiet WHERE ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[ChiTiet_SLX]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChiTiet_SLX](
	@lanXem int,
	@ID int
)
AS
Begin
	UPDATE ChiTiet SET lanXem=@lanXem WHERE ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[ChiTiet_Update]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChiTiet_Update](
	@tieuDe nvarchar(200),
	@noiDung nvarchar(max),
	@ID int
)
AS
Begin
	UPDATE ChiTiet SET	 tieuDe=@tieuDe, noiDung=@noiDung WHERE ID=@ID
END

GO
/****** Object:  Table [dbo].[BanTin]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanTin](
	[IDBanTin] [int] IDENTITY(1,1) NOT NULL,
	[noiDung] [nvarchar](50) NULL,
 CONSTRAINT [PK_BanTin] PRIMARY KEY CLUSTERED 
(
	[IDBanTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTiet]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tieuDe] [nvarchar](200) NULL,
	[noiDung] [nvarchar](max) NULL,
	[lanXem] [int] NULL,
	[ngayDang] [datetime] NULL,
	[IDBanTin] [int] NULL,
 CONSTRAINT [PK_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 4/5/2019 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[IDName] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[passWord] [nvarchar](50) NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[IDName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_BanTin] FOREIGN KEY([IDBanTin])
REFERENCES [dbo].[BanTin] ([IDBanTin])
GO
ALTER TABLE [dbo].[ChiTiet] CHECK CONSTRAINT [FK_ChiTiet_BanTin]
GO
USE [master]
GO
ALTER DATABASE [Blog] SET  READ_WRITE 
GO
