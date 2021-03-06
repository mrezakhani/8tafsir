USE [master]
GO
/****** Object:  Database [Tafsir]    Script Date: 06/02/98 08:20:15 ******/
CREATE DATABASE [Tafsir]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tafsir', FILENAME = N'D:\Arshad\972\Tafsir\DB\Tafsir.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'Tafsir_log', FILENAME = N'D:\Arshad\972\Tafsir\DB\Tafsir_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 5120KB )
GO
ALTER DATABASE [Tafsir] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tafsir].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tafsir] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tafsir] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tafsir] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tafsir] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tafsir] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tafsir] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tafsir] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tafsir] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tafsir] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tafsir] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tafsir] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tafsir] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tafsir] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tafsir] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tafsir] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tafsir] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tafsir] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tafsir] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tafsir] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tafsir] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tafsir] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tafsir] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tafsir] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tafsir] SET  MULTI_USER 
GO
ALTER DATABASE [Tafsir] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tafsir] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tafsir] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tafsir] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Tafsir] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Tafsir]
GO
/****** Object:  Table [dbo].[TbBookName]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbBookName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](200) NULL,
	[Writer] [nvarchar](200) NULL,
	[Translator] [nvarchar](200) NULL,
	[Publisher] [nvarchar](200) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_TbBooks_Active]  DEFAULT ((1)),
	[Language] [nvarchar](20) NULL,
	[Pages] [int] NULL CONSTRAINT [DF_TbBooks_Pages]  DEFAULT ((0)),
	[Viewed] [int] NULL CONSTRAINT [DF_TbBooks_Viewed]  DEFAULT ((0)),
	[InsertUserId] [int] NULL CONSTRAINT [DF_TbBooks_InsertUser]  DEFAULT (N'Non'),
	[InsertDate] [varchar](10) NULL CONSTRAINT [DF_TbBooks_InsertDate]  DEFAULT ((0)),
	[Keyword] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TbBooks0] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbBookParagraph]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbBookParagraph](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NULL,
	[TitleNumber] [int] NULL,
	[HeadrNumber] [nchar](10) NULL,
	[Title] [nvarchar](100) NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_TbBookParagraph] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbComments]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NULL,
	[NewsType] [int] NULL,
	[Name] [nvarchar](70) NULL CONSTRAINT [DF_TbComments_UserName]  DEFAULT (N'ناشناس'),
	[Email] [nvarchar](80) NULL,
	[Comment] [nvarchar](max) NULL,
	[DateTime] [char](10) NULL CONSTRAINT [DF_TbComments_Date]  DEFAULT (N'-'),
	[ShowMess] [bit] NULL CONSTRAINT [DF_TbComments_Active]  DEFAULT ((0)),
	[Reply] [nvarchar](max) NULL,
	[UserReply] [int] NULL,
	[DateTimeReply] [char](10) NULL,
 CONSTRAINT [PK_TbComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCourse]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeCourse] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[DateStart] [char](10) NULL,
	[Time] [char](10) NULL,
	[Length] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[TeacherId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_TbCourse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCourseFlie]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCourseFlie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[FileName] [nvarchar](50) NULL,
	[FileType] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_TbCourseFlie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbCourseRegistration]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCourseRegistration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[StudentId] [int] NULL,
	[DateTime] [char](20) NULL,
 CONSTRAINT [PK_TbCourseRegistration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbLinks]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbLinks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TitleLink] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_TbLinks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbMobaleg]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbMobaleg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[ComName] [nvarchar](50) NULL,
	[CodeMeli] [char](10) NULL,
	[Tel] [char](11) NULL,
	[Email] [nvarchar](70) NULL,
	[City] [nvarchar](50) NULL,
	[DateStart] [char](10) NULL,
	[DateEnd] [char](10) NULL,
	[Description] [nvarchar](max) NULL,
	[Send] [bit] NULL CONSTRAINT [DF_TbMobaleg_Send]  DEFAULT ((0)),
	[Checked] [bit] NULL CONSTRAINT [DF_TbMobaleg_Checked]  DEFAULT ((0)),
	[InaertDate] [char](10) NULL,
 CONSTRAINT [PK_TbMobaleg_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbNews]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbNews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL CONSTRAINT [DF_Table_1_Pages]  DEFAULT ((0)),
	[TitleNews] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[TextNews] [nvarchar](max) NULL,
	[Writer] [nvarchar](200) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_TbNews_Active]  DEFAULT ((1)),
	[Viewed] [int] NULL CONSTRAINT [DF_TbNews_Viewed]  DEFAULT ((0)),
	[InsertUser] [int] NULL CONSTRAINT [DF_TbNews_InsertUser]  DEFAULT (N'Non'),
	[InsertDate] [char](10) NULL CONSTRAINT [DF_TbNews_InsertDate]  DEFAULT ((0)),
	[Keyword] [nvarchar](max) NULL,
	[Image] [nvarchar](200) NULL,
 CONSTRAINT [PK_TbNews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbNewsType]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbNewsType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TbNewsType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbStudent]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Image] [nvarchar](100) NULL,
	[Active] [bit] NULL,
	[BirthDate] [char](10) NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
 CONSTRAINT [PK_TbStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbTeacher]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Image] [nvarchar](100) NULL,
	[Active] [nchar](10) NULL,
	[Grade] [nvarchar](50) NULL,
	[Rezome] [nvarchar](max) NULL,
	[BirthDate] [char](10) NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
 CONSTRAINT [PK_TbTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbUser]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Image] [nvarchar](100) NULL,
	[RulId] [int] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_TbUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TbBookName]  WITH NOCHECK ADD  CONSTRAINT [FK_TbBookName_TbUser] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[TbUser] ([ID])
GO
ALTER TABLE [dbo].[TbBookName] CHECK CONSTRAINT [FK_TbBookName_TbUser]
GO
ALTER TABLE [dbo].[TbBookParagraph]  WITH CHECK ADD  CONSTRAINT [FK_TbBookParagraph_TbBookName] FOREIGN KEY([BookId])
REFERENCES [dbo].[TbBookName] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TbBookParagraph] CHECK CONSTRAINT [FK_TbBookParagraph_TbBookName]
GO
ALTER TABLE [dbo].[TbCourse]  WITH CHECK ADD  CONSTRAINT [FK_TbCourse_TbTeacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[TbTeacher] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TbCourse] CHECK CONSTRAINT [FK_TbCourse_TbTeacher]
GO
ALTER TABLE [dbo].[TbCourseFlie]  WITH CHECK ADD  CONSTRAINT [FK_TbCourseFlie_TbCourseRegistration] FOREIGN KEY([CourseId])
REFERENCES [dbo].[TbCourseRegistration] ([ID])
GO
ALTER TABLE [dbo].[TbCourseFlie] CHECK CONSTRAINT [FK_TbCourseFlie_TbCourseRegistration]
GO
ALTER TABLE [dbo].[TbCourseRegistration]  WITH CHECK ADD  CONSTRAINT [FK_TbCourseRegistration_TbCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[TbCourse] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TbCourseRegistration] CHECK CONSTRAINT [FK_TbCourseRegistration_TbCourse]
GO
ALTER TABLE [dbo].[TbCourseRegistration]  WITH CHECK ADD  CONSTRAINT [FK_TbCourseRegistration_TbStudent] FOREIGN KEY([StudentId])
REFERENCES [dbo].[TbStudent] ([Id])
GO
ALTER TABLE [dbo].[TbCourseRegistration] CHECK CONSTRAINT [FK_TbCourseRegistration_TbStudent]
GO
ALTER TABLE [dbo].[TbNews]  WITH NOCHECK ADD  CONSTRAINT [FK_TbNews_TbNewsType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TbNewsType] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TbNews] CHECK CONSTRAINT [FK_TbNews_TbNewsType]
GO
ALTER TABLE [dbo].[TbNews]  WITH NOCHECK ADD  CONSTRAINT [FK_TbNews_TbUser] FOREIGN KEY([InsertUser])
REFERENCES [dbo].[TbUser] ([ID])
GO
ALTER TABLE [dbo].[TbNews] CHECK CONSTRAINT [FK_TbNews_TbUser]
GO
/****** Object:  StoredProcedure [dbo].[SPBookNameDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookNameDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbBookName] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookNameGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookNameGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [BookName], [Writer], [Translator], [Publisher], [Active], [Language], [Pages], [Viewed], [InsertUserId], [InsertDate], [Keyword], [Description]
	FROM [Tafsir].[dbo].[TbBookName] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookNameLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookNameLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [BookName], [Writer], [Translator], [Publisher], [Active], [Language], [Pages], [Viewed], [InsertUserId], [InsertDate], [Keyword], [Description]
	FROM [Tafsir].[dbo].[TbBookName] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookNameNew]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SPBookNameNew]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT top 10 [ID], [BookName], [Writer], [Translator], [Publisher], [Active], [Language], [Pages], [Viewed], [InsertUserId], [InsertDate], [Keyword], [Description]
	FROM [Tafsir].[dbo].[TbBookName] 
	ORDER BY [ID] Desc

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookNameSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookNameSearch]
@ID		int
,@BookName		[nvarchar] (200)
,@Writer		[nvarchar] (200)
,@Translator		[nvarchar] (200)
,@Publisher		[nvarchar] (200)
,@Active		bit
,@Language		[nvarchar] (20)
,@Pages		int
,@Viewed		int
,@InsertUserId		int
,@InsertDate		[varchar] (10)
,@Keyword		[nvarchar] (max)
,@Description		[nvarchar] (max)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [BookName], [Writer], [Translator], [Publisher], [Active], [Language], [Pages], [Viewed], [InsertUserId], [InsertDate], [Keyword], [Description]
		FROM [Tafsir].[dbo].[TbBookName] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [BookName], [Writer], [Translator], [Publisher], [Active], [Language], [Pages], [Viewed], [InsertUserId], [InsertDate], [Keyword], [Description]
		FROM [Tafsir].[dbo].[TbBookName] 
		WHERE [BookName] 		Like @BookName
		AND   [Writer] 	Like @Writer
		AND   [Translator] 	Like @Translator
		AND   [Publisher] 	Like @Publisher
		AND   [Active] 	Like @Active
		AND   [Language] 	Like @Language
		AND   [Pages] 	Like @Pages
		AND   [Viewed] 	Like @Viewed
		AND   [InsertUserId] 	Like @InsertUserId
		AND   [InsertDate] 	Like @InsertDate
		AND   [Keyword] 	Like @Keyword
		AND   [Description] 	Like @Description
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookNameSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookNameSet]
@ID		int
,@BookName		[nvarchar] (200)
,@Writer		[nvarchar] (200)
,@Translator		[nvarchar] (200)
,@Publisher		[nvarchar] (200)
,@Active		bit
,@Language		[nvarchar] (20)
,@Pages		int
,@Viewed		int
,@InsertUserId		int
,@InsertDate		[varchar] (10)
,@Keyword		[nvarchar] (max)
,@Description		[nvarchar] (max)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbBookName] Set [BookName] = @BookName
			, [Writer] = @Writer
			, [Translator] = @Translator
			, [Publisher] = @Publisher
			, [Active] = @Active
			, [Language] = @Language
			, [Pages] = @Pages
			, [Viewed] = @Viewed
			, [InsertUserId] = @InsertUserId
			, [InsertDate] = @InsertDate
			, [Keyword] = @Keyword
			, [Description] = @Description
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbBookName] 
		       ([BookName], [Writer], [Translator], [Publisher], [Active], [Language], [Pages], [Viewed], [InsertUserId], [InsertDate], [Keyword], [Description])
		VALUES ( @BookName, @Writer , @Translator , @Publisher , @Active , @Language , @Pages , @Viewed , @InsertUserId , @InsertDate , @Keyword , @Description );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookNameVisit]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SPBookNameVisit]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT top 10 [ID], [BookName], [Writer], [Translator], [Publisher], [Active], [Language], [Pages], [Viewed], [InsertUserId], [InsertDate], [Keyword], [Description]
	FROM [Tafsir].[dbo].[TbBookName] 
	ORDER BY [Viewed] Desc

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookParagraphDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookParagraphDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbBookParagraph] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookParagraphGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookParagraphGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [BookId], [TitleNumber], [HeadrNumber], [Title], [Text]
	FROM [Tafsir].[dbo].[TbBookParagraph] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookParagraphLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookParagraphLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [BookId], [TitleNumber], [HeadrNumber], [Title], [Text]
	FROM [Tafsir].[dbo].[TbBookParagraph] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookParagraphSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookParagraphSearch]
@ID		int
,@BookId		int
,@TitleNumber		int
,@HeadrNumber		[nchar] (10)
,@Title		[nvarchar] (100)
,@Text		[nvarchar] (max)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [BookId], [TitleNumber], [HeadrNumber], [Title], [Text]
		FROM [Tafsir].[dbo].[TbBookParagraph] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [BookId], [TitleNumber], [HeadrNumber], [Title], [Text]
		FROM [Tafsir].[dbo].[TbBookParagraph] 
		WHERE [BookId] 		Like @BookId
		AND   [TitleNumber] 	Like @TitleNumber
		AND   [HeadrNumber] 	Like @HeadrNumber
		AND   [Title] 	Like @Title
		AND   [Text] 	Like @Text
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPBookParagraphSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPBookParagraphSet]
@ID		int
,@BookId		int
,@TitleNumber		int
,@HeadrNumber		[nchar] (10)
,@Title		[nvarchar] (100)
,@Text		[nvarchar] (max)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbBookParagraph] Set [BookId] = @BookId
			, [TitleNumber] = @TitleNumber
			, [HeadrNumber] = @HeadrNumber
			, [Title] = @Title
			, [Text] = @Text
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbBookParagraph] 
		       ([BookId], [TitleNumber], [HeadrNumber], [Title], [Text])
		VALUES ( @BookId, @TitleNumber , @HeadrNumber , @Title , @Text );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCommentsDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCommentsDel]
@Id int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbComments] WHERE [Id] = @Id

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCommentsGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCommentsGet]
@Id int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [NewsId], [NewsType], [Name], [Email], [Comment], [DateTime], [ShowMess], [Reply], [UserReply], [DateTimeReply]
	FROM [Tafsir].[dbo].[TbComments] 
	WHERE [Id] = @Id
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCommentsLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCommentsLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [NewsId], [NewsType], [Name], [Email], [Comment], [DateTime], [ShowMess], [Reply], [UserReply], [DateTimeReply]
	FROM [Tafsir].[dbo].[TbComments] 
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCommentsSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCommentsSearch]
@Id		int
,@NewsId		int
,@NewsType		int
,@Name		[nvarchar] (70)
,@Email		[nvarchar] (80)
,@Comment		[nvarchar] (max)
,@DateTime		[char] (10)
,@ShowMess		bit
,@Reply		[nvarchar] (max)
,@UserReply		int
,@DateTimeReply		[char] (10)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [Id], [NewsId], [NewsType], [Name], [Email], [Comment], [DateTime], [ShowMess], [Reply], [UserReply], [DateTimeReply]
		FROM [Tafsir].[dbo].[TbComments] 
		WHERE [Id] = @Id
	END

	ELSE
	BEGIN
		SELECT [Id], [NewsId], [NewsType], [Name], [Email], [Comment], [DateTime], [ShowMess], [Reply], [UserReply], [DateTimeReply]
		FROM [Tafsir].[dbo].[TbComments] 
		WHERE [NewsId] 		Like @NewsId
		AND   [NewsType] 	Like @NewsType
		AND   [Name] 	Like @Name
		AND   [Email] 	Like @Email
		AND   [Comment] 	Like @Comment
		AND   [DateTime] 	Like @DateTime
		AND   [ShowMess] 	Like @ShowMess
		AND   [Reply] 	Like @Reply
		AND   [UserReply] 	Like @UserReply
		AND   [DateTimeReply] 	Like @DateTimeReply
		ORDER BY [Id]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCommentsSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCommentsSet]
@Id		int
,@NewsId		int
,@NewsType		int
,@Name		[nvarchar] (70)
,@Email		[nvarchar] (80)
,@Comment		[nvarchar] (max)
,@DateTime		[char] (10)
,@ShowMess		bit
,@Reply		[nvarchar] (max)
,@UserReply		int
,@DateTimeReply		[char] (10)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		UPDATE [TbComments] Set [NewsId] = @NewsId
			, [NewsType] = @NewsType
			, [Name] = @Name
			, [Email] = @Email
			, [Comment] = @Comment
			, [DateTime] = @DateTime
			, [ShowMess] = @ShowMess
			, [Reply] = @Reply
			, [UserReply] = @UserReply
			, [DateTimeReply] = @DateTimeReply
		WHERE [Id] = @Id

		SELECT @Id
	END

	Else
	BEGIN

		INSERT INTO [TbComments] 
		       ([NewsId], [NewsType], [Name], [Email], [Comment], [DateTime], [ShowMess], [Reply], [UserReply], [DateTimeReply])
		VALUES ( @NewsId, @NewsType , @Name , @Email , @Comment , @DateTime , @ShowMess , @Reply , @UserReply , @DateTimeReply );


		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbCourse] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseFlieDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseFlieDel]
@Id int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbCourseFlie] WHERE [Id] = @Id

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseFlieGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseFlieGet]
@Id int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [CourseId], [FileName], [FileType], [Address], [Active]
	FROM [Tafsir].[dbo].[TbCourseFlie] 
	WHERE [Id] = @Id
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseFlieLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseFlieLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [CourseId], [FileName], [FileType], [Address], [Active]
	FROM [Tafsir].[dbo].[TbCourseFlie] 
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseFlieSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseFlieSearch]
@Id		int
,@CourseId		int
,@FileName		[nvarchar] (50)
,@FileType		[nvarchar] (50)
,@Address		[nvarchar] (250)
,@Active		bit
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [Id], [CourseId], [FileName], [FileType], [Address], [Active]
		FROM [Tafsir].[dbo].[TbCourseFlie] 
		WHERE [Id] = @Id
	END

	ELSE
	BEGIN
		SELECT [Id], [CourseId], [FileName], [FileType], [Address], [Active]
		FROM [Tafsir].[dbo].[TbCourseFlie] 
		WHERE [CourseId] 		Like @CourseId
		AND   [FileName] 	Like @FileName
		AND   [FileType] 	Like @FileType
		AND   [Address] 	Like @Address
		AND   [Active] 	Like @Active
		ORDER BY [Id]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseFlieSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseFlieSet]
@Id		int
,@CourseId		int
,@FileName		[nvarchar] (50)
,@FileType		[nvarchar] (50)
,@Address		[nvarchar] (250)
,@Active		bit
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		UPDATE [TbCourseFlie] Set [CourseId] = @CourseId
			, [FileName] = @FileName
			, [FileType] = @FileType
			, [Address] = @Address
			, [Active] = @Active
		WHERE [Id] = @Id

		SELECT @Id
	END

	Else
	BEGIN

		INSERT INTO [TbCourseFlie] 
		       ([CourseId], [FileName], [FileType], [Address], [Active])
		VALUES ( @CourseId, @FileName , @FileType , @Address , @Active );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TypeCourse], [Title], [DateStart], [Time], [Length], [Address], [TeacherId], [Description], [Active]
	FROM [Tafsir].[dbo].[TbCourse] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TypeCourse], [Title], [DateStart], [Time], [Length], [Address], [TeacherId], [Description], [Active]
	FROM [Tafsir].[dbo].[TbCourse] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseRegistrationDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseRegistrationDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbCourseRegistration] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseRegistrationGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseRegistrationGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [CourseId], [StudentId], [DateTime]
	FROM [Tafsir].[dbo].[TbCourseRegistration] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseRegistrationLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseRegistrationLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [CourseId], [StudentId], [DateTime]
	FROM [Tafsir].[dbo].[TbCourseRegistration] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseRegistrationSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseRegistrationSearch]
@ID		int
,@CourseId		int
,@StudentId		int
,@DateTime		[char] (20)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [CourseId], [StudentId], [DateTime]
		FROM [Tafsir].[dbo].[TbCourseRegistration] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [CourseId], [StudentId], [DateTime]
		FROM [Tafsir].[dbo].[TbCourseRegistration] 
		WHERE [CourseId] 		Like @CourseId
		AND   [StudentId] 	Like @StudentId
		AND   [DateTime] 	Like @DateTime
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseRegistrationSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseRegistrationSet]
@ID		int
,@CourseId		int
,@StudentId		int
,@DateTime		[char] (20)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbCourseRegistration] Set [CourseId] = @CourseId
			, [StudentId] = @StudentId
			, [DateTime] = @DateTime
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbCourseRegistration] 
		       ([CourseId], [StudentId], [DateTime])
		VALUES ( @CourseId, @StudentId , @DateTime );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseSearch]
@ID		int
,@TypeCourse		int
,@Title		[nvarchar] (50)
,@DateStart		[char] (10)
,@Time		[char] (10)
,@Length		[nvarchar] (50)
,@Address		[nvarchar] (200)
,@TeacherId		int
,@Description		[nvarchar] (max)
,@Active		bit
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [TypeCourse], [Title], [DateStart], [Time], [Length], [Address], [TeacherId], [Description], [Active]
		FROM [Tafsir].[dbo].[TbCourse] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [TypeCourse], [Title], [DateStart], [Time], [Length], [Address], [TeacherId], [Description], [Active]
		FROM [Tafsir].[dbo].[TbCourse] 
		WHERE [TypeCourse] 		Like @TypeCourse
		AND   [Title] 	Like @Title
		AND   [DateStart] 	Like @DateStart
		AND   [Time] 	Like @Time
		AND   [Length] 	Like @Length
		AND   [Address] 	Like @Address
		AND   [TeacherId] 	Like @TeacherId
		AND   [Description] 	Like @Description
		AND   [Active] 	Like @Active
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPCourseSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCourseSet]
@ID		int
,@TypeCourse		int
,@Title		[nvarchar] (50)
,@DateStart		[char] (10)
,@Time		[char] (10)
,@Length		[nvarchar] (50)
,@Address		[nvarchar] (200)
,@TeacherId		int
,@Description		[nvarchar] (max)
,@Active		bit
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbCourse] Set [TypeCourse] = @TypeCourse
			, [Title] = @Title
			, [DateStart] = @DateStart
			, [Time] = @Time
			, [Length] = @Length
			, [Address] = @Address
			, [TeacherId] = @TeacherId
			, [Description] = @Description
			, [Active] = @Active
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbCourse] 
		       ([TypeCourse], [Title], [DateStart], [Time], [Length], [Address], [TeacherId], [Description], [Active])
		VALUES ( @TypeCourse, @Title , @DateStart , @Time , @Length , @Address , @TeacherId , @Description , @Active );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPLinksDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPLinksDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbLinks] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPLinksGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPLinksGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TitleLink], [Address], [Image], [Description], [Active]
	FROM [Tafsir].[dbo].[TbLinks] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPLinksLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPLinksLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TitleLink], [Address], [Image], [Description], [Active]
	FROM [Tafsir].[dbo].[TbLinks] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPLinksSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPLinksSearch]
@ID		int
,@TitleLink		[nvarchar] (250)
,@Address		[nvarchar] (250)
,@Image		[nvarchar] (250)
,@Description		[nvarchar] (250)
,@Active		bit
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [TitleLink], [Address], [Image], [Description], [Active]
		FROM [Tafsir].[dbo].[TbLinks] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [TitleLink], [Address], [Image], [Description], [Active]
		FROM [Tafsir].[dbo].[TbLinks] 
		WHERE [TitleLink] 		Like @TitleLink
		AND   [Address] 	Like @Address
		AND   [Image] 	Like @Image
		AND   [Description] 	Like @Description
		AND   [Active] 	Like @Active
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPLinksSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPLinksSet]
@ID		int
,@TitleLink		[nvarchar] (250)
,@Address		[nvarchar] (250)
,@Image		[nvarchar] (250)
,@Description		[nvarchar] (250)
,@Active		bit
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbLinks] Set [TitleLink] = @TitleLink
			, [Address] = @Address
			, [Image] = @Image
			, [Description] = @Description
			, [Active] = @Active
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbLinks] 
		       ([TitleLink], [Address], [Image], [Description], [Active])
		VALUES ( @TitleLink, @Address , @Image , @Description , @Active );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPMobalegDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPMobalegDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbMobaleg] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPMobalegGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPMobalegGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [FirstName], [LastName], [ComName], [CodeMeli], [Tel], [Email], [City], [DateStart], [DateEnd], [Description], [Send], [Checked], [InaertDate]
	FROM [Tafsir].[dbo].[TbMobaleg] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPMobalegLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPMobalegLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [FirstName], [LastName], [ComName], [CodeMeli], [Tel], [Email], [City], [DateStart], [DateEnd], [Description], [Send], [Checked], [InaertDate]
	FROM [Tafsir].[dbo].[TbMobaleg] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPMobalegSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPMobalegSearch]
@ID		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@ComName		[nvarchar] (50)
,@CodeMeli		[char] (10)
,@Tel		[char] (11)
,@Email		[nvarchar] (70)
,@City		[nvarchar] (50)
,@DateStart		[char] (10)
,@DateEnd		[char] (10)
,@Description		[nvarchar] (max)
,@Send		bit
,@Checked		bit
,@InaertDate		[char] (10)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [FirstName], [LastName], [ComName], [CodeMeli], [Tel], [Email], [City], [DateStart], [DateEnd], [Description], [Send], [Checked], [InaertDate]
		FROM [Tafsir].[dbo].[TbMobaleg] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [FirstName], [LastName], [ComName], [CodeMeli], [Tel], [Email], [City], [DateStart], [DateEnd], [Description], [Send], [Checked], [InaertDate]
		FROM [Tafsir].[dbo].[TbMobaleg] 
		WHERE [FirstName] 		Like @FirstName
		AND   [LastName] 	Like @LastName
		AND   [ComName] 	Like @ComName
		AND   [CodeMeli] 	Like @CodeMeli
		AND   [Tel] 	Like @Tel
		AND   [Email] 	Like @Email
		AND   [City] 	Like @City
		AND   [DateStart] 	Like @DateStart
		AND   [DateEnd] 	Like @DateEnd
		AND   [Description] 	Like @Description
		AND   [Send] 	Like @Send
		AND   [Checked] 	Like @Checked
		AND   [InaertDate] 	Like @InaertDate
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPMobalegSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPMobalegSet]
@ID		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@ComName		[nvarchar] (50)
,@CodeMeli		[char] (10)
,@Tel		[char] (11)
,@Email		[nvarchar] (70)
,@City		[nvarchar] (50)
,@DateStart		[char] (10)
,@DateEnd		[char] (10)
,@Description		[nvarchar] (max)
,@Send		bit
,@Checked		bit
,@InaertDate		[char] (10)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbMobaleg] Set [FirstName] = @FirstName
			, [LastName] = @LastName
			, [ComName] = @ComName
			, [CodeMeli] = @CodeMeli
			, [Tel] = @Tel
			, [Email] = @Email
			, [City] = @City
			, [DateStart] = @DateStart
			, [DateEnd] = @DateEnd
			, [Description] = @Description
			, [Send] = @Send
			, [Checked] = @Checked
			, [InaertDate] = @InaertDate
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbMobaleg] 
		       ([FirstName], [LastName], [ComName], [CodeMeli], [Tel], [Email], [City], [DateStart], [DateEnd], [Description], [Send], [Checked], [InaertDate])
		VALUES ( @FirstName, @LastName , @ComName , @CodeMeli , @Tel , @Email , @City , @DateStart , @DateEnd , @Description , @Send , @Checked , @InaertDate );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbNews] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TypeId], [TitleNews], [Description], [TextNews], [Writer], [Active], [Viewed], [InsertUser], [InsertDate], [Keyword], [Image]
	FROM [Tafsir].[dbo].[TbNews] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TypeId], [TitleNews], [Description], [TextNews], [Writer], [Active], [Viewed], [InsertUser], [InsertDate], [Keyword], [Image]
	FROM [Tafsir].[dbo].[TbNews] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsLoadType]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPNewsLoadType]
@typeId int = 1
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TypeId], [TitleNews], [Description], [TextNews], [Writer], [Active], [Viewed], [InsertUser], [InsertDate], [Keyword], [Image]
	FROM [Tafsir].[dbo].[TbNews]
	Where [TypeId] = @typeId
	ORDER BY [ID] Desc

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END



GO
/****** Object:  StoredProcedure [dbo].[SPNewsLoadTypeTop]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPNewsLoadTypeTop]
@typeId int = 1
,@count int = 3
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT top 3 [ID], [TypeId], [TitleNews], [Description], [TextNews], [Writer], [Active], [Viewed], [InsertUser], [InsertDate], [Keyword], [Image]
	FROM [Tafsir].[dbo].[TbNews]
	Where [TypeId] = @typeId
	ORDER BY [ID] Desc

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END


GO
/****** Object:  StoredProcedure [dbo].[SPNewsSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsSearch]
@ID		int
,@TypeId		int
,@TitleNews		[nvarchar] (200)
,@Description		[nvarchar] (400)
,@TextNews		[nvarchar] (max)
,@Writer		[nvarchar] (200)
,@Active		bit
,@Viewed		int
,@InsertUser		int
,@InsertDate		[char] (10)
,@Keyword		[nvarchar] (max)
,@Image		[nvarchar] (200)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [TypeId], [TitleNews], [Description], [TextNews], [Writer], [Active], [Viewed], [InsertUser], [InsertDate], [Keyword], [Image]
		FROM [Tafsir].[dbo].[TbNews] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [TypeId], [TitleNews], [Description], [TextNews], [Writer], [Active], [Viewed], [InsertUser], [InsertDate], [Keyword], [Image]
		FROM [Tafsir].[dbo].[TbNews] 
		WHERE [TypeId] 		Like @TypeId
		AND   [TitleNews] 	Like @TitleNews
		AND   [Description] 	Like @Description
		AND   [TextNews] 	Like @TextNews
		AND   [Writer] 	Like @Writer
		AND   [Active] 	Like @Active
		AND   [Viewed] 	Like @Viewed
		AND   [InsertUser] 	Like @InsertUser
		AND   [InsertDate] 	Like @InsertDate
		AND   [Keyword] 	Like @Keyword
		AND   [Image] 	Like @Image
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsSet]
@ID		int
,@TypeId		int
,@TitleNews		[nvarchar] (200)
,@Description		[nvarchar] (400)
,@TextNews		[nvarchar] (max)
,@Writer		[nvarchar] (200)
,@Active		bit
,@Viewed		int
,@InsertUser		int
,@InsertDate		[char] (10)
,@Keyword		[nvarchar] (max)
,@Image		[nvarchar] (200)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbNews] Set [TypeId] = @TypeId
			, [TitleNews] = @TitleNews
			, [Description] = @Description
			, [TextNews] = @TextNews
			, [Writer] = @Writer
			, [Active] = @Active
			, [Viewed] = @Viewed
			, [InsertUser] = @InsertUser
			, [InsertDate] = @InsertDate
			, [Keyword] = @Keyword
			, [Image] = @Image
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbNews] 
		       ([TypeId], [TitleNews], [Description], [TextNews], [Writer], [Active], [Viewed], [InsertUser], [InsertDate], [Keyword], [Image])
		VALUES ( @TypeId, @TitleNews , @Description , @TextNews , @Writer , @Active , @Viewed , @InsertUser , @InsertDate , @Keyword , @Image );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsTypeDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsTypeDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbNewsType] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsTypeGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsTypeGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TypeName]
	FROM [Tafsir].[dbo].[TbNewsType] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsTypeLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsTypeLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [TypeName]
	FROM [Tafsir].[dbo].[TbNewsType] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsTypeSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsTypeSearch]
@ID		int
,@TypeName		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [TypeName]
		FROM [Tafsir].[dbo].[TbNewsType] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [TypeName]
		FROM [Tafsir].[dbo].[TbNewsType] 
		WHERE [TypeName] 		Like @TypeName
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPNewsTypeSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPNewsTypeSet]
@ID		int
,@TypeName		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbNewsType] Set [TypeName] = @TypeName
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbNewsType] 
		       ([TypeName])
		VALUES ( @TypeName);

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPStudentDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPStudentDel]
@Id int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbStudent] WHERE [Id] = @Id

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPStudentGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPStudentGet]
@Id int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [BirthDate], [Address], [Email], [Tel]
	FROM [Tafsir].[dbo].[TbStudent] 
	WHERE [Id] = @Id
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPStudentLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPStudentLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [BirthDate], [Address], [Email], [Tel]
	FROM [Tafsir].[dbo].[TbStudent] 
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPStudentSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPStudentSearch]
@Id		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@UserName		[nvarchar] (50)
,@Password		[nvarchar] (50)
,@Image		[nvarchar] (100)
,@Active		bit
,@BirthDate		[char] (10)
,@Address		[nvarchar] (500)
,@Email		[varchar] (50)
,@Tel		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [BirthDate], [Address], [Email], [Tel]
		FROM [Tafsir].[dbo].[TbStudent] 
		WHERE [Id] = @Id
	END

	ELSE
	BEGIN
		SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [BirthDate], [Address], [Email], [Tel]
		FROM [Tafsir].[dbo].[TbStudent] 
		WHERE [FirstName] 		Like @FirstName
		AND   [LastName] 	Like @LastName
		AND   [UserName] 	Like @UserName
		AND   [Password] 	Like @Password
		AND   [Image] 	Like @Image
		AND   [Active] 	Like @Active
		AND   [BirthDate] 	Like @BirthDate
		AND   [Address] 	Like @Address
		AND   [Email] 	Like @Email
		AND   [Tel] 	Like @Tel
		ORDER BY [Id]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPStudentSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPStudentSet]
@Id		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@UserName		[nvarchar] (50)
,@Password		[nvarchar] (50)
,@Image			[nvarchar] (100)
,@Active		bit
,@BirthDate		[char] (10)
,@Address		[nvarchar] (500)
,@Email		[varchar] (50)
,@Tel		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		UPDATE [TbStudent] Set [FirstName] = @FirstName
			, [LastName] = @LastName
			, [UserName] = @UserName
			, [Password] = @Password
			, [Image] = @Image
			, [Active] = @Active
			, [BirthDate] = @BirthDate
			, [Address] = @Address
			, [Email] = @Email
			, [Tel] = @Tel
		WHERE [Id] = @Id

		SELECT @Id
	END

	Else
	BEGIN

		INSERT INTO [TbStudent] 
		       ([FirstName], [LastName], [UserName], [Password], [Image], [Active], [BirthDate], [Address], [Email], [Tel])
		VALUES ( @FirstName, @LastName , @UserName , @Password , @Image , @Active , @BirthDate , @Address , @Email , @Tel );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPTeacherDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTeacherDel]
@Id int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbTeacher] WHERE [Id] = @Id

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPTeacherGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTeacherGet]
@Id int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [Grade], [Rezome], [BirthDate], [Address], [Email], [Tel]
	FROM [Tafsir].[dbo].[TbTeacher] 
	WHERE [Id] = @Id
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPTeacherLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTeacherLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [Grade], [Rezome], [BirthDate], [Address], [Email], [Tel]
	FROM [Tafsir].[dbo].[TbTeacher] 
	ORDER BY [Id]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPTeacherSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTeacherSearch]
@Id		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@UserName		[nvarchar] (50)
,@Password		[nvarchar] (50)
,@Image		[nvarchar] (100)
,@Active		[nchar] (10)
,@Grade		[nvarchar] (50)
,@Rezome		[nvarchar] (max)
,@BirthDate		[char] (10)
,@Address		[nvarchar] (500)
,@Email		[varchar] (50)
,@Tel		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [Grade], [Rezome], [BirthDate], [Address], [Email], [Tel]
		FROM [Tafsir].[dbo].[TbTeacher] 
		WHERE [Id] = @Id
	END

	ELSE
	BEGIN
		SELECT [Id], [FirstName], [LastName], [UserName], [Password], [Image], [Active], [Grade], [Rezome], [BirthDate], [Address], [Email], [Tel]
		FROM [Tafsir].[dbo].[TbTeacher] 
		WHERE [FirstName] 		Like @FirstName
		AND   [LastName] 	Like @LastName
		AND   [UserName] 	Like @UserName
		AND   [Password] 	Like @Password
		AND   [Image] 	Like @Image
		AND   [Active] 	Like @Active
		AND   [Grade] 	Like @Grade
		AND   [Rezome] 	Like @Rezome
		AND   [BirthDate] 	Like @BirthDate
		AND   [Address] 	Like @Address
		AND   [Email] 	Like @Email
		AND   [Tel] 	Like @Tel
		ORDER BY [Id]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPTeacherSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTeacherSet]
@Id		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@UserName		[nvarchar] (50)
,@Password		[nvarchar] (50)
,@Image		[nvarchar] (100)
,@Active		[nchar] (10)
,@Grade		[nvarchar] (50)
,@Rezome		[nvarchar] (max)
,@BirthDate		[char] (10)
,@Address		[nvarchar] (500)
,@Email		[varchar] (50)
,@Tel		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@Id>0)
	BEGIN
		UPDATE [TbTeacher] Set [FirstName] = @FirstName
			, [LastName] = @LastName
			, [UserName] = @UserName
			, [Password] = @Password
			, [Image] = @Image
			, [Active] = @Active
			, [Grade] = @Grade
			, [Rezome] = @Rezome
			, [BirthDate] = @BirthDate
			, [Address] = @Address
			, [Email] = @Email
			, [Tel] = @Tel
		WHERE [Id] = @Id

		SELECT @Id
	END

	Else
	BEGIN

		INSERT INTO [TbTeacher] 
		       ([FirstName], [LastName], [UserName], [Password], [Image], [Active], [Grade], [Rezome], [BirthDate], [Address], [Email], [Tel])
		VALUES ( @FirstName, @LastName , @UserName , @Password , @Image , @Active , @Grade , @Rezome , @BirthDate , @Address , @Email , @Tel );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPUserCheck]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPUserCheck]
 @User		[nvarchar] (50)
,@Pass		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row'
 
	SELECT 1--,[ID], [FirstName], [LastName], [UserName], [Password], [Active], [Image], [RulId]
	FROM [Tafsir].[dbo].[TbUser] 
	WHERE [UserName] = @User
	And		[Password] = @Pass

	select 0

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END


GO
/****** Object:  StoredProcedure [dbo].[SPUserCheckEmail]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPUserCheckEmail]
 @email		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row'
 
	SELECT  COUNT([ID])
	FROM [Tafsir].[dbo].[TbUser] 
	WHERE [UserName] = @email
	or		[Email] = @email
	
	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END



GO
/****** Object:  StoredProcedure [dbo].[SPUserDel]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPUserDel]
@ID int
--WITH ENCRYPTION
AS
BEGIN

SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	DELETE [TbUser] WHERE [ID] = @ID

	SELECT @@ROWCOUNT AS Count;

	Commit Tran t1
END Try
BEGIN Catch
	SELECT -1
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPUserForgatPassword]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPUserForgatPassword]
 @email		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row'
 
	SELECT 1--,[ID], [FirstName], [LastName], [UserName], [Password], [Active], [Image], [RulId]
	FROM [Tafsir].[dbo].[TbUser] 
	WHERE [Email]=@email

	select 0

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END


GO
/****** Object:  StoredProcedure [dbo].[SPUserGet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPUserGet]
@ID int
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [FirstName], [LastName], [UserName], [Password], [Active], [Image], [RulId], [Email]
	FROM [Tafsir].[dbo].[TbUser] 
	WHERE [ID] = @ID
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPUserLoad]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPUserLoad]
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
	SELECT [ID], [FirstName], [LastName], [UserName], [Password], [Active], [Image], [RulId], [Email]
	FROM [Tafsir].[dbo].[TbUser] 
	ORDER BY [ID]

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPUserSearch]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPUserSearch]
@ID		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@UserName		[nvarchar] (50)
,@Password		[nvarchar] (50)
,@Active		bit
,@Image		[nvarchar] (100)
,@RulId		int
,@Email		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		--SELECT ROW_NUMBER() OVER(ORDER BY [Id]) AS 'Row' 
		SELECT [ID], [FirstName], [LastName], [UserName], [Password], [Active], [Image], [RulId], [Email]
		FROM [Tafsir].[dbo].[TbUser] 
		WHERE [ID] = @ID
	END

	ELSE
	BEGIN
		SELECT [ID], [FirstName], [LastName], [UserName], [Password], [Active], [Image], [RulId], [Email]
		FROM [Tafsir].[dbo].[TbUser] 
		WHERE [FirstName] 		Like @FirstName
		AND   [LastName] 	Like @LastName
		AND   [UserName] 	Like @UserName
		AND   [Password] 	Like @Password
		AND   [Active] 	Like @Active
		AND   [Image] 	Like @Image
		AND   [RulId] 	Like @RulId
		AND   [Email] 	Like @Email
		ORDER BY [ID]
	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
/****** Object:  StoredProcedure [dbo].[SPUserSet]    Script Date: 06/02/98 08:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPUserSet]
@ID		int
,@FirstName		[nvarchar] (50)
,@LastName		[nvarchar] (50)
,@UserName		[nvarchar] (50)
,@Password		[nvarchar] (50)
,@Active		bit
,@Image		[nvarchar] (100)
,@RulId		int
,@Email		[nvarchar] (50)
--WITH ENCRYPTION
AS
BEGIN

--SET NOCOUNT ON;
BEGIN Try
BEGIN Tran t1

	IF(@ID>0)
	BEGIN
		UPDATE [TbUser] Set [FirstName] = @FirstName
			, [LastName] = @LastName
			, [UserName] = @UserName
			, [Password] = @Password
			, [Active] = @Active
			, [Image] = @Image
			, [RulId] = @RulId
			, [Email] = @Email
		WHERE [ID] = @ID

		SELECT @ID
	END

	Else
	BEGIN

		INSERT INTO [TbUser] 
		       ([FirstName], [LastName], [UserName], [Password], [Active], [Image], [RulId], [Email])
		VALUES ( @FirstName, @LastName , @UserName , @Password , @Active , @Image , @RulId , @Email );

		Select SCOPE_IDENTITY();

	END

	Commit Tran t1
END Try
BEGIN Catch
	SELECT ERROR_MESSAGE()
	Rollback
END Catch

END

GO
USE [master]
GO
ALTER DATABASE [Tafsir] SET  READ_WRITE 
GO
