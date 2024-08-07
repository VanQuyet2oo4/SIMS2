USE [master]
GO
/****** Object:  Database [son]    Script Date: 8/1/2024 8:44:45 PM ******/
CREATE DATABASE [son]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'son', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\son.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'son_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\son_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [son] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [son].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [son] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [son] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [son] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [son] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [son] SET ARITHABORT OFF 
GO
ALTER DATABASE [son] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [son] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [son] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [son] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [son] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [son] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [son] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [son] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [son] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [son] SET  ENABLE_BROKER 
GO
ALTER DATABASE [son] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [son] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [son] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [son] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [son] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [son] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [son] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [son] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [son] SET  MULTI_USER 
GO
ALTER DATABASE [son] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [son] SET DB_CHAINING OFF 
GO
ALTER DATABASE [son] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [son] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [son] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [son] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'son', N'ON'
GO
ALTER DATABASE [son] SET QUERY_STORE = ON
GO
ALTER DATABASE [son] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [son]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 8/1/2024 8:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[TeacherId] [int] NULL,
	[Semester] [nvarchar](max) NULL,
	[Year] [int] NOT NULL,
	[RoomName] [varchar](50) NULL,
	[ClassName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/1/2024 8:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](max) NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[Credits] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 8/1/2024 8:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeStudent] [decimal](3, 2) NULL,
	[CourseId] [int] NOT NULL,
	[ClassId] [int] NULL,
	[StudentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/1/2024 8:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/1/2024 8:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NULL,
	[MajorName] [nvarchar](100) NULL,
	[Username] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 8/1/2024 8:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[RandomKey] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
	[Username] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([ClassId], [CourseId], [TeacherId], [Semester], [Year], [RoomName], [ClassName]) VALUES (4, 1, 4, N'Fall', 2024, N'205', N'English')
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [Credits]) VALUES (1, N'Art 101 ', N'fasfasaf', 5)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([GradeId], [GradeStudent], [CourseId], [ClassId], [StudentId]) VALUES (1, CAST(8.00 AS Decimal(3, 2)), 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Teacher')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Student')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [Name], [Address], [PhoneNumber], [Email], [Password], [RoleId], [MajorName], [Username]) VALUES (1, N'Anna Lee', N'789 Elm St123', N'111-222-3333', N'anna.lee@example.com', N'securepass123', 2, N'Computer Science', N'alee')
INSERT [dbo].[Students] ([StudentId], [Name], [Address], [PhoneNumber], [Email], [Password], [RoleId], [MajorName], [Username]) VALUES (2, N'Brian Green', N'123 Maple St', N'222-333-4444', N'brian.green@example.com', N'mypassword', 2, N'Mathematics', N'bgreen')
INSERT [dbo].[Students] ([StudentId], [Name], [Address], [PhoneNumber], [Email], [Password], [RoleId], [MajorName], [Username]) VALUES (3, N'Catherine Brown', N'456 Oak Ave', N'333-444-5555', N'catherine.brown@example.com', N'pass789', 2, N'Physics', N'cbrown')
INSERT [dbo].[Students] ([StudentId], [Name], [Address], [PhoneNumber], [Email], [Password], [RoleId], [MajorName], [Username]) VALUES (4, N'David Smith', N'321 Pine Rd', N'444-555-6666', N'david.smith@example.com', N'david1234', 2, N'Chemistry', N'dsmith')
INSERT [dbo].[Students] ([StudentId], [Name], [Address], [PhoneNumber], [Email], [Password], [RoleId], [MajorName], [Username]) VALUES (5, N'Emily White', N'654 Cedar Ln', N'555-666-7777', N'emily.white@example.com', N'emilypass', 2, N'Biology', N'ewhite')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherId], [Name], [Password], [Address], [Email], [PhoneNumber], [RandomKey], [RoleId], [Username]) VALUES (2, N'John Doe', N'password123', N'123 Main St', N'john.doe@example.com', N'123-456-7890', N'key1', 1, N'jdoe')
INSERT [dbo].[Teachers] ([TeacherId], [Name], [Password], [Address], [Email], [PhoneNumber], [RandomKey], [RoleId], [Username]) VALUES (3, N'Jane Smith', N'password456', N'456 Oak Ave', N'jane.smith@example.com', N'987-654-3210', N'key2', 1, N'jsmith')
INSERT [dbo].[Teachers] ([TeacherId], [Name], [Password], [Address], [Email], [PhoneNumber], [RandomKey], [RoleId], [Username]) VALUES (4, N'Alice Johnson', N'password789', N'789 Pine Rd', N'alice.johnson@example.com', N'555-555-5555', N'key3', 1, N'ajohnson')
INSERT [dbo].[Teachers] ([TeacherId], [Name], [Password], [Address], [Email], [PhoneNumber], [RandomKey], [RoleId], [Username]) VALUES (5, N'Bob Brown', N'password101', N'101 Maple Ln', N'bob.brown@example.com', N'444-444-4444', N'key4', 1, N'bbrown')
INSERT [dbo].[Teachers] ([TeacherId], [Name], [Password], [Address], [Email], [PhoneNumber], [RandomKey], [RoleId], [Username]) VALUES (6, N'Carol White', N'password202', N'202 Birch St', N'carol.white@example.com', N'333-333-3333', N'key5', 1, N'cwhite')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
/****** Object:  Index [IX_Classes_CourseId]    Script Date: 8/1/2024 8:44:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_Classes_CourseId] ON [dbo].[Classes]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Classes_TeacherId]    Script Date: 8/1/2024 8:44:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_Classes_TeacherId] ON [dbo].[Classes]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_Username]  DEFAULT ('') FOR [Username]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_Password]  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_Username]  DEFAULT ('') FOR [Username]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([ClassId])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Classes]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
USE [master]
GO
ALTER DATABASE [son] SET  READ_WRITE 
GO
