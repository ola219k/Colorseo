USE [master]
GO
/****** Object:  Database [blog]    Script Date: 24-11-2020 3:31:23 PM ******/
CREATE DATABASE [blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\blog.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'blog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\blog_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [blog] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [blog] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blog] SET  ENABLE_BROKER 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [blog] SET  MULTI_USER 
GO
ALTER DATABASE [blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blog] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [blog] SET DELAYED_DURABILITY = DISABLED 
GO
USE [blog]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[parentId] [bigint] NULL CONSTRAINT [DF__category__parent__276EDEB3]  DEFAULT (NULL),
	[title] [varchar](75) NOT NULL,
	[metaTitle] [varchar](100) NULL CONSTRAINT [DF__category__metaTi__286302EC]  DEFAULT (NULL),
	[slug] [varchar](100) NOT NULL,
	[content] [text] NULL CONSTRAINT [DF__category__conten__29572725]  DEFAULT (NULL),
 CONSTRAINT [PK__category__3213E83FF3F020AE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthorID] [bigint] NOT NULL,
	[ParentID] [bigint] NOT NULL CONSTRAINT [DF__post__parentId__182C9B23]  DEFAULT (NULL),
	[Title] [varchar](75) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Summary] [text] NULL,
	[Published] [int] NOT NULL CONSTRAINT [DF__post__published__1920BF5C]  DEFAULT ((0)),
	[CategoryID] [bigint] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL CONSTRAINT [DF__post__updatedAt__1A14E395]  DEFAULT (NULL),
	[MetaKeywords] [nvarchar](250) NULL,
	[MeteDescriptions] [nchar](250) NULL,
	[Content] [nvarchar](2500) NULL CONSTRAINT [DF__post__content__1BFD2C07]  DEFAULT (NULL),
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK__post__3213E83F8AF3D127] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostCategory]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()),
	[ModifiledDate] [datetime] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MeteDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostComment]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostComment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[postId] [bigint] NOT NULL,
	[parentId] [bigint] NULL,
	[title] [varchar](100) NOT NULL,
	[published] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[publishedAt] [datetime] NULL,
	[content] [text] NULL,
 CONSTRAINT [PK__post_com__3213E83F242C1CEC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostMeta]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostMeta](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[postId] [bigint] NOT NULL,
	[keys] [varchar](50) NOT NULL,
	[content] [text] NULL,
 CONSTRAINT [PK__post_met__3213E83F1A01C30F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Share]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Share](
	[socialNetwork] [nvarchar](50) NOT NULL,
	[icon] [varchar](50) NOT NULL,
	[URL] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL CONSTRAINT [DF__users__firstName__108B795B]  DEFAULT (NULL),
	[LastName] [varchar](50) NULL CONSTRAINT [DF__users__lastName__1273C1CD]  DEFAULT (NULL),
	[UserName] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](32) NOT NULL,
	[GroupID] [varchar](20) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiledDate] [datetime] NULL CONSTRAINT [DF__users__lastLogin__1367E606]  DEFAULT (NULL),
	[Intro] [varchar](32) NULL CONSTRAINT [DF__users__intro__145C0A3F]  DEFAULT (NULL),
	[Profiles] [text] NULL CONSTRAINT [DF__users__profiles__15502E78]  DEFAULT (NULL),
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__users__3213E83F72DD61AB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[UsersGroup]    Script Date: 24-11-2020 3:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersGroup](
	[ID] [nchar](50) NOT NULL,
	[Name] [nchar](50) NULL,
 CONSTRAINT [PK_UsersGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [parentId], [title], [metaTitle], [slug], [content]) VALUES (1, 1, N'1', N'1', N'1', N'1')
INSERT [dbo].[Category] ([id], [parentId], [title], [metaTitle], [slug], [content]) VALUES (2, 2, N'2', N'2', N'2', N'2')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang Chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Login', N'/login', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Register', N'/register', 2, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Game', N'/game', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Sports', N'/sports', 1, N'_self', 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([ID], [AuthorID], [ParentID], [Title], [MetaTitle], [Image], [MoreImages], [Summary], [Published], [CategoryID], [CreatedDate], [UpdatedDate], [MetaKeywords], [MeteDescriptions], [Content], [Status], [TopHot], [ViewCount]) VALUES (1, 1, 1, N'How to Write Comments That Stand Out (for the Right Reasons)1', N'aa', N'/assets/client/images/black-pink-1-5795-1599041757.jpg', NULL, N'sadasd', 213, 2, CAST(N'2020-12-22 00:00:00.000' AS DateTime), CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, N'Content is King là một câu nói kinh điển, bây giờ nó vẫn đúng và trong tương lai cũng vậy, trong thế giới Digital marketing hiện đại Content là một vũ khí hiệu quả trong Inbound Marketing nó có sức hút mạnh mẽ với các doanh nghiệp các cá nhân kinh doanh trực tuyến.

Có thể bạn mới bắt đầu với Content trên môi trường trực tuyến hay bạn đã là một tay viết lão luyện nhưng tôi khuyên bạn cần có một kế hoạch và một lộ trình rõ ràng để hình dung về bức tranh lớn mà những Content bạn tạo ra nó có những vai trò nhất định trong bức tranh đó.

Điều quan trọng nữa là bạn cần phải có một chiến lược, sẽ không có một chiến lược nào phù hợp cho tất cả các lĩnh vực cụ thể, nhưng chắc chắn rằng khi tìm hiểu và nghiên cứu để tìm một chiến lược cho riêng mình kết quả đạt được sẽ tốt hơn nhiều, có thể bạn không cần tin lời tôi nói, thời gian sẽ có câu trả lời chính xác cho bạn.', NULL, NULL, NULL)
INSERT [dbo].[Post] ([ID], [AuthorID], [ParentID], [Title], [MetaTitle], [Image], [MoreImages], [Summary], [Published], [CategoryID], [CreatedDate], [UpdatedDate], [MetaKeywords], [MeteDescriptions], [Content], [Status], [TopHot], [ViewCount]) VALUES (5, 2, 1, N'How to Write Comments That Stand Out (for the Right Reasons)2', N'aa', N'/assets/client/images/black-pink-1-5795-1599041757.jpg', NULL, N'ádâsdc', 123, 2, CAST(N'2020-12-22 00:00:00.000' AS DateTime), CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, N'Content is King là một câu nói kinh điển, bây giờ nó vẫn đúng và trong tương lai cũng vậy, trong thế giới Digital marketing hiện đại Content là một vũ khí hiệu quả trong Inbound Marketing nó có sức hút mạnh mẽ với các doanh nghiệp các cá nhân kinh doanh trực tuyến.

Có thể bạn mới bắt đầu với Content trên môi trường trực tuyến hay bạn đã là một tay viết lão luyện nhưng tôi khuyên bạn cần có một kế hoạch và một lộ trình rõ ràng để hình dung về bức tranh lớn mà những Content bạn tạo ra nó có những vai trò nhất định trong bức tranh đó.

Điều quan trọng nữa là bạn cần phải có một chiến lược, sẽ không có một chiến lược nào phù hợp cho tất cả các lĩnh vực cụ thể, nhưng chắc chắn rằng khi tìm hiểu và nghiên cứu để tìm một chiến lược cho riêng mình kết quả đạt được sẽ tốt hơn nhiều, có thể bạn không cần tin lời tôi nói, thời gian sẽ có câu trả lời chính xác cho bạn.', NULL, NULL, NULL)
INSERT [dbo].[Post] ([ID], [AuthorID], [ParentID], [Title], [MetaTitle], [Image], [MoreImages], [Summary], [Published], [CategoryID], [CreatedDate], [UpdatedDate], [MetaKeywords], [MeteDescriptions], [Content], [Status], [TopHot], [ViewCount]) VALUES (6, 2, 1, N'How to Write Comments That Stand Out (for the Right Reasons)3', N'aa', N'/assets/client/images/503bfd82281ed4408d0f.jpg', NULL, N'ádâsdc', 123, 2, CAST(N'2020-12-22 00:00:00.000' AS DateTime), CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, N'Content is King là một câu nói kinh điển, bây giờ nó vẫn đúng và trong tương lai cũng vậy, trong thế giới Digital marketing hiện đại Content là một vũ khí hiệu quả trong Inbound Marketing nó có sức hút mạnh mẽ với các doanh nghiệp các cá nhân kinh doanh trực tuyến.

Có thể bạn mới bắt đầu với Content trên môi trường trực tuyến hay bạn đã là một tay viết lão luyện nhưng tôi khuyên bạn cần có một kế hoạch và một lộ trình rõ ràng để hình dung về bức tranh lớn mà những Content bạn tạo ra nó có những vai trò nhất định trong bức tranh đó.

Điều quan trọng nữa là bạn cần phải có một chiến lược, sẽ không có một chiến lược nào phù hợp cho tất cả các lĩnh vực cụ thể, nhưng chắc chắn rằng khi tìm hiểu và nghiên cứu để tìm một chiến lược cho riêng mình kết quả đạt được sẽ tốt hơn nhiều, có thể bạn không cần tin lời tôi nói, thời gian sẽ có câu trả lời chính xác cho bạn.', NULL, NULL, NULL)
INSERT [dbo].[Post] ([ID], [AuthorID], [ParentID], [Title], [MetaTitle], [Image], [MoreImages], [Summary], [Published], [CategoryID], [CreatedDate], [UpdatedDate], [MetaKeywords], [MeteDescriptions], [Content], [Status], [TopHot], [ViewCount]) VALUES (7, 2, 1, N'How to Write Comments That Stand Out (for the Right Reasons)4', N'aa', N'/assets/client/images/aerial-3246120_1280.jpg', NULL, N'ádâsdc', 123, 2, CAST(N'2020-12-22 00:00:00.000' AS DateTime), CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, N'Content is King là một câu nói kinh điển, bây giờ nó vẫn đúng và trong tương lai cũng vậy, trong thế giới Digital marketing hiện đại Content là một vũ khí hiệu quả trong Inbound Marketing nó có sức hút mạnh mẽ với các doanh nghiệp các cá nhân kinh doanh trực tuyến.

Có thể bạn mới bắt đầu với Content trên môi trường trực tuyến hay bạn đã là một tay viết lão luyện nhưng tôi khuyên bạn cần có một kế hoạch và một lộ trình rõ ràng để hình dung về bức tranh lớn mà những Content bạn tạo ra nó có những vai trò nhất định trong bức tranh đó.

Điều quan trọng nữa là bạn cần phải có một chiến lược, sẽ không có một chiến lược nào phù hợp cho tất cả các lĩnh vực cụ thể, nhưng chắc chắn rằng khi tìm hiểu và nghiên cứu để tìm một chiến lược cho riêng mình kết quả đạt được sẽ tốt hơn nhiều, có thể bạn không cần tin lời tôi nói, thời gian sẽ có câu trả lời chính xác cho bạn.', NULL, NULL, NULL)
INSERT [dbo].[Post] ([ID], [AuthorID], [ParentID], [Title], [MetaTitle], [Image], [MoreImages], [Summary], [Published], [CategoryID], [CreatedDate], [UpdatedDate], [MetaKeywords], [MeteDescriptions], [Content], [Status], [TopHot], [ViewCount]) VALUES (8, 2, 1, N'How to Write Comments That Stand Out (for the Right Reasons)5', N'aa', N'/assets/client/images/unnamed.jpg', NULL, N'ádâsdc', 123, 2, CAST(N'2020-12-22 00:00:00.000' AS DateTime), CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, N'Content is King là một câu nói kinh điển, bây giờ nó vẫn đúng và trong tương lai cũng vậy, trong thế giới Digital marketing hiện đại Content là một vũ khí hiệu quả trong Inbound Marketing nó có sức hút mạnh mẽ với các doanh nghiệp các cá nhân kinh doanh trực tuyến.

Có thể bạn mới bắt đầu với Content trên môi trường trực tuyến hay bạn đã là một tay viết lão luyện nhưng tôi khuyên bạn cần có một kế hoạch và một lộ trình rõ ràng để hình dung về bức tranh lớn mà những Content bạn tạo ra nó có những vai trò nhất định trong bức tranh đó.

Điều quan trọng nữa là bạn cần phải có một chiến lược, sẽ không có một chiến lược nào phù hợp cho tất cả các lĩnh vực cụ thể, nhưng chắc chắn rằng khi tìm hiểu và nghiên cứu để tìm một chiến lược cho riêng mình kết quả đạt được sẽ tốt hơn nhiều, có thể bạn không cần tin lời tôi nói, thời gian sẽ có câu trả lời chính xác cho bạn.', NULL, NULL, NULL)
INSERT [dbo].[Post] ([ID], [AuthorID], [ParentID], [Title], [MetaTitle], [Image], [MoreImages], [Summary], [Published], [CategoryID], [CreatedDate], [UpdatedDate], [MetaKeywords], [MeteDescriptions], [Content], [Status], [TopHot], [ViewCount]) VALUES (9, 2, 1, N'How to Write Comments That Stand Out (for the Right Reasons)6', N'aa', N'/assets/client/images/black-pink-1-5795-1599041757.jpg', NULL, N'ádâsdc', 123, 2, CAST(N'2020-12-22 00:00:00.000' AS DateTime), CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, N'Content is King là một câu nói kinh điển, bây giờ nó vẫn đúng và trong tương lai cũng vậy, trong thế giới Digital marketing hiện đại Content là một vũ khí hiệu quả trong Inbound Marketing nó có sức hút mạnh mẽ với các doanh nghiệp các cá nhân kinh doanh trực tuyến.

Có thể bạn mới bắt đầu với Content trên môi trường trực tuyến hay bạn đã là một tay viết lão luyện nhưng tôi khuyên bạn cần có một kế hoạch và một lộ trình rõ ràng để hình dung về bức tranh lớn mà những Content bạn tạo ra nó có những vai trò nhất định trong bức tranh đó.

Điều quan trọng nữa là bạn cần phải có một chiến lược, sẽ không có một chiến lược nào phù hợp cho tất cả các lĩnh vực cụ thể, nhưng chắc chắn rằng khi tìm hiểu và nghiên cứu để tìm một chiến lược cho riêng mình kết quả đạt được sẽ tốt hơn nhiều, có thể bạn không cần tin lời tôi nói, thời gian sẽ có câu trả lời chính xác cho bạn.', NULL, NULL, NULL)
INSERT [dbo].[Post] ([ID], [AuthorID], [ParentID], [Title], [MetaTitle], [Image], [MoreImages], [Summary], [Published], [CategoryID], [CreatedDate], [UpdatedDate], [MetaKeywords], [MeteDescriptions], [Content], [Status], [TopHot], [ViewCount]) VALUES (10, 2, 1, N'How to Write Comments That Stand Out (for the Right Reasons)7', N'aa', N'/assets/client/images/black-pink-1-5795-1599041757.jpg', NULL, N'ádâsdc', 123, 2, CAST(N'2020-12-22 00:00:00.000' AS DateTime), CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, N'Content is King là một câu nói kinh điển, bây giờ nó vẫn đúng và trong tương lai cũng vậy, trong thế giới Digital marketing hiện đại Content là một vũ khí hiệu quả trong Inbound Marketing nó có sức hút mạnh mẽ với các doanh nghiệp các cá nhân kinh doanh trực tuyến.

Có thể bạn mới bắt đầu với Content trên môi trường trực tuyến hay bạn đã là một tay viết lão luyện nhưng tôi khuyên bạn cần có một kế hoạch và một lộ trình rõ ràng để hình dung về bức tranh lớn mà những Content bạn tạo ra nó có những vai trò nhất định trong bức tranh đó.

Điều quan trọng nữa là bạn cần phải có một chiến lược, sẽ không có một chiến lược nào phù hợp cho tất cả các lĩnh vực cụ thể, nhưng chắc chắn rằng khi tìm hiểu và nghiên cứu để tìm một chiến lược cho riêng mình kết quả đạt được sẽ tốt hơn nhiều, có thể bạn không cần tin lời tôi nói, thời gian sẽ có câu trả lời chính xác cho bạn.', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[PostCategory] ON 

INSERT [dbo].[PostCategory] ([ID], [Title], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [ModifiledDate], [MetaKeywords], [MeteDescriptions], [Status], [ShowOnHome]) VALUES (1, N'aa', N'aa', NULL, 1, NULL, CAST(N'2020-06-27 16:16:23.120' AS DateTime), NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[PostCategory] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELTE_USER', N'Xóa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách user')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [UserName], [Phone], [Email], [Password], [GroupID], [ProvinceID], [DistrictID], [CreatedDate], [ModifiledDate], [Intro], [Profiles], [Status]) VALUES (1, N'nguyen', N'dep trai', N'admin', N'12312413123', N'123123@asdasd.com', N'202cb962ac59075b964b07152d234b70', N'Admin', NULL, NULL, CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [UserName], [Phone], [Email], [Password], [GroupID], [ProvinceID], [DistrictID], [CreatedDate], [ModifiledDate], [Intro], [Profiles], [Status]) VALUES (2, N'asd', N'sad', N'asd', N'21312313213', N'asdasd', N'asdasdasdas', N'Member', NULL, NULL, CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [UserName], [Phone], [Email], [Password], [GroupID], [ProvinceID], [DistrictID], [CreatedDate], [ModifiledDate], [Intro], [Profiles], [Status]) VALUES (3, N'asd', N'asd', N'asdasd', N'12312314124', N'asdas', N'sada', N'User', NULL, NULL, CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [UserName], [Phone], [Email], [Password], [GroupID], [ProvinceID], [DistrictID], [CreatedDate], [ModifiledDate], [Intro], [Profiles], [Status]) VALUES (6, N'12312213', N'asdsad', N'sdasd', N'1231231', N'123123', N'12313', N'Admin               ', NULL, NULL, CAST(N'2020-12-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [UserName], [Phone], [Email], [Password], [GroupID], [ProvinceID], [DistrictID], [CreatedDate], [ModifiledDate], [Intro], [Profiles], [Status]) VALUES (7, N'thanh', N'nguyen', N'thanh', N'0945785635', N'dad@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, 201, 20117, CAST(N'2020-11-05 14:20:26.473' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UsersGroup] ([ID], [Name]) VALUES (N'Admin                                             ', N'Admin                                             ')
INSERT [dbo].[UsersGroup] ([ID], [Name]) VALUES (N'Member                                            ', N'Member                                            ')
INSERT [dbo].[UsersGroup] ([ID], [Name]) VALUES (N'User                                              ', N'User                                              ')
ALTER TABLE [dbo].[PostComment] ADD  CONSTRAINT [DF__post_comm__paren__21B6055D]  DEFAULT (NULL) FOR [parentId]
GO
ALTER TABLE [dbo].[PostComment] ADD  CONSTRAINT [DF__post_comm__publi__22AA2996]  DEFAULT ((0)) FOR [published]
GO
ALTER TABLE [dbo].[PostComment] ADD  CONSTRAINT [DF__post_comm__publi__239E4DCF]  DEFAULT (NULL) FOR [publishedAt]
GO
ALTER TABLE [dbo].[PostComment] ADD  CONSTRAINT [DF__post_comm__conte__24927208]  DEFAULT (NULL) FOR [content]
GO
ALTER TABLE [dbo].[PostMeta] ADD  CONSTRAINT [DF__post_meta__conte__1ED998B2]  DEFAULT (NULL) FOR [content]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_category_parent] FOREIGN KEY([parentId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_category_parent]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_post_parent] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_post_parent]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_post_users] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_post_users]
GO
ALTER TABLE [dbo].[PostComment]  WITH CHECK ADD  CONSTRAINT [FK_comment_parent] FOREIGN KEY([parentId])
REFERENCES [dbo].[PostComment] ([id])
GO
ALTER TABLE [dbo].[PostComment] CHECK CONSTRAINT [FK_comment_parent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AUTO_INCREMENT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'ID'
GO
USE [master]
GO
ALTER DATABASE [blog] SET  READ_WRITE 
GO
