USE [master]
GO
/****** Object:  Database [TP6]    Script Date: 6/7/2023 15:58:30 ******/
ALTER DATABASE [TP6] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP6] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP6] SET RECOVERY FULL 
GO
ALTER DATABASE [TP6] SET  MULTI_USER 
GO
ALTER DATABASE [TP6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP6] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP6', N'ON'
GO
ALTER DATABASE [TP6] SET QUERY_STORE = OFF
GO
USE [TP6]
GO
/****** Object:  User [alumno]    Script Date: 6/7/2023 15:58:31 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 6/7/2023 15:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[idCandidato] [int] NOT NULL,
	[idPartido] [int] NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[foto] [varchar](50) NOT NULL,
	[postulacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_c] PRIMARY KEY CLUSTERED 
(
	[idCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 6/7/2023 15:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[idPartido] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[logo] [varchar](50) NOT NULL,
	[sitioWeb] [varchar](50) NOT NULL,
	[fechaFundacion] [date] NOT NULL,
	[cantidadDiputados] [int] NOT NULL,
	[cantidadSenadores] [int] NOT NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Candidato] ([idCandidato], [idPartido], [apellido], [nombre], [fechaNacimiento], [foto], [postulacion]) VALUES (1, 1, N'larreta', N'horacio', CAST(N'1965-10-29' AS Date), N'hrl.jpg', N'1')
INSERT [dbo].[Candidato] ([idCandidato], [idPartido], [apellido], [nombre], [fechaNacimiento], [foto], [postulacion]) VALUES (2, 1, N'bullrich', N'patricia', CAST(N'1956-06-11' AS Date), N'bullrich.jpg', N'2')
INSERT [dbo].[Candidato] ([idCandidato], [idPartido], [apellido], [nombre], [fechaNacimiento], [foto], [postulacion]) VALUES (3, 2, N'massa', N'sergio', CAST(N'1972-03-28' AS Date), N'masa.jpg', N'3')
INSERT [dbo].[Candidato] ([idCandidato], [idPartido], [apellido], [nombre], [fechaNacimiento], [foto], [postulacion]) VALUES (4, 3, N'milei', N'javier', CAST(N'1970-10-22' AS Date), N'/img/milei.jpg', N'4')
GO
INSERT [dbo].[Partido] ([idPartido], [nombre], [logo], [sitioWeb], [fechaFundacion], [cantidadDiputados], [cantidadSenadores]) VALUES (1, N'juntos por el cambio', N'jxc.png', N'no', CAST(N'2019-06-12' AS Date), 3, 5)
INSERT [dbo].[Partido] ([idPartido], [nombre], [logo], [sitioWeb], [fechaFundacion], [cantidadDiputados], [cantidadSenadores]) VALUES (2, N'Union por la patria', N'uxp.png', N'te', CAST(N'2023-06-14' AS Date), 4, 4)
INSERT [dbo].[Partido] ([idPartido], [nombre], [logo], [sitioWeb], [fechaFundacion], [cantidadDiputados], [cantidadSenadores]) VALUES (3, N'La libertad Avanza', N'libavan.png', N't', CAST(N'2020-06-05' AS Date), 2, 2)
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidato_Partido] FOREIGN KEY([idPartido])
REFERENCES [dbo].[Partido] ([idPartido])
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidato_Partido]
GO
USE [master]
GO
ALTER DATABASE [TP6] SET  READ_WRITE 
GO
