USE [master]
GO
/****** Object:  Database [TelelinkedinDb]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE DATABASE [TelelinkedinDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TelelinkedinDb.mdf', FILENAME = N'D:\crap\asp.net mvc\TelelinkedinDb.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TelelinkedinDb_log.ldf', FILENAME = N'D:\crap\asp.net mvc\TelelinkedinDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TelelinkedinDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TelelinkedinDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TelelinkedinDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TelelinkedinDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TelelinkedinDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TelelinkedinDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TelelinkedinDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TelelinkedinDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TelelinkedinDb] SET  MULTI_USER 
GO
ALTER DATABASE [TelelinkedinDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TelelinkedinDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TelelinkedinDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TelelinkedinDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TelelinkedinDb', N'ON'
GO
USE [TelelinkedinDb]
GO
/****** Object:  Table [dbo].[Educations]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Institution] [nvarchar](100) NULL,
	[Specialty] [nvarchar](100) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Educations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Endorsements]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endorsements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillId] [int] NOT NULL,
	[Endorser_UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Endorsements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Employer] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Position] [nvarchar](100) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requests]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FromUserId] [int] NOT NULL,
	[FromUserName] [nvarchar](max) NULL,
	[Replied] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skills]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Follow]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Follow](
	[UserId] [int] NOT NULL,
	[FollowerId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.User_Follow] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FollowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Visibility] [int] NOT NULL,
	[JobsVisibility] [int] NOT NULL,
	[EducationVisibility] [int] NOT NULL,
	[SkillVisibility] [int] NOT NULL,
	[APIKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 7/14/2013 8:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Educations] ON 

INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (84, N'Telerik Academy', N'software engineer', CAST(0x0000A0E80175C4C4 AS DateTime), NULL, 44, N'awesome')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (93, N'Hannah & Barbara University', N'crime solving', CAST(0x00005F2B00F6D254 AS DateTime), CAST(0x000064A200000000 AS DateTime), 50, N'bachelor''s in crime solving')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (94, N'Hannah & Barbara High School', N'mathematics', CAST(0x0000597600F6D254 AS DateTime), CAST(0x00005EEC00000000 AS DateTime), 50, N'a regular high school')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (99, N'Hannah & Barbara High School', N'scarf design', CAST(0x000061C700000000 AS DateTime), CAST(0x0000678000000000 AS DateTime), 51, NULL)
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (100, N'Hannah & Barbara University', N'hair products', CAST(0x0000677C00000000 AS DateTime), CAST(0x00006D3700000000 AS DateTime), 51, N'testing various hair products')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (101, N'Pick Up University', N'getting girls', CAST(0x0000884C00000000 AS DateTime), NULL, 53, N'huh-hah-huh')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (102, N'Pick Up High School', N'getting awesome', CAST(0x0000884C00000000 AS DateTime), CAST(0x0000969100000000 AS DateTime), 53, N'getting more irresistible day by day')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (103, N'FMI', N'IT services', CAST(0x0000A0EB0116406C AS DateTime), NULL, 35, N'IT services')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (104, N'Disney University', N'mousing around', CAST(0x000036F900000000 AS DateTime), NULL, 54, N'being an annoying mouse')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (105, N'Disney U', N'duckness', CAST(0x0000314400000000 AS DateTime), NULL, 55, N'being a duck 101')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (107, N'Hannah and Barbara Community College', N'Hairdresser', CAST(0x000072E600000000 AS DateTime), CAST(0x000075C000000000 AS DateTime), 52, N'How to look fabulous')
INSERT [dbo].[Educations] ([Id], [Institution], [Specialty], [StartDate], [EndDate], [UserId], [Description]) VALUES (108, N'Warner Bros University', N'hunting wabbits', CAST(0x000072E600000000 AS DateTime), CAST(0x0000A1FE00000000 AS DateTime), 58, N'the awt of hunting wabbits')
SET IDENTITY_INSERT [dbo].[Educations] OFF
SET IDENTITY_INSERT [dbo].[Endorsements] ON 

INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (13, 31, 48)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (14, 32, 48)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (15, 60, 48)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (16, 73, 48)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (17, 35, 48)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (18, 52, 48)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (19, 77, 48)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (20, 28, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (21, 30, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (22, 29, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (23, 51, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (24, 52, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (25, 77, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (26, 72, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (27, 60, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (28, 31, 50)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (29, 60, 51)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (30, 72, 51)
INSERT [dbo].[Endorsements] ([Id], [SkillId], [Endorser_UserId]) VALUES (31, 73, 51)
SET IDENTITY_INSERT [dbo].[Endorsements] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (47, N'Mystery Inc', N'solving crimes with my crew', N'crime solver', CAST(0x0000633400000000 AS DateTime), NULL, 48)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (48, N'Mystery Inc', N'solving crimes', N'crime solver', CAST(0x0000633400000000 AS DateTime), NULL, 49)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (49, N'Mystery Inc', N'Solving mysteries with the rest of the gang', N'mystery solver', CAST(0x0000677C00000000 AS DateTime), CAST(0x0000A1FB00000000 AS DateTime), 50)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (52, N'Mystery Inc', N'Driving the mystery van', N'driver', CAST(0x0000677C00000000 AS DateTime), CAST(0x000072E600000000 AS DateTime), 51)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (53, N'HB Hair Salon', N'Styling the hair for other HB animation characters', N'hair stylist', CAST(0x000072E600000000 AS DateTime), CAST(0x0000A1FB00000000 AS DateTime), 51)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (54, N'Mystery Inc', N'Being a whiny girl', N'damsel in distress', CAST(0x0000677C00000000 AS DateTime), CAST(0x00006BC300000000 AS DateTime), 52)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (55, N'Hot Sexy Mama Inc', N'picking up chicks', N'whatever you say, baby', CAST(0x00008F6601135BCC AS DateTime), CAST(0x0000A1F700000000 AS DateTime), 53)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (57, N'Scarlet O''Hara Inc', N'Providing support services', N'support operator', CAST(0x00009ADA0116406C AS DateTime), CAST(0x0000A1ED00000000 AS DateTime), 44)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (58, N'Disney Inc.', N'Being a main hero in a lot of movies', N'animation character', CAST(0x000036F900000000 AS DateTime), NULL, 54)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (59, N'Disney', N'Being a plumber', N'plumber', CAST(0x00008F6F00000000 AS DateTime), CAST(0x0000A53200000000 AS DateTime), 55)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (60, N'Freelancer', NULL, N'freelancer', CAST(0x00009F02013269CC AS DateTime), NULL, 44)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (61, N'Warner Bros', N'a bunny in a movie', N'animated character', CAST(0x00008C9400000000 AS DateTime), NULL, 59)
INSERT [dbo].[Jobs] ([Id], [Employer], [Description], [Position], [StartDate], [EndDate], [UserId]) VALUES (62, N'Warner Bros', N'A bunny in a cartoon', N'animated character', CAST(0x0000812A00000000 AS DateTime), NULL, 57)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (23, 44, 47, N'Ivan Ivanov', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (24, 52, 51, N'Fred Jones', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (26, 49, 48, N'Scooby Doo', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (27, 50, 48, N'Scooby Doo', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (28, 50, 49, N'Shaggy Doo', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (29, 51, 49, N'Shaggy Doo', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (30, 52, 49, N'Shaggy Doo', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (31, 51, 50, N'Velma Dinkley', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (32, 52, 50, N'Velma Dinkley', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (33, 48, 52, N'Daphne Blake', 1)
INSERT [dbo].[Requests] ([Id], [UserId], [FromUserId], [FromUserName], [Replied]) VALUES (34, 51, 48, N'Scooby Doo', 0)
SET IDENTITY_INSERT [dbo].[Requests] OFF
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (23, N'Javascript', 44)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (27, N'Being scared', 48)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (28, N'Eating scooby snacks', 48)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (29, N'Mystery solving', 48)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (30, N'Comedy', 48)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (31, N'Eating scooby snacks', 49)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (32, N'Mystery solving', 49)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (35, N'Mystery solving', 50)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (50, N'Being nerdy', 50)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (51, N'Crime fighting', 51)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (52, N'Hanging out with the gang', 51)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (60, N'Hair management', 52)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (72, N'Crime solving', 52)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (73, N'Becoming a damsel in distress', 52)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (74, N'Picking up girls', 53)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (75, N'Getting girlfriends', 53)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (76, N'Being awesome', 53)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (77, N'Driving', 51)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (79, N'C#', 44)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (80, N'Being a mouse', 54)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (81, N'Eating cheese', 54)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (82, N'Plumbing', 55)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (83, N'Woodwork', 55)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (84, N'IT', 55)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (86, N'Hunting wabbits', 58)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (87, N'Hunting ducks', 58)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (88, N'Burrying', 59)
INSERT [dbo].[Skills] ([Id], [Name], [UserId]) VALUES (89, N'Burrying', 57)
SET IDENTITY_INSERT [dbo].[Skills] OFF
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (49, 48)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (50, 48)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (51, 48)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (52, 48)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (48, 49)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (50, 49)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (51, 49)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (52, 49)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (48, 50)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (49, 50)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (51, 50)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (52, 50)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (48, 51)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (49, 51)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (50, 51)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (52, 51)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (48, 52)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (49, 52)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (50, 52)
INSERT [dbo].[User_Follow] ([UserId], [FollowerId]) VALUES (51, 52)
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (35, N'admin', N'Administrator', N'Administrator', N'admin@telelinked.com', 0, 0, 0, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (44, N'vasil', N'Vasil', N'Dininski', N'dininski@gmail.com', 1, 0, 1, 0, N'4b57b86e-a5a4-42e9-8185-d2750dc8dcd7')
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (48, N'scooby', N'Scooby', N'Doo', N'scooby@doobydoo.com', 1, 1, 1, 1, N'69fe716f-651c-4656-91a2-6713f01ea985')
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (49, N'shaggy', N'Shaggy', N'Doo', N'shaggy@mysteryinc.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (50, N'velma', N'Velma', N'Dinkley', N'velma@mysteryinc.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (51, N'fred', N'Fred', N'Jones', N'fred@mysteryinc.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (52, N'daphne', N'Daphne', N'Blake', N'daphne@mysteryinc.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (53, N'johnny', N'Johnny', N'Bravo', N'johnnybravo@imawesome.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (54, N'mickey', N'Mickey', N'Mouse', N'mickey@disney.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (55, N'donald', N'Donald', N'Duck', N'donald@disney.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (56, N'daffy', N'Daffy', N'Duck', N'daffy@wb.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (57, N'buggs', N'Buggs', N'Bunny', N'buggs@wb.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (58, N'elmer', N'Elmew', N'Fudd', N'elmew@wb.com', 1, 1, 1, 1, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [Visibility], [JobsVisibility], [EducationVisibility], [SkillVisibility], [APIKey]) VALUES (59, N'marvin', N'Marvin', N'The Martian', N'marvin@wb.com', 1, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (35, CAST(0x0000A1F60119B14B AS DateTime), NULL, 1, CAST(0x0000A1F90129126D AS DateTime), 0, N'AK+UEwOx1HR/z1A3NgqMeOiIxBwz0ze1sSrvyT+ZLoIftpWAKGQZSg3IflXMi9q+tA==', CAST(0x0000A1F60119B14B AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (39, CAST(0x0000A1F9012AD065 AS DateTime), NULL, 1, NULL, 0, N'AJUrr2Cwtw0/dPUQXLkovAvNAqUOcZvTFtYDjIGORPhhrgNdxr0a/dXn1msjfw6vcw==', CAST(0x0000A1F9012AD065 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (40, CAST(0x0000A1F9013915CB AS DateTime), NULL, 1, NULL, 0, N'AOsi+5CZY0gzOXfPyqlPc2ikE2zPFSCj0QtFPimOgaHqaLURBA1METYPbWnrzzDTJg==', CAST(0x0000A1F9013915CB AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (41, CAST(0x0000A1F90139F811 AS DateTime), NULL, 1, NULL, 0, N'ADKlWA+ftKjAO4UFbxes7wdYpx2llsRdmNWvVRMF80oyW+1f1QltJJqyE4ugGHglFQ==', CAST(0x0000A1F90139F811 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (42, CAST(0x0000A1F9013AD77D AS DateTime), NULL, 1, NULL, 0, N'AHuUJ7ygADxRimhq4uYp2JENhrhNvIiChUars3UPpB3tA6gOpmSr9sr4Qqd6w0gmZw==', CAST(0x0000A1F9013AD77D AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (43, CAST(0x0000A1F9013BF9DC AS DateTime), NULL, 1, NULL, 0, N'AJQVRIvrD1Y4bprqPvIDZPlSf+lPsjGi10XLH85+PZYYA8ZW54Lz4zfcZPuemmw20Q==', CAST(0x0000A1F9013BF9DC AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (44, CAST(0x0000A1F9013C5386 AS DateTime), NULL, 1, NULL, 0, N'AIt5lI3yTMYdK1543iEg7awanAEpJEVs8B+Ns092gk0pQDG3wo6NB02H1uEKWy2EaQ==', CAST(0x0000A1F9013C5386 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (45, CAST(0x0000A1F9013C7286 AS DateTime), NULL, 1, NULL, 0, N'ANI/s8iuJAlL94n/ggR+niXgbdqmTw/PlCIwxFAuE+lj917l3p4Yb8T4ASCpvHwhyw==', CAST(0x0000A1F9013C7286 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (46, CAST(0x0000A1F90147D472 AS DateTime), NULL, 1, NULL, 0, N'ACA5uL/EOSjzFk4kbaKrNjlamfwzae6+I3T/EkmL2XvkX9ODDVzSKhQAovNGqNzXEQ==', CAST(0x0000A1F90147D472 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (47, CAST(0x0000A1F901539F8D AS DateTime), NULL, 1, NULL, 0, N'AO99D4+582UoJlcyox6jNsWDUU77ituP5/Gdp/ASHSw+1wSpCmFgwtLvU0iZmIRg3Q==', CAST(0x0000A1F901539F8D AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (48, CAST(0x0000A1FB00C02615 AS DateTime), NULL, 1, NULL, 0, N'AKd00ipWe9ZYeC9gN32McBvZrUw8hNodmVcU6RbYPYXAVHwyxsgSpb3T7ljgpM9UuQ==', CAST(0x0000A1FB00C02615 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (49, CAST(0x0000A1FB00C124B8 AS DateTime), NULL, 1, NULL, 0, N'AA5Z/62afi628q0miMMx6SJVFee5HAo2fp9rNDPKzofYLlp6iHLbsh540tyJG8rKzA==', CAST(0x0000A1FB00C124B8 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (50, CAST(0x0000A1FB00C4C51B AS DateTime), NULL, 1, NULL, 0, N'AGsvpSxPdd/5hHx1d8u+LYR3ssa5qza/bvwKbxKGtBiJ6WP8sR2nzKwS0lIlCST6QA==', CAST(0x0000A1FB00C4C51B AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (51, CAST(0x0000A1FB00CDE771 AS DateTime), NULL, 1, NULL, 0, N'AHo5gLVabqte2f4KrF2eiR203hRrmxp9pYeqRiquAHhQ/rtIQ2X4VJl+b1YtUV+1xA==', CAST(0x0000A1FB00CDE771 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (52, CAST(0x0000A1FB00D2F6DB AS DateTime), NULL, 1, NULL, 0, N'AGOfETZXO5Sx1cver3il4CpK1gdUQfdcuW/hglfuljaa8bo76OTbxRbN3n7GDDd5yg==', CAST(0x0000A1FB00D2F6DB AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (53, CAST(0x0000A1FB00E1D651 AS DateTime), NULL, 1, NULL, 0, N'AABXfGCTfcszTMCAISiK1fHyU87PkPX4cKZO3nYRWZZ9QmXO3/oeRQQ7FbDOnhTJ9Q==', CAST(0x0000A1FB00E1D651 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (54, CAST(0x0000A1FB00EB05D8 AS DateTime), NULL, 1, NULL, 0, N'AJqX6b3U3gvDmFjcKfXXQOSj4ujmoZ6XlSB288wXYfHHldMPo2oBHK5TMyntt91udQ==', CAST(0x0000A1FB00EB05D8 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (55, CAST(0x0000A1FB00EB1BA9 AS DateTime), NULL, 1, NULL, 0, N'AB4hzmF0OpzY4Gre+q1VdeRtEV5CnAj0CFKpR2RKrqKI3Wet3pEWD72boF1IwwvZEg==', CAST(0x0000A1FB00EB1BA9 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (56, CAST(0x0000A1FB00EB2F57 AS DateTime), NULL, 1, NULL, 0, N'AHwD5vJUjLUDYSt2ZfbPeXHjQmpWMMjhZ8vZZbCxYawU8vRryi4wTMsqeuvICrTNGA==', CAST(0x0000A1FB00EB2F57 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (57, CAST(0x0000A1FB00EB4630 AS DateTime), NULL, 1, NULL, 0, N'AG7dGJ8elq70nLHcWenkUL9iErYsfcGqNmaXZOvsH6i7GSlOfbHvSK+/IxX4CubGLg==', CAST(0x0000A1FB00EB4630 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (58, CAST(0x0000A1FB00EB5DAE AS DateTime), NULL, 1, NULL, 0, N'AEmf8j+VM0wdibenk0l+tzcwcvrfadHX8i7nZY3HfH5X1JNsz5SUqviRROJQ4Y0sqQ==', CAST(0x0000A1FB00EB5DAE AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (59, CAST(0x0000A1FB00EB75A7 AS DateTime), NULL, 1, NULL, 0, N'AMURUxOUsYMFWFkFvKNGuVQobjkeNe878VE9U+I47kpo5+nsme7ef5inFvXUn+yzVA==', CAST(0x0000A1FB00EB75A7 AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (35, 1)
/****** Object:  Index [IX_UserId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Educations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Endorser_UserId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Endorser_UserId] ON [dbo].[Endorsements]
(
	[Endorser_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SkillId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_SkillId] ON [dbo].[Endorsements]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Jobs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Requests]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Skills]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FollowerId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FollowerId] ON [dbo].[User_Follow]
(
	[FollowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/14/2013 8:35:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[User_Follow]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160A363A6A9]    Script Date: 7/14/2013 8:35:38 PM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT ((0)) FOR [FromUserId]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT ((0)) FOR [Replied]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [Visibility]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [JobsVisibility]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [EducationVisibility]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [SkillVisibility]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Educations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Educations_dbo.UserProfile_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Educations] CHECK CONSTRAINT [FK_dbo.Educations_dbo.UserProfile_UserId]
GO
ALTER TABLE [dbo].[Endorsements]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Endorsements_dbo.Skills_SkillId] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Endorsements] CHECK CONSTRAINT [FK_dbo.Endorsements_dbo.Skills_SkillId]
GO
ALTER TABLE [dbo].[Endorsements]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Endorsements_dbo.UserProfile_Endorser_UserId] FOREIGN KEY([Endorser_UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Endorsements] CHECK CONSTRAINT [FK_dbo.Endorsements_dbo.UserProfile_Endorser_UserId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Jobs_dbo.UserProfile_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_dbo.Jobs_dbo.UserProfile_UserId]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Requests_dbo.UserProfile_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_dbo.Requests_dbo.UserProfile_UserId]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Skills_dbo.UserProfile_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_dbo.Skills_dbo.UserProfile_UserId]
GO
ALTER TABLE [dbo].[User_Follow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_Follow_dbo.UserProfile_FollowerId] FOREIGN KEY([FollowerId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[User_Follow] CHECK CONSTRAINT [FK_dbo.User_Follow_dbo.UserProfile_FollowerId]
GO
ALTER TABLE [dbo].[User_Follow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_Follow_dbo.UserProfile_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[User_Follow] CHECK CONSTRAINT [FK_dbo.User_Follow_dbo.UserProfile_UserId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [TelelinkedinDb] SET  READ_WRITE 
GO
