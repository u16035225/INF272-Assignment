USE [master]
GO
/****** Object:  Database [JobTinder]    Script Date: 2019/10/21 10:09:57 ******/
CREATE DATABASE [JobTinder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobTinder', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\JobTinder.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JobTinder_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\JobTinder_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JobTinder] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobTinder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobTinder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobTinder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobTinder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobTinder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobTinder] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobTinder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobTinder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobTinder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobTinder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobTinder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobTinder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobTinder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobTinder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobTinder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobTinder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobTinder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobTinder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobTinder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobTinder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobTinder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobTinder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobTinder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobTinder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JobTinder] SET  MULTI_USER 
GO
ALTER DATABASE [JobTinder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobTinder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobTinder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobTinder] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JobTinder] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobTinder', N'ON'
GO
USE [JobTinder]
GO
/****** Object:  Table [dbo].[City]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_ID] [nchar](10) NOT NULL,
	[City_Des] [nchar](50) NOT NULL,
	[Surburb_ID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Company_ID] [int] NOT NULL,
	[Company_Name] [nchar](50) NOT NULL,
	[Company_Des] [nchar](50) NOT NULL,
	[Company_AddressID] [nchar](10) NOT NULL,
	[Company_ContactID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Login]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Login](
	[Company_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](25) NOT NULL,
	[Company_Password] [nchar](15) NOT NULL,
	[Company_Name] [nchar](50) NOT NULL,
	[Company_Email] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Company_Login] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Registration]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](50) NULL,
	[Password] [nchar](10) NULL,
	[CompanyName] [nchar](100) NULL,
	[Email] [nchar](100) NULL,
 CONSTRAINT [PK_Company_Registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyAddress]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyAddress](
	[Company_AddressID] [nchar](10) NOT NULL,
	[Surburb_ID] [nchar](10) NOT NULL,
	[City_ID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CompanyAddress] PRIMARY KEY CLUSTERED 
(
	[Company_AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyContactDetails]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyContactDetails](
	[Company_ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Company_Email] [nchar](50) NOT NULL,
	[Company_TelNo] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CompanyContactDetails] PRIMARY KEY CLUSTERED 
(
	[Company_ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyListing]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyListing](
	[Company_ID] [int] IDENTITY(1,1) NOT NULL,
	[Com_CareerField] [nchar](50) NOT NULL,
	[Com_Specialization] [nchar](50) NOT NULL,
	[Com_JobPosition] [nchar](50) NOT NULL,
	[Com_Location] [nchar](50) NOT NULL,
	[Com_YearsofEx] [nchar](10) NOT NULL,
	[Com_Education] [nchar](50) NOT NULL,
	[Com_WillToRelocate] [int] NULL,
	[Com_AddSkills] [nchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyListing] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyLogin]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyLogin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [varchar](50) NULL,
	[Upassword] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyRegistration]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyRegistration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CProfile]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyNumber] [int] NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [varchar](1) NOT NULL,
	[Description] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CRegister]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRegister](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[EmailVerification] [bit] NULL,
	[ActivationCode] [uniqueidentifier] NULL,
	[OPT] [nvarchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobSeeker]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeeker](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[js_Name] [nchar](15) NOT NULL,
	[js_Surname] [nchar](10) NOT NULL,
	[js_Address_ID] [nchar](10) NOT NULL,
	[js_Contact_ID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_JobSeeker] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobSeekerAddress]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeekerAddress](
	[js_Address_ID] [nchar](10) NOT NULL,
	[js_Address_des] [nchar](10) NULL,
	[Surburb_ID] [nchar](10) NOT NULL,
	[City_ID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_JobSeekerAddress] PRIMARY KEY CLUSTERED 
(
	[js_Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobSeekerContactDetails]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeekerContactDetails](
	[js_Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[js_Cell_number] [nchar](10) NOT NULL,
	[js_email_address] [nchar](50) NOT NULL,
 CONSTRAINT [PK_JobSeekerContactDetails] PRIMARY KEY CLUSTERED 
(
	[js_Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobSeekerQualifications]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobSeekerQualifications](
	[user_ID] [nchar](10) NOT NULL,
	[js_CareerField] [nchar](50) NOT NULL,
	[js_Specialization] [nchar](50) NOT NULL,
	[js_YearsofEx] [nchar](10) NULL,
	[js_Education] [nchar](50) NOT NULL,
	[js_AdditionalSkills] [char](10) NULL,
 CONSTRAINT [PK_JobSeekerQualifications] PRIMARY KEY CLUSTERED 
(
	[user_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobSeekerRegister]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeekerRegister](
	[Id] [int] NOT NULL,
	[Username] [nchar](20) NULL,
	[FirstName] [nchar](50) NULL,
	[LastName] [nchar](50) NULL,
	[Password] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobSRegister]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobSRegister](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LaststName] [varchar](50) NULL,
	[CellNumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[EmailVerification] [bit] NULL,
	[ActivationCode] [uniqueidentifier] NULL,
	[OPT] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JSProfile]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JSProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LaststName] [varchar](50) NULL,
	[CellNumber] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Qualifcation] [varchar](500) NULL,
	[Skills] [varchar](500) NULL,
	[ImagePath] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JsQualifications]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JsQualifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [varchar](50) NULL,
	[Uemail] [varchar](50) NULL,
	[Upassword] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[Uimg] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lisitings]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lisitings](
	[Company_ID] [int] IDENTITY(1,1) NOT NULL,
	[Com_JobPosition] [nchar](50) NOT NULL,
	[Com_CareerField] [nchar](50) NOT NULL,
	[Com_Location] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Lisitings] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Surburb]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surburb](
	[Surburb_ID] [nchar](10) NOT NULL,
	[Surburb_Des] [nchar](50) NOT NULL,
	[City_ID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Surburb] PRIMARY KEY CLUSTERED 
(
	[Surburb_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCredentials]    Script Date: 2019/10/21 10:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCredentials](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](25) NOT NULL,
	[js_Password] [nchar](10) NOT NULL,
 CONSTRAINT [PK_UserCredentials] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_CompanyAddress] FOREIGN KEY([Company_AddressID])
REFERENCES [dbo].[CompanyAddress] ([Company_AddressID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_CompanyAddress]
GO
ALTER TABLE [dbo].[Company_Login]  WITH CHECK ADD  CONSTRAINT [FK_Company_Login_Company] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[Company] ([Company_ID])
GO
ALTER TABLE [dbo].[Company_Login] CHECK CONSTRAINT [FK_Company_Login_Company]
GO
ALTER TABLE [dbo].[Company_Registration]  WITH CHECK ADD  CONSTRAINT [FK_Company_Registration_Company] FOREIGN KEY([Id])
REFERENCES [dbo].[Company] ([Company_ID])
GO
ALTER TABLE [dbo].[Company_Registration] CHECK CONSTRAINT [FK_Company_Registration_Company]
GO
ALTER TABLE [dbo].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyAddress_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([City_ID])
GO
ALTER TABLE [dbo].[CompanyAddress] CHECK CONSTRAINT [FK_CompanyAddress_City]
GO
ALTER TABLE [dbo].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyAddress_Surburb] FOREIGN KEY([Surburb_ID])
REFERENCES [dbo].[Surburb] ([Surburb_ID])
GO
ALTER TABLE [dbo].[CompanyAddress] CHECK CONSTRAINT [FK_CompanyAddress_Surburb]
GO
ALTER TABLE [dbo].[CompanyListing]  WITH CHECK ADD  CONSTRAINT [FK_CompanyListing_Company] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[Company] ([Company_ID])
GO
ALTER TABLE [dbo].[CompanyListing] CHECK CONSTRAINT [FK_CompanyListing_Company]
GO
ALTER TABLE [dbo].[JobSeeker]  WITH CHECK ADD  CONSTRAINT [FK_JobSeeker_JobSeekerAddress] FOREIGN KEY([js_Address_ID])
REFERENCES [dbo].[JobSeekerAddress] ([js_Address_ID])
GO
ALTER TABLE [dbo].[JobSeeker] CHECK CONSTRAINT [FK_JobSeeker_JobSeekerAddress]
GO
ALTER TABLE [dbo].[JobSeeker]  WITH CHECK ADD  CONSTRAINT [FK_JobSeeker_UserCredentials] FOREIGN KEY([userID])
REFERENCES [dbo].[UserCredentials] ([userID])
GO
ALTER TABLE [dbo].[JobSeeker] CHECK CONSTRAINT [FK_JobSeeker_UserCredentials]
GO
ALTER TABLE [dbo].[JobSeekerAddress]  WITH CHECK ADD  CONSTRAINT [FK_JobSeekerAddress_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([City_ID])
GO
ALTER TABLE [dbo].[JobSeekerAddress] CHECK CONSTRAINT [FK_JobSeekerAddress_City]
GO
ALTER TABLE [dbo].[JobSeekerAddress]  WITH CHECK ADD  CONSTRAINT [FK_JobSeekerAddress_Surburb] FOREIGN KEY([Surburb_ID])
REFERENCES [dbo].[Surburb] ([Surburb_ID])
GO
ALTER TABLE [dbo].[JobSeekerAddress] CHECK CONSTRAINT [FK_JobSeekerAddress_Surburb]
GO
ALTER TABLE [dbo].[Lisitings]  WITH CHECK ADD  CONSTRAINT [FK_Lisitings_CompanyListing] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[CompanyListing] ([Company_ID])
GO
ALTER TABLE [dbo].[Lisitings] CHECK CONSTRAINT [FK_Lisitings_CompanyListing]
GO
USE [master]
GO
ALTER DATABASE [JobTinder] SET  READ_WRITE 
GO
