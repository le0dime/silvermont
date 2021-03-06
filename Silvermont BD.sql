USE [master]
GO
/****** Object:  Database [SilverMont_Series]    Script Date: 21/07/2016 6:23:59 ******/
CREATE DATABASE [SilverMont_Series] ON  PRIMARY 
( NAME = N'SilverMont_Series', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SilverMont_Series.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SilverMont_Series_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SilverMont_Series_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SilverMont_Series].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SilverMont_Series] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SilverMont_Series] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SilverMont_Series] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SilverMont_Series] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SilverMont_Series] SET ARITHABORT OFF 
GO
ALTER DATABASE [SilverMont_Series] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SilverMont_Series] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SilverMont_Series] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SilverMont_Series] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SilverMont_Series] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SilverMont_Series] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SilverMont_Series] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SilverMont_Series] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SilverMont_Series] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SilverMont_Series] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SilverMont_Series] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SilverMont_Series] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SilverMont_Series] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SilverMont_Series] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SilverMont_Series] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SilverMont_Series] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SilverMont_Series] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SilverMont_Series] SET RECOVERY FULL 
GO
ALTER DATABASE [SilverMont_Series] SET  MULTI_USER 
GO
ALTER DATABASE [SilverMont_Series] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SilverMont_Series] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SilverMont_Series', N'ON'
GO
USE [SilverMont_Series]
GO
/****** Object:  User [test]    Script Date: 21/07/2016 6:24:00 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdminSM]    Script Date: 21/07/2016 6:24:00 ******/
CREATE USER [AdminSM] FOR LOGIN [AdminSM] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'test'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'AdminSM'
GO
/****** Object:  Table [dbo].[tblActores]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblActores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[FechaNacimiento] [date] NULL,
	[idPais] [int] NULL,
	[Bio] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCapitulos]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCapitulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSerie] [int] NULL,
	[Temporada] [int] NULL,
	[Numero] [int] NULL,
	[Nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCapitulosDEL]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCapitulosDEL](
	[id] [int] NULL,
	[idSerie] [int] NULL,
	[idTemporada] [int] NULL,
	[Numero] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[UsuarioBaja] [int] NULL,
	[FechaBaja] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblComentarios]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblComentarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[Comentario] [varchar](500) NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblComentariosxNoticia]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComentariosxNoticia](
	[idNoticia] [int] NOT NULL,
	[idComentario] [int] NOT NULL,
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[idNoticia] ASC,
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblComentariosxSerie]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComentariosxSerie](
	[idSerie] [int] NOT NULL,
	[idComentario] [int] NOT NULL,
 CONSTRAINT [PK_ComentariosCapitulo] PRIMARY KEY CLUSTERED 
(
	[idSerie] ASC,
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGeneros]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGeneros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNoticias]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNoticias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[Titulo] [varchar](500) NULL,
	[Copete] [varchar](500) NULL,
	[Contenido] [varchar](5000) NULL,
	[Imagen] [varchar](100) NULL,
	[FechaPublicacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNoticiasDEL]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNoticiasDEL](
	[id] [int] NULL,
	[Titulo] [varchar](500) NULL,
	[Copete] [varchar](500) NULL,
	[Imagen] [varchar](100) NULL,
	[Contenido] [varchar](5000) NULL,
	[UsuarioAlta] [varchar](100) NULL,
	[FechaAlta] [datetime] NULL,
	[UsuarioBaja] [varchar](100) NULL,
	[FechaBaja] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPaises]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPaises](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPersonajes]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPersonajes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[idSerie] [int] NULL,
	[idActor] [int] NULL,
	[Reseña] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRatings]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRatings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRatingxSeriexUsuario]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRatingxSeriexUsuario](
	[idSerie] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idRating] [int] NULL,
 CONSTRAINT [PK_RatingSerieUsuario] PRIMARY KEY CLUSTERED 
(
	[idSerie] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSeries]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSeries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[idGenero] [int] NULL,
	[idPais] [int] NULL,
	[Creador] [varchar](100) NULL,
	[Año] [date] NULL,
	[Reseña] [varchar](1500) NULL,
	[Imagen] [varchar](100) NULL,
	[Miniatura] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSeriesDEL]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSeriesDEL](
	[id] [int] NULL,
	[Nombre] [varchar](500) NULL,
	[idGenero] [int] NULL,
	[idPais] [int] NULL,
	[Creador] [varchar](100) NULL,
	[Año] [date] NULL,
	[Reseña] [varchar](1500) NULL,
	[Imagen] [varchar](100) NULL,
	[Miniatura] [varchar](100) NULL,
	[UsuarioBaja] [varchar](100) NULL,
	[FechaBaja] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTemporadasXSerie]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTemporadasXSerie](
	[idSerie] [int] NOT NULL,
	[Temporada] [int] NOT NULL,
 CONSTRAINT [PK_TemporadaSerie] PRIMARY KEY CLUSTERED 
(
	[idSerie] ASC,
	[Temporada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nickname] [varchar](100) NULL,
	[Contraseña] [varchar](100) NULL,
	[Tipo] [int] NULL,
	[Email] [varchar](100) NULL,
	[NombreApellido] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblCapitulos] ON 

INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1, 2, 1, 1, N'Capitulo 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (2, 2, 1, 2, N'Capítulo 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (3, 2, 1, 3, N'Capítulo 3')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (4, 2, 1, 4, N'Capítulo 4')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (5, 2, 1, 5, N'Capítulo 5')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (6, 2, 1, 6, N'Capítulo 6')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (7, 2, 1, 7, N'Capítulo 7')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (8, 2, 1, 8, N'Capítulo 8')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (9, 2, 1, 9, N'Capítulo 9')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (10, 2, 1, 10, N'Capítulo 10')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (11, 2, 1, 11, N'Capítulo 11')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (12, 2, 1, 12, N'Capítulo 12')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (13, 2, 1, 13, N'Capítulo 13')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (14, 2, 2, 1, N'Capítulo 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (15, 2, 2, 2, N'Capítulo 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (16, 2, 2, 3, N'Capítulo 3')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (17, 2, 2, 4, N'Capítulo 4')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (18, 2, 2, 5, N'Capítulo 5')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (19, 2, 2, 6, N'Capítulo 6')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (20, 2, 2, 7, N'Capítulo 7')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (21, 2, 2, 8, N'Capítulo 8')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (22, 2, 2, 9, N'Capítulo 9')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (23, 2, 2, 10, N'Capítulo 10')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (24, 2, 2, 11, N'Capítulo 11')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (25, 2, 2, 12, N'Capítulo 12')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (26, 2, 2, 13, N'Capítulo 13')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (28, 1, 1, 1, N'Piloto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (29, 1, 1, 2, N'El gato está en la bolsa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (30, 1, 1, 3, N'Y la bolsa en el río')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (31, 1, 1, 4, N'El hombre del cáncer')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (32, 1, 1, 5, N'Materia gris')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (33, 1, 1, 6, N'Loco puñado de nada')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (34, 1, 1, 7, N'Un trato de no violencia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (35, 1, 2, 1, N'7-37')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (36, 1, 2, 2, N'A la parrilla')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (37, 1, 2, 3, N'Picado por una abeja muerta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (38, 1, 2, 4, N'Cae')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (39, 1, 2, 5, N'Fractura')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (40, 1, 2, 6, N'Peekaboo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (41, 1, 2, 7, N'Negro y Azul')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (42, 1, 2, 8, N'Mejor llama a Saul')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (43, 1, 2, 9, N'Cuatro días fuera')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (44, 1, 2, 10, N'Sobre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (45, 1, 2, 11, N'Mandala')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (46, 1, 2, 12, N'Fénix')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (47, 1, 2, 13, N'ABQ')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (48, 3, 1, 1, N'hellofriend.mov')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (49, 3, 1, 2, N'ones-and-zer0es.mpeg')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (50, 3, 1, 3, N'd3bug.mkv')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (51, 3, 1, 4, N'da3m0ns.mp4')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (52, 3, 1, 5, N'3xpl0its.wmv')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (53, 3, 1, 6, N'br4ve-trave1er.asf')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (54, 3, 1, 7, N'v1ew-s0urce.flv')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (55, 3, 1, 8, N'wh1ter0se.m4v')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (56, 3, 1, 9, N'm1rr0r1ng.qt')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (57, 3, 1, 10, N'zer0-day.avi')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (63, 22, 1, 0, N'Pilot - Part 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (65, 4, 1, 1, N'El invierno se acerca')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (66, 1, 3, 1, N' No más')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (67, 1, 3, 2, N'Caballo sin nombre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (68, 1, 3, 3, N'I.F.T.')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (69, 1, 3, 4, N'Luz verde')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (70, 1, 3, 5, N'Más')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (71, 1, 3, 6, N'Puesta de sol')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (72, 1, 3, 7, N'Un minuto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (73, 1, 3, 8, N'Te veo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (74, 1, 3, 9, N'Kafkiano')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (75, 1, 3, 10, N'Mosca')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (76, 1, 3, 11, N'Abiquiu')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (77, 1, 3, 12, N'Medidas a medias')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (78, 1, 3, 13, N'Medidas totales')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (79, 1, 4, 1, N'Cortaplumas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (80, 1, 4, 2, N'Rechazo a los treinta y ocho')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (81, 1, 4, 3, N'Puertas abiertas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (82, 1, 4, 4, N'Puntos a tratar')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (83, 1, 4, 5, N'Escopeta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (84, 1, 4, 6, N'Acorralado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (85, 1, 4, 7, N'Tipo problemático')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (86, 1, 4, 8, N'Hermanos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (87, 1, 4, 9, N'Bicho')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (88, 1, 4, 10, N'Salud')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (89, 1, 4, 11, N'Rebajarse')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (90, 1, 4, 12, N'Últimos tiempos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (91, 1, 4, 13, N'Confrontación')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (92, 1, 5, 1, N'Vivir libre o morir')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (93, 1, 5, 2, N'Madrigal')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (94, 1, 5, 3, N'Paga de riesgo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (95, 1, 5, 4, N'Cincuenta y uno')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (96, 1, 5, 5, N'Carga mortal')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (97, 1, 5, 6, N'Compra')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (98, 1, 5, 7, N'Di mi nombre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (99, 1, 5, 8, N'Deslizándose sobre todo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (100, 1, 5, 9, N'Dinero sangriento')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (101, 1, 5, 10, N'Enterrado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (102, 1, 5, 11, N'Confesiones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (103, 1, 5, 12, N'Perro rabioso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (104, 1, 5, 13, N'To''hajiilee')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (105, 1, 5, 14, N'Ozymandias')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (106, 1, 5, 15, N'Cincuenta y dos')
GO
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (107, 1, 5, 16, N'Felina')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (108, 2, 3, 1, N'Capítulo 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (109, 2, 3, 2, N'Capítulo 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (110, 2, 3, 3, N'Capítulo 3')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (111, 2, 3, 4, N'Capítulo 4')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (112, 2, 3, 5, N'Capítulo 5')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (113, 2, 3, 6, N'Capítulo 6')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (114, 2, 3, 7, N'Capítulo 7')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (115, 2, 3, 8, N'Capítulo 8')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (116, 2, 3, 9, N'Capítulo 9')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (117, 2, 3, 10, N'Capítulo 10')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (118, 2, 3, 11, N'Capítulo 11')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (119, 2, 3, 12, N'Capítulo 12')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (120, 2, 3, 13, N'Capítulo 13')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (121, 2, 4, 1, N'Capítulo 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (122, 2, 4, 2, N'Capítulo 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (123, 2, 4, 3, N'Capítulo 3')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (124, 2, 4, 4, N'Capítulo 4')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (125, 2, 4, 5, N'Capítulo 5')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (126, 2, 4, 6, N'Capítulo 6')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (127, 2, 4, 7, N'Capítulo 7')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (128, 2, 4, 8, N'Capítulo 8')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (129, 2, 4, 9, N'Capítulo 9')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (130, 2, 4, 10, N'Capítulo 10')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (131, 2, 4, 11, N'Capítulo 11')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (132, 2, 4, 12, N'Capítulo 12')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (133, 2, 4, 13, N'Capítulo 13')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (134, 16, 1, 1, N'Ritos de iniciación')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (135, 16, 1, 2, N'La ira de los vikingos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (136, 16, 1, 3, N'Despojados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (137, 16, 1, 4, N'Ataque')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (138, 16, 1, 5, N'Ataque')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (139, 16, 1, 6, N'Sepultura para los Muertos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (140, 16, 1, 7, N'Rescate Real')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (141, 16, 1, 8, N'Sacrificio')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (142, 16, 1, 9, N'Fin del Trayecto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (143, 16, 2, 1, N'Hermanos en guerra')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (144, 16, 2, 2, N'Invasión')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (145, 16, 2, 3, N'Traición')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (146, 16, 2, 4, N'Ojo por ojo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (147, 16, 2, 5, N'Respuestas sangrientas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (148, 16, 2, 6, N'Sin perdón')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (149, 16, 2, 7, N'Águila de sangre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (150, 16, 2, 8, N'Deshuesado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (151, 16, 2, 9, N'La elección')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (152, 16, 2, 10, N'La oración del señor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (153, 16, 3, 1, N'Mercenario')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (154, 16, 3, 2, N'El errante')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (155, 16, 3, 3, N'El sino del guerrero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (156, 16, 3, 4, N'Marcada')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (157, 16, 3, 5, N'El usurpador')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (158, 16, 3, 6, N'Renacido')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (159, 16, 3, 7, N'París')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (160, 16, 3, 8, N'¡A las puertas!')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (161, 16, 3, 9, N'Punto crítico')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (162, 16, 3, 10, N'Los muertos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (163, 16, 4, 1, N'Una buena razón')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (164, 16, 4, 2, N'Matar a la reina')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (165, 16, 4, 3, N'Misericordia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (166, 16, 4, 4, N'Yol')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (167, 4, 1, 2, N'El Camino Real')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (168, 4, 1, 3, N'Lord Nieve')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (169, 4, 1, 4, N'Tullidos, bastardos y cosas rotas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (170, 4, 1, 5, N'El lobo y el león')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (171, 4, 1, 6, N'Una corona de oro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (172, 4, 1, 7, N'Ganas o mueres')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (173, 4, 1, 8, N'Por el lado de la punta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (174, 4, 1, 9, N'Baelor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (175, 4, 1, 10, N'Fuego y sangre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (176, 4, 2, 1, N'El Norte no olvida')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (177, 4, 2, 2, N'Las tierras de la noche')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (178, 4, 2, 3, N'Lo que está muerto no puede morir')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (179, 4, 2, 4, N'Jardín de huesos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (180, 4, 2, 5, N'El fantasma de Harrenhal')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (181, 4, 2, 6, N'Los dioses antiguos y nuevos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (182, 4, 2, 7, N'Un hombre sin honor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (183, 4, 2, 8, N'Un príncipe de Invernalia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (184, 4, 2, 9, N'Aguasnegras')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (185, 4, 2, 10, N'Valar morghulis')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (186, 4, 3, 1, N'Valar Dohaeris')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (187, 4, 3, 2, N'Alas negras, palabras negras')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (188, 4, 3, 3, N'El camino del castigo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (189, 4, 3, 4, N'Y ahora su guardia ha terminado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (190, 4, 3, 5, N'Besada por el fuego')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (191, 4, 3, 6, N'El ascenso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (192, 4, 3, 7, N'El oso y la doncella')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (193, 4, 3, 8, N'Los segundos hijos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (194, 4, 3, 9, N'Las lluvias de Castamere')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (195, 4, 3, 10, N'Mhysa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (196, 4, 4, 1, N'Dos espadas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (197, 4, 4, 2, N'El León y la Rosa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (198, 4, 4, 3, N'Rompedora de cadenas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (199, 4, 4, 4, N'Guardajuramentos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (200, 4, 4, 5, N'El primero de su nombre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (201, 4, 4, 6, N'Las Leyes de los Dioses y de los hombres')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (202, 4, 4, 7, N'Sinsonte')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (203, 4, 4, 8, N'La Montaña y la Serpiente')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (204, 4, 4, 9, N'Los vigilantes del Muro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (205, 4, 4, 10, N'Los niños')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (206, 4, 5, 1, N'Las guerras venideras')
GO
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (207, 4, 5, 2, N'La casa de negro y blanco')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (208, 4, 5, 3, N'Gorrión Supremo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (209, 4, 5, 4, N'Hijos de la arpía')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (210, 4, 5, 5, N'Maten al chico')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (211, 4, 5, 6, N'Nunca doblegado, nunca roto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (212, 4, 5, 7, N'El regalo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (213, 4, 5, 8, N'Casa Austera')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (214, 4, 5, 9, N'Danza de dragones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (215, 4, 5, 10, N'Misericordia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (217, 4, 6, 1, N'La mujer roja')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (218, 4, 6, 2, N'A casa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (219, 4, 6, 3, N'Perjurio')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (220, 4, 6, 4, N'Libro del desconocido')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (221, 4, 6, 5, N'La puerta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (222, 4, 6, 6, N'Sangre de mi sangre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (223, 4, 6, 7, N'El hombre quebrado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (224, 4, 6, 8, N'Nadie')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (225, 4, 6, 9, N'La batalla de los bastardos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (226, 4, 6, 10, N'Los Vientos de invierno')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (227, 17, 1, 1, N'La Serpiente Roja')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (228, 17, 1, 2, N'Sacramentum Gladiatorum')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (229, 17, 1, 3, N'Leyendas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (230, 17, 1, 4, N'La Fosa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (231, 17, 1, 5, N'Juegos con la sombra')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (232, 17, 1, 6, N'Cosas delicadas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (233, 17, 1, 7, N'Cosas grandes & desafortunadas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (234, 17, 1, 8, N'La marca de la hermandad')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (235, 17, 1, 9, N'Ramera')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (236, 17, 1, 10, N'Favores en la celebración')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (237, 17, 1, 11, N'Viejas heridas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (238, 17, 1, 12, N'Revelaciones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (239, 17, 1, 13, N'Mátalos a todos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (240, 17, 2, 1, N'Fugitivos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (241, 17, 2, 2, N'Un lugar en este mundo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (242, 17, 2, 3, N'El gran Dios')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (243, 17, 2, 4, N'Manos vacías')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (244, 17, 2, 5, N'Libertad')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (245, 17, 2, 6, N'Camino escogido')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (246, 17, 2, 7, N'Sacramento')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (247, 17, 2, 8, N'Balance')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (248, 17, 2, 9, N'Monstruos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (249, 17, 2, 10, N'La ira de los Dioses')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (250, 17, 3, 1, N'Enemigos de Roma')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (251, 17, 3, 2, N'Lobos en la puerta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (252, 17, 3, 3, N'Hombre de honor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (253, 17, 3, 4, N'Aniquilación')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (254, 17, 3, 5, N'Hermanos de sangre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (255, 17, 3, 6, N'Botin de la guerra')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (256, 17, 3, 7, N'Muerte súbita')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (257, 17, 3, 8, N'Caminos separados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (259, 19, 1, 1, N'Producto mínimamente viable')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (260, 19, 1, 2, N'La capitalización')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (261, 19, 1, 3, N'Estatutos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (262, 19, 1, 4, N'Obligaciones fiduciarias')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (263, 19, 1, 5, N'Indicador de riesgo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (264, 19, 1, 6, N'Internacionalización de terceros')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (265, 19, 1, 7, N'Prueba de concepto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (266, 19, 1, 8, N'Eficacia óptima punta con punta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (267, 19, 2, 1, N'Ronda por Sand Hill Road')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (268, 19, 2, 2, N'Devaluación desbocada')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (269, 19, 2, 3, N'Dinero malo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (270, 19, 2, 4, N'La señora')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (271, 19, 2, 5, N'Espacio en el servidor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (272, 19, 2, 6, N'Homicide')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (273, 19, 2, 7, N'Contenido para adultos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (274, 19, 2, 8, N'Hacker y cracker')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (275, 19, 2, 9, N'Arbitraje vinculante ')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (276, 19, 2, 10, N'Los dos días del Cóndor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (277, 19, 3, 1, N'Respetuoso con el fundador')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (278, 19, 3, 2, N'Una caja sin sorpresas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (279, 19, 3, 3, N'La compañía secreta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (280, 19, 3, 4, N'Precio de venta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (281, 19, 3, 5, N'La silla vacía')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (282, 19, 3, 6, N'Locurón Bachmanbezón')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (283, 19, 3, 7, N'La versión Beta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (284, 21, 1, 1, N'Piloto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (285, 21, 1, 2, N'46 Largo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (286, 21, 1, 3, N'Negación, enfado y aceptación')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (287, 21, 1, 4, N'Meadowlands')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (288, 21, 1, 5, N'Universidad')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (289, 21, 1, 6, N'Pax Soprana')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (290, 21, 1, 7, N'Regreso a Down Neck')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (291, 21, 1, 8, N'La leyenda de Tennessee Moltisanti')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (292, 21, 1, 9, N'Boca')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (293, 21, 1, 10, N'Un éxito es un éxito')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (294, 21, 1, 11, N'Nadie sabe nada')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (295, 21, 1, 12, N'Isabella')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (296, 21, 1, 13, N'Sueño con Jeannie Cusamano')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (297, 21, 2, 1, N'Un tipo entra en el despacho de una psiquiatra')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (298, 21, 2, 2, N'No reanimar')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (299, 21, 2, 3, N'Hasta lueguito')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (300, 21, 2, 4, N'Commendatori')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (301, 21, 2, 5, N'Las chicas grandes no lloran')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (302, 21, 2, 6, N'El vagabundo feliz')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (303, 21, 2, 7, N'Productora ejecutiva')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (304, 21, 2, 8, N'La chaqueta de cuero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (305, 21, 2, 9, N'Desde dónde a la eternidad')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (306, 21, 2, 10, N'Dejar sin blanca')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (307, 21, 2, 11, N'Arresto domiciliario')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (308, 21, 2, 12, N'El caballero de la armadura reluciente')
GO
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (309, 21, 2, 13, N'Distorsiones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (310, 21, 3, 1, N'El barrio del Señor Ruggerio')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (311, 21, 3, 2, N'Adiós, pequeña Livia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (312, 21, 3, 3, N'Un hijo afortunado ')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (313, 21, 3, 4, N'El empleado del mes')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (314, 21, 3, 5, N'Otro palillo de dientes')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (315, 21, 3, 6, N'Universidad')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (316, 21, 3, 7, N'Una segunda opinión')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (317, 21, 3, 8, N'Ha resucitado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (318, 21, 3, 9, N'El mozzarella chivato')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (319, 21, 3, 10, N'Para salvarnos a todos del poder de Satanás')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (320, 21, 3, 11, N'Pine Barrens')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (321, 21, 3, 12, N'Amor Puro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (322, 21, 3, 13, N'El ejército de uno')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (323, 21, 4, 1, N'Para todas las deudas públicas y privadas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (324, 21, 4, 2, N'Ausente')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (325, 21, 4, 3, N'Cristóbal')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (326, 21, 4, 4, N'El Peso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (327, 21, 4, 5, N'Pie-O-My')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (328, 21, 4, 6, N'Todo el mundo sufre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (329, 21, 4, 7, N'Mirando mucha televisión')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (330, 21, 4, 8, N'Fusiones y adquisiciones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (331, 21, 4, 9, N'Quien haya hecho esto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (332, 21, 4, 10, N'El tipo fuerte y silencioso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (333, 21, 4, 11, N'Llamando a todas las unidades')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (334, 21, 4, 12, N'Eloise')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (335, 21, 4, 13, N'Olas blancas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (336, 21, 5, 1, N'Los dos Tonys')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (337, 21, 5, 2, N'El rat pack')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (338, 21, 5, 3, N'¿Dónde está Jhonny?')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (339, 21, 5, 4, N'Todas las familias felices')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (340, 21, 5, 5, N'Bordes irregulares')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (341, 21, 5, 6, N'La educación sentimental')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (342, 21, 5, 7, N'En Camelot')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (343, 21, 5, 8, N'Marco Polo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (344, 21, 5, 9, N'Varones negros no identificados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (345, 21, 5, 10, N'Fiambres')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (346, 21, 5, 11, N'La prueba del sueño')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (347, 21, 5, 12, N'Aparcamiento prolongado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (348, 21, 5, 13, N'Con el debido respeto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (349, 21, 6, 1, N'Sólo para socios')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (350, 21, 6, 2, N'Únete al grupo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (351, 21, 6, 3, N'Mayham')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (352, 21, 6, 4, N'La parte carnosa del muslo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (353, 21, 6, 5, N'Los Sacrimoni')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (354, 21, 6, 6, N'Vive libre o muere')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (355, 21, 6, 7, N'El salón de lujo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (356, 21, 6, 8, N'Tortitas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (357, 21, 6, 9, N'La cabalgata')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (358, 21, 6, 10, N'Moe y Joe')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (359, 21, 6, 11, N'Piedras frías')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (360, 21, 6, 12, N'Kaisha')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (361, 21, 6, 13, N'Películas caseras de los Sopranos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (362, 21, 6, 14, N'Estadio 5')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (363, 21, 6, 15, N'Recuerdas cuando...')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (364, 21, 6, 16, N'Persiguiéndolo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (365, 21, 6, 17, N'Camina como un hombre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (366, 21, 6, 18, N'Kennedy y Heidi')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (367, 21, 6, 19, N'El segundo advenimiento')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (368, 21, 6, 20, N'El cometa azul')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (369, 21, 6, 21, N'Hecho en América')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (370, 22, 1, 2, N'Piloto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (371, 22, 1, 3, N'Piloto 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (372, 22, 1, 4, N'Borrón y cuenta nueva')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (373, 22, 1, 5, N'Viaje espiritual')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (374, 22, 1, 6, N'El conejo blanco')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (375, 22, 1, 7, N'La casa del sol naciente')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (376, 22, 1, 8, N'La polilla')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (377, 22, 1, 9, N'Hombre de confianza')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (378, 22, 1, 10, N'Solitario')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (379, 22, 1, 11, N'Criado por otros')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (380, 22, 1, 12, N'Todos los vaqueros tienen problemas con sus padres')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (381, 22, 1, 13, N'Cualquiera que sea el caso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (382, 22, 1, 14, N'Corazones y mentes')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (383, 22, 1, 15, N'Especial')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (384, 22, 1, 16, N'Regreso a casa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (385, 22, 1, 17, N'Fugitivos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (386, 22, 1, 18, N'Perdidos...en Corea')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (387, 22, 1, 19, N'Números')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (388, 22, 1, 20, N'Deudas e intervención')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (389, 22, 1, 21, N'No lastimarás')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (390, 22, 1, 22, N'El bien mayor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (391, 22, 1, 23, N'Nacido para huir')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (392, 22, 1, 24, N'Éxodo, parte 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (393, 22, 1, 25, N'Éxodo, parte 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (394, 22, 1, 26, N'Éxodo, parte 3')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (395, 22, 2, 1, N'Hombre de ciencia, hombre de fé')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (396, 22, 2, 2, N'A la deriva')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (397, 22, 2, 3, N'Orientación')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (398, 22, 2, 4, N'Todos odian a Hugo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (399, 22, 2, 5, N'...Y encontrados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (400, 22, 2, 6, N'Abandonados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (401, 22, 2, 7, N'Los otros 48 días')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (402, 22, 2, 8, N'Colisión')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (403, 22, 2, 9, N'Lo que hizo Kate')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (404, 22, 2, 10, N'El Salmo 23')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (405, 22, 2, 11, N'La fiesta de la cacería')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (406, 22, 2, 12, N'Fuego + agua')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (407, 22, 2, 13, N'La gran estafa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (408, 22, 2, 14, N'Uno de ellos')
GO
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (409, 22, 2, 15, N'Abandono materno')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (410, 22, 2, 16, N'Toda la verdad')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (411, 22, 2, 17, N'Encerrados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (412, 22, 2, 18, N'Dave')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (413, 22, 2, 19, N'S.O.S.')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (414, 22, 2, 20, N'Dos en el camino')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (415, 22, 2, 21, N'?')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (416, 22, 2, 22, N'Tres minutos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (417, 22, 2, 23, N'Vivir juntos, morir solos Parte 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (418, 22, 2, 24, N'Vivir juntos, morir solos Parte 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (419, 22, 3, 1, N'Historia de dos ciudades')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (420, 22, 3, 2, N'La bailarina de cristal')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (421, 22, 3, 3, N'Instrucciones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (422, 22, 3, 4, N'Sálvese quien pueda')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (423, 22, 3, 5, N'El precio de vivir')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (424, 22, 3, 6, N'Acepto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (425, 22, 3, 7, N'No tan cerca de Portland')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (426, 22, 3, 8, N'Tu vida ante tus ojos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (427, 22, 3, 9, N'Extraño en tierra extraña')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (428, 22, 3, 10, N'Tricia Tanaka está muerta')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (429, 22, 3, 11, N'Ingrese 77')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (430, 22, 3, 12, N'Mensaje aéreo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (431, 22, 3, 13, N'El hombre de Tallahassee')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (432, 22, 3, 14, N'Revelación')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (433, 22, 3, 15, N'Dejado atrás')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (434, 22, 3, 16, N'Uno de nosotros')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (435, 22, 3, 17, N'Trampa-22')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (436, 22, 3, 18, N'D.O.C.')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (437, 22, 3, 19, N'El calabozo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (438, 22, 3, 20, N'El hombre detrás de la cortina')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (439, 22, 3, 21, N'Grandes éxitos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (440, 22, 3, 22, N'A través del espejo 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (441, 22, 3, 23, N'A través del espejo 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (442, 22, 4, 1, N'El principio del fin')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (443, 22, 4, 2, N'Confirmado, muertos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (444, 22, 4, 3, N'El economista')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (445, 22, 4, 4, N'El juicio')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (446, 22, 4, 5, N'La constante')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (447, 22, 4, 6, N'La otra mujer')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (448, 22, 4, 7, N'Ji Yeon')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (449, 22, 4, 8, N'Conoce a Kevin Johnson')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (450, 22, 4, 9, N'Lo que nos espera')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (451, 22, 4, 10, N'Algo lindo de regreso a casa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (452, 22, 4, 11, N'Claustrofobia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (453, 22, 4, 12, N'No hay lugar como casa- parte 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (454, 22, 4, 13, N'No hay lugar como casa- parte 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (455, 22, 4, 14, N'No hay lugar como casa- parte 3')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (456, 22, 5, 1, N'Porque te fuiste')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (457, 22, 5, 2, N'La Mentira')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (458, 22, 5, 3, N'Cabeza hueca')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (459, 22, 5, 4, N'El pequeño príncipe')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (460, 22, 5, 5, N'La muerte está aquí')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (461, 22, 5, 6, N'316')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (462, 22, 5, 7, N'Vida y muerte de Jeremy Bentham')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (463, 22, 5, 8, N'LaFleur')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (464, 22, 5, 9, N'Namaste')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (465, 22, 5, 10, N'El prisionero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (466, 22, 5, 11, N'Lo hecho, hecho está')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (467, 22, 5, 12, N'No hay muerto vivo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (468, 22, 5, 13, N'A algunos les gusta caliente')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (469, 22, 5, 14, N'La variable')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (470, 22, 5, 15, N'Sigue al líder')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (471, 22, 5, 16, N'El incidente- parte 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (472, 22, 5, 17, N'El incidente- parte 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (473, 22, 6, 1, N'Los Ángeles')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (474, 22, 6, 2, N'Lo que hace Kate')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (475, 22, 6, 3, N'El subsituto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (476, 22, 6, 4, N'El faro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (477, 22, 6, 5, N'Anochecer')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (478, 22, 6, 6, N'Dr. Linus')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (479, 22, 6, 7, N'Misión de reconocimiento')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (480, 22, 6, 8, N'Eterna')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (481, 22, 6, 9, N'El paquete')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (482, 22, 6, 10, N'Felices para siempre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (483, 22, 6, 11, N'Todos quieren a Hugo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (484, 22, 6, 12, N'El último adepto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (485, 22, 6, 13, N'El candidato')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (486, 22, 6, 14, N'Del otro lado del mar')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (487, 22, 6, 15, N'Por lo que murieron')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (488, 22, 6, 16, N'El fin- parte 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (489, 22, 6, 17, N'El fin- parte 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (490, 18, 1, 1, N'Piloto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (491, 18, 1, 2, N'Aquello que más amas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (492, 18, 1, 3, N'Nieves derretidas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (493, 18, 1, 4, N'El precio del oro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (494, 18, 1, 5, N'Esa vocecilla silenciosa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (495, 18, 1, 6, N'El Pastor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (496, 18, 1, 7, N'El corazón es un cazador silencioso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (497, 18, 1, 8, N'Almas desesperadas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (498, 18, 1, 9, N'Sin norte')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (499, 18, 1, 10, N'7:15 a.m.')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (500, 18, 1, 11, N'El fruto del árbol envenenado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (501, 18, 1, 12, N'A flor de piel')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (502, 18, 1, 13, N'Lo que le sucedió a Frederick')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (503, 18, 1, 14, N'Soñador')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (504, 18, 1, 15, N'In fraganti')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (505, 18, 1, 16, N'El corazón de las tinieblas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (506, 18, 1, 17, N'El truco del sombrero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (507, 18, 1, 18, N'El palafrenero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (508, 18, 1, 19, N'El regreso')
GO
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (509, 18, 1, 20, N'El forastero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (510, 18, 1, 21, N'Una manzana roja como la sangre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (511, 18, 1, 22, N'Un reino sin magia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (512, 18, 2, 1, N'Roto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (513, 18, 2, 2, N'Somos ambos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (514, 18, 2, 3, N'La dama del lago')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (515, 18, 2, 4, N'El cocodrilo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (516, 18, 2, 5, N'El doctor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (517, 18, 2, 6, N'Tallahassee')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (518, 18, 2, 7, N'Criatura de la Luna')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (519, 18, 2, 8, N'En las tinieblas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (520, 18, 2, 9, N'Reina de corazones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (521, 18, 2, 10, N'La baza del grillo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (522, 18, 2, 11, N'Forastero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (523, 18, 2, 12, N'En nombre del hermano')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (524, 18, 2, 13, N'Canijo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (525, 18, 2, 14, N'Manhattan')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (526, 18, 2, 15, N'La reina ha muerto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (527, 18, 2, 16, N'La hija del molinero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (528, 18, 2, 17, N'Bienvenidos a Storybrooke')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (529, 18, 2, 18, N'Generoso, valiente y sincero')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (530, 18, 2, 19, N'Lacey')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (531, 18, 2, 20, N'La reina malvada')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (532, 18, 2, 21, N'La segunda estrella a la derecha')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (533, 18, 2, 22, N'Y recto hasta el amanecer')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (534, 18, 3, 1, N'El corazón del creyente más puro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (535, 18, 3, 2, N'La niña perdida')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (536, 18, 3, 3, N'Un hada de lo más normal')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (537, 18, 3, 4, N'Malos hábitos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (538, 18, 3, 5, N'Ariel')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (539, 18, 3, 6, N'La hondonada oscura')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (540, 18, 3, 7, N'Piensa cosas bonitas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (541, 18, 3, 8, N'Salvemos a Henry')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (542, 18, 3, 9, N'El nuevo Nunca Jamás')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (543, 18, 3, 10, N'Regreso a casa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (544, 18, 3, 11, N'Serenata en Nueva York')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (545, 18, 3, 12, N'Caza de brujas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (546, 18, 3, 13, N'La torre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (547, 18, 3, 14, N'Mentes tranquilas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (548, 18, 3, 15, N'No es fácil ser verde')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (549, 18, 3, 16, N'El Jolly Roger')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (550, 18, 3, 17, N'Traspasando mundos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (551, 18, 3, 18, N'Algo curioso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (552, 18, 3, 19, N'Kansas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (553, 18, 3, 20, N'Blanca a la deriva')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (554, 18, 3, 21, N'Se está mejor en casa que en ningún sitio')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1518, 18, 4, 1, N'La historia de dos hermanas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1519, 18, 4, 2, N'Niebla')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1520, 18, 4, 3, N'Rocky Road')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1522, 18, 4, 4, N'El Aprendiz')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1523, 18, 4, 5, N'Espejo roto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1524, 18, 4, 6, N'Asunto Familiar')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1525, 18, 4, 7, N'La Reina de las Nieves')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1526, 18, 4, 8, N'Rompe el espejo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1527, 18, 4, 9, N'Caída')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1528, 18, 4, 10, N'Vista destrozada')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1529, 18, 4, 11, N'Héroes y villanos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1530, 18, 4, 12, N'Oscuridad a las afueras de la ciudad')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1531, 18, 4, 13, N'Sin perdón')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1532, 18, 4, 14, N'Convertirse en dragón')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1533, 18, 4, 15, N'Pobre alma en desgracia')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1534, 18, 4, 16, N'Los planes mejor trazados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1535, 18, 4, 17, N'Corazón de oro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1536, 18, 4, 18, N'Simpatía por De Vil')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1537, 18, 4, 19, N'Lily')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1538, 18, 4, 20, N'Madre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1539, 18, 4, 21, N'Operación Mangosta. Parte 1')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1540, 18, 4, 22, N'Operación Mangosta. Parte 2')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1541, 18, 5, 1, N'El Cisne negro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1542, 18, 5, 2, N'El precio')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1543, 18, 5, 3, N'El asiento peligroso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1544, 18, 5, 4, N'El Reino roto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1545, 18, 5, 5, N'Atrapasueños')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1546, 18, 5, 6, N'El oso y el arco')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1547, 18, 5, 7, N'Nimue')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1548, 18, 5, 8, N'Nacimiento')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1549, 18, 5, 9, N'El rey oso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1550, 20, 1, 1, N'Piloto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1551, 20, 1, 2, N'Único punto de fallo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1552, 20, 1, 3, N'Un ciclón')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1553, 20, 1, 8, N'Negocios arriesgados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1554, 20, 1, 5, N'El plutonio es para siempre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1555, 20, 1, 6, N'Colores verdaderos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1556, 20, 1, 7, N'Día del padre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1557, 20, 1, 8, N'Negocios arriesgados')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1558, 20, 1, 9, N'Elemento pícaro')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1559, 20, 1, 10, N'Talismán')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1560, 20, 1, 11, N'Venganza')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1561, 20, 1, 12, N'Dominó')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1562, 20, 1, 13, N'Zona de muerte')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1563, 20, 1, 14, N'El amor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1564, 20, 1, 15, N'No me olvides')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1565, 20, 1, 16, N'El crucero del amor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1566, 20, 1, 17, N'Hacia el Sur')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1567, 20, 1, 18, N'Si no te hace más fuerte, te mata')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1568, 20, 1, 19, N'La chispa de un corazón joven')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1569, 20, 1, 20, N'Encrucijadas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1570, 20, 1, 21, N'El suspenso')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1571, 20, 1, 22, N'Postales desde el Risco')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1572, 20, 2, 1, N'El satélite del amor')
GO
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1573, 20, 2, 2, N'Cuba libre')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1574, 20, 2, 3, N'Filete de pescado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1575, 20, 2, 4, N'Robots')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1576, 20, 2, 5, N'Superdivertidos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1577, 20, 2, 6, N'Tecnología, drogas y Rock''n''Roll')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1578, 20, 2, 7, N'Tren loco')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1579, 20, 2, 8, N'Área 51')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1580, 20, 2, 9, N'US vs. UN vs. UK')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1581, 20, 2, 10, N'Llegadas y salidas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1582, 20, 2, 11, N'La vieja escuela')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1583, 20, 2, 12, N'Maldita presa')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1584, 20, 2, 13, N'Tormenta de nieve')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1585, 20, 2, 14, N'Bastardo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1586, 20, 2, 15, N'Da Bomb')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1587, 20, 2, 16, N'Fracturado')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1588, 20, 2, 17, N'Adaptación')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1589, 20, 2, 18, N'El rápido y el nerd')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1590, 20, 2, 19, N'Ticker')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1591, 20, 2, 20, N'Djibouti llama')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1592, 20, 2, 21, N'Gira y grita')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1593, 20, 2, 22, N'Hard Knox')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1594, 20, 2, 23, N'Intenciones de Chernobyl')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1595, 20, 2, 24, N'Toby o no Toby')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1596, 17, 3, 9, N'Los muertos y los moribundos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1597, 17, 3, 10, N'Victoria')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1598, 18, 5, 10, N'Corazón roto')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1599, 18, 5, 11, N'La canción del cisne')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1600, 18, 5, 12, N'Alma de los Difuntos')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1601, 18, 5, 13, N'Labor de Amor')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1602, 18, 5, 14, N'Heredero del Diablo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1603, 18, 5, 15, N'Los hermanos Jones')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1604, 18, 5, 16, N'Nuestra caída')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1605, 18, 5, 17, N'Su héroe guapo')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1606, 18, 5, 18, N'Zapatos de Rubí')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1607, 18, 5, 19, N'Hermanas')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1608, 18, 5, 20, N'Pájaro de Fuego')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1609, 18, 5, 21, N'Último Rito')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1610, 18, 5, 22, N'Sólo tú')
INSERT [dbo].[tblCapitulos] ([id], [idSerie], [Temporada], [Numero], [Nombre]) VALUES (1611, 18, 5, 23, N'Una historia jamás contada')
SET IDENTITY_INSERT [dbo].[tblCapitulos] OFF
INSERT [dbo].[tblCapitulosDEL] ([id], [idSerie], [idTemporada], [Numero], [Nombre], [UsuarioBaja], [FechaBaja]) VALUES (1521, 18, 4, 6, N'', 1009, CAST(N'2016-07-20 22:44:39.143' AS DateTime))
INSERT [dbo].[tblCapitulosDEL] ([id], [idSerie], [idTemporada], [Numero], [Nombre], [UsuarioBaja], [FechaBaja]) VALUES (64, 20, 1, 3, N'', 1009, CAST(N'2016-07-20 23:57:34.987' AS DateTime))
INSERT [dbo].[tblCapitulosDEL] ([id], [idSerie], [idTemporada], [Numero], [Nombre], [UsuarioBaja], [FechaBaja]) VALUES (64, 0, 0, 0, N'', 1009, CAST(N'2016-07-20 23:57:44.497' AS DateTime))
INSERT [dbo].[tblCapitulosDEL] ([id], [idSerie], [idTemporada], [Numero], [Nombre], [UsuarioBaja], [FechaBaja]) VALUES (216, 4, 1, 11, N'', 1009, CAST(N'2016-07-21 00:19:38.503' AS DateTime))
INSERT [dbo].[tblCapitulosDEL] ([id], [idSerie], [idTemporada], [Numero], [Nombre], [UsuarioBaja], [FechaBaja]) VALUES (258, 17, 3, 5, N'', 1009, CAST(N'2016-07-21 00:29:48.290' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblComentarios] ON 

INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (1, 1, N'Buenisima esta serie! Recomendadisima!', CAST(N'2016-07-10 21:52:11.887' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (2, 1009, N'Muy interesante.', CAST(N'2016-07-12 23:05:36.203' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (11, 1, N',Excelentísima serie!,', CAST(N'2016-07-15 16:03:36.597' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (12, 1, N',prueba,', CAST(N'2016-07-15 16:05:18.777' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (13, 1, N',asd,', CAST(N'2016-07-15 16:07:46.207' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (14, 1, N'asd', CAST(N'2016-07-15 16:08:43.470' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (15, 1, N'asd', CAST(N'2016-07-15 16:14:05.687' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (1003, 9, N'Esta es la mejor serie de la vida! Hermosa', CAST(N'2016-07-18 17:31:20.313' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (1004, 9, N'Esta serie me la recomendó un amigo, debería verla?', CAST(N'2016-07-18 17:31:48.470' AS DateTime))
INSERT [dbo].[tblComentarios] ([id], [idUsuario], [Comentario], [Fecha]) VALUES (1005, 1, N'Hola!', CAST(N'2016-07-19 08:58:05.220' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblComentarios] OFF
INSERT [dbo].[tblComentariosxNoticia] ([idNoticia], [idComentario]) VALUES (8, 1)
INSERT [dbo].[tblComentariosxNoticia] ([idNoticia], [idComentario]) VALUES (17, 2)
INSERT [dbo].[tblComentariosxNoticia] ([idNoticia], [idComentario]) VALUES (32, 14)
INSERT [dbo].[tblComentariosxSerie] ([idSerie], [idComentario]) VALUES (2, 11)
INSERT [dbo].[tblComentariosxSerie] ([idSerie], [idComentario]) VALUES (2, 12)
INSERT [dbo].[tblComentariosxSerie] ([idSerie], [idComentario]) VALUES (2, 13)
INSERT [dbo].[tblComentariosxSerie] ([idSerie], [idComentario]) VALUES (2, 15)
INSERT [dbo].[tblComentariosxSerie] ([idSerie], [idComentario]) VALUES (3, 1004)
INSERT [dbo].[tblComentariosxSerie] ([idSerie], [idComentario]) VALUES (3, 1005)
INSERT [dbo].[tblComentariosxSerie] ([idSerie], [idComentario]) VALUES (4, 1003)
SET IDENTITY_INSERT [dbo].[tblGeneros] ON 

INSERT [dbo].[tblGeneros] ([id], [Descripcion]) VALUES (1, N'Drama')
INSERT [dbo].[tblGeneros] ([id], [Descripcion]) VALUES (2, N'Acción')
INSERT [dbo].[tblGeneros] ([id], [Descripcion]) VALUES (3, N'Ciencia ficción')
INSERT [dbo].[tblGeneros] ([id], [Descripcion]) VALUES (4, N'Comedia')
INSERT [dbo].[tblGeneros] ([id], [Descripcion]) VALUES (5, N'Infantil')
INSERT [dbo].[tblGeneros] ([id], [Descripcion]) VALUES (6, N'Suspenso')
SET IDENTITY_INSERT [dbo].[tblGeneros] OFF
SET IDENTITY_INSERT [dbo].[tblNoticias] ON 

INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (16, 1, N'Scorpion se renueva para una tercera temporada', N'Prepárense porque nuestro grupo de genios favoritos llegan para enloquecernos con una tercera temporada.', N'El equipo de Scorpion tiene grandes noticias para ti, y es que después de unas merecidas vacaciones el elenco volverá al set de grabación para iniciar lo que será su tercera temporada. Y no es de extrañar para nadie porque estos chicos siguen poniendo nuestros martes por la noche de cabeza con todas sus locuras y soluciones ingeniosas que nunca entendemos. Además que no es de extrañar que la cadena CBS haya apostado nuevamente por este drama de la televisión, ya que es uno de los mejores cosechando éxitos a nivel de ratings, ya que alcanza un promedio de 11 millones de personas por episodio.  Y si crees que los has visto todo, entonces prepárate para sorprenderte porque con cada temporada que pasa los casos son más grandes y más difíciles para nuestros genios favoritos. Mientras tanto puedes disfrutar de los nuevos episodios de Scorpion de la segunda temporada todos los martes a las 8 pm Col, 8:30 pm Ven, 9 pm Ven y 10 pm Arg.', N'images/scorpion.jpg', CAST(N'2016-06-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (17, 1, N'Vikings, una de las mejores series de la actualidad', N'Te contamos por qué no podés dejar de ver esta gran producción', N'La cuarta temporada de Vikings cerró su primera mitad con un capítulo excelente, digno de lo mejor que se ha visto en materia de género épico en la televisión. El Rey RagnarLothbrok (TravisFimmel) decide el ataque a París con sus naves de guerra, obsesionado con la traición de Rollo (CliveStanden), su hermano, a manos de un pacto con los franceses para la defensa de la ciudad. La suerte de la batalla decide el destino de Ragnar en el peor momento de su liderazgo. Una temporada diferente, de 20 episodios (las anteriores fueron de 10 capítulos) que retornará con su segunda parte pasada la mitad del año. Vikings se destaca entre las propuestas de shows épicos en las series actuales, muchas veces logrando resultados narrativos más satisfactorios que buenos exponentes del género como la mismísima Game of Thrones. Por eso, compartimos cinco aspectos esenciales de esta notable producción.', N'images/vikings.jpg', CAST(N'2016-06-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (18, 1, N'''Mr. Robot'': el creador quiere una mayor distancia entre la segunda y la tercera temporada', N'La segunda entrega de la serie revelación de 2015 se estrena el 13 de julio en USA Network.', N'Mr. Robot, la original ficción de USA Network protagonizada por Rami Malek en la piel del pirata informático Elliot Alderson, estrenará su segunda temporada el próximo 13 de julio en la cadena estadounidense. No obstante, a falta de apenas un mes para el esperado lanzamiento, parece que el equipo de la que fuera una de las series revelación de 2015 ya está pensando en nuevas entregas. Según publica Entertainment Wekly, el ''showrunner'' de Mr. Robot Sam Esmail ha comenzado a cuestionar las "normas" establecidas de la industria y ha expresado su deseo de aumentar la distancia entre temporadas en lugar de estrenar una cada año y en la misma fecha aproximada.  Según el ''showrunner'', lo ideal es estrenar la nueva entrega de una serie cuando el resultado obtenido es el esperado y no teniendo que cumplir con una fecha límite para que se estrene cuando los espectadores esperan que lo haga: "¿Es mejor lanzaor algo que no es tan bueno sólo para estar en fecha porque tienes miedo de perder espectadores? Con una peor calidad de guión o historia los vas a perder de todas formas. Creo que te estás disparando en el pie si haces eso".', N'images/mrrobotseason2.jpg', CAST(N'2016-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (20, 1, N'Better Call Saul más cerca de Breaking Bad', N'En la segunda temporada de la serie de Netflix, Jimmy McGill se convierte en Saul Goodman, el inescrupuloso abogado que conocimos en Breaking Bad', N'ALBUQUERQUE.- Es martes de tacos en el set de Better Call Saul . Extras vestidos con traje y técnicos con walkie talkies se acercan a las mesas ubicadas debajo de unos toldos para elegir si quieren comer tacos de pato picante o de carne estilo coreano, todo con un sinfín de condimentos. La comida, una vuelta de tuerca del plato típico mexicano, marida perfecto con el paisaje desértico de las afueras de Albuquerque, Nueva México. Esta ciudad del sudoeste de los Estados Unidos se hizo conocida en todo el mundo gracias a Breaking Bad y ahora es el hogar de Better Call Saul, la precuela de la exitosa serie, que cuenta cómo un abogado entusiasta llamado Jimmy McGill (Bob Odenkirk) se convierte en Saul Goodman, un letrado de dudosa moral que, uno años después, ayudará a Walter White con sus problemas legales derivados de la elaboración y venta de anfetaminas. Tras el almuerzo llega el tiempo de filmar un episodio de la segunda temporada de la serie de Netflix, que desde hoy se podrá ver en la Argentina. Los episodios estarán disponibles de a uno por semana, al ritmo de su estreno en los Estados Unidos.', N'images/bcs.jpg', CAST(N'2016-06-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (21, 1, N'El viernes vuelve House of Cards: ¿se caerá Netflix?', N'En los Estados Unidos se prevé que el estreno incremente el tráfico de la Red entre un 15 y un 35 por ciento durante el fin de semana, como ocurrió hace un año.', N'El estreno de la nueva temporada de la serie House of Cards, producida y transmitida en exclusiva por Netflix vía streaming, no pasará inadvertida en Internet. Con una temporada completa puesta a disposición de la audiencia, la plataforma de streaming de series, películas y documentales es uno de los servicios más demandantes en el mercado norteamericano, donde ocupa el 36,48 por ciento del tráfico de Internet en Estados Unidos y Canadá en hora pico según la firma canadiense Sandvine, especializada en análisis de redes de comunicaciones. House of Cards es la gran apuesta de la compañía liderada por Reed Hastings, y el estreno de la nueva temporada, pasado mañana, refleja una mayor demanda en los proveedores de Internet. En el análisis de una red de una compañía estadounisense, el fin de semana del lanzamiento de la tercera temporada en 2015 reflejó un incremento en el tráfico de un 10 a un 15 por ciento durante el viernes y sábado, y alcanzó un 35 por ciento durante el domingo, el día de la semana preferido por los abonados de Netflix.  De hecho, para este año se espera que la demanda sea mucho mayor tras el reciente anuncio de la cobertura global de Netflix. Al ser una producción original de la compañía, todos los capítulos de la cuarta temporada de House of Cards está disponible en los catálogos de los 190 países donde opera la plataforma de streaming. A su vez, desde 2014, Netflix elabora un ranking con los proveedores de Internet que mejor respuesta ofrecen para su servicio de transmisión de video por Internet. En la Argentina se destacan Telecentro, Cablevisión Fibertel y Claro, aunque la compañía de Internet aclara que el índice no refleja el máximo rendimiento o capacidad de cada compañía, sino que sólo indica la velocidad del proveedor de Internet basado en la tasa de transferencia de bits de sus contenidos en el horario de mayor audiencia.', N'images/house-of-cards-seaosn-2__140603234815.jpg', CAST(N'2016-06-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (23, 9, N'Once Upon a Time Finale: New Fairytale Characters Arrive & A Familiar Face Returns', N'The fantasy series keeps on bringing new stuff', N'Caution! This article contains spoilers for tonight''s finale of Once Upon a Time. Continue reading at your own risk!

Storybrooke''s got a new boss.

Tonight''s finale of Once Upon a Time introduced a whole new fairytale character, and half of him is a whole lot of bad news for the residents of Storybrooke.

Jeckyll and Hyde have arrived, and while Dr. Jekyll is nice and harmless, his other half, Hyde, is all about ruling the world, or whatever typical thing villains want to do these days. He''s starting with Storybrooke, which is "just the sort of place he''s been looking for," in exchange for helping Gold wake up Belle.

While Jekyll and Hyde started out the episode tied together in the same body, Dr. Jekyll created a serum to separate the good and the bad in a person, allowing he and Hyde to roam free of each other.

That serum also came in handy (or so she thought) for Regina, who spent the episode wrestling with the possibility that her former, evil self could come back out at any time. So, the plan was for Regina to be injected with the serum, and then as soon as the Evil Queen emerged, she would kill her.', N'images/Once Upon a Time.jpg', CAST(N'2016-07-13 11:01:41.220' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (24, 9, N'Game of Thrones season 7 release date, spoilers, cast and everything you need to know', N'These are the hard facts on the future of HBO''s fantasy hit.', N'No, it''s not too early to get excited about Game of Thrones season seven. With the HBO hit''s sixth run now over, thoughts are inevitably turning to next year... and how much longer the fantasy epic can run.', N'images/game-of-thrones-nights-king.jpg', CAST(N'2016-07-13 11:03:33.417' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (25, 9, N'History Channel has officially renewed Vikings for season 5', N'Vikings season 4 Part 2 will return in fall 2016', N'As you know, in the past few years, Scandinavian subject matter in movies and TV has become a popular trend. A few high-quality Scandinavian television projects, for example, the TV series The Bridge and The Killing have caused quite a stir with viewers around the globe. The creativity of Swedish and Norwegian crime genre authors has led to the fact that Northern mythology has even leaked into the television adaptation of the Marvel studio’s comic books. In the wake of this interest, in 2013, a new joint Canadian-Irish historical television drama series The Vikings was created and it immediately became extremely popular far beyond the borders of these two countries. The most recent, season 4 of Vikings, was released on the History channel on February 18, 2016, and millions of fans of the award-winning TV series are already wondering about the future of the show and possible twists and turns of its storylines.

', N'images/vikings.jpg', CAST(N'2016-07-13 11:05:51.540' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (26, 9, N'El final de Penny Dreadful', N'La serie ha transmitido su último capítulo', N'CLEVELAND, Ohio – The penny dropped on Monday, June 20. The Sunday night episode of Showtime''s "Penny Dreadful" wasn''t just the third-season finale. It was (gasp!) the series finale.

Wait . . . what? How could this be? The literate and richly textured supernatural drama was sailing along in grand style. With its complex web of characters drawn from seminal 19th-century horror novels, it surely had enough intriguing storylines to last another four seasons, maybe more.', N'images/penny_dreadful season 3.jpg', CAST(N'2016-07-13 11:06:40.420' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (27, 9, N'Two things the show ''Silicon Valley'' gets wrong', N'Spoiler alert: It is not possible to review and comment on Episode 4 of the HBO show "Silicon Valley," which aired on Sunday, without revealing some critical plot twists. You are forewarned.', N'Episode 4 has two big plot moments. The first is a board meeting to approve the sales agreement that Pied Piper has struck with Maleant Data Systems. 
As the board discusses the agreement, it becomes clear that CEO Jack Barker (Stephen Tobolowsky) has agreed to a five-year exclusive agreement with Maleant that includes the compression algorithms, which means that Richard Hendricks (Thomas Middleditch) and his team cannot build their platform.

Jack thinks he is going to get board approval as the two VCs on board , Laurie Bream (Suzanne Cryer) and Monica (Amanda Crew), will have a fiduciary duty to approve this contract. However, Monica surprises everyone by saying that she values the platform over the agreement and becomes the swing vote that turns down the agreement. Richard and Ehrlich Bachman (T.J. Miller) were the other "no" votes.
Having been a VC for 18 years, I have been through my share of contentious board meetings but it is pretty rare for a private company to have a split board decision this close. If there are such divided opinions on a topic, the board would usually defer a decision until additional consensus is arrived. It is also highly unusual when a VC has two board seats (as Raviga Capital has on the show) that the two board members would split their votes in different directions. That would be a career-limiting move by the junior person in real life.

The one surprising omission by the scriptwriters is not having the corporate lawyer in this scene. Almost all board meetings will have legal counsel and when it comes to nitty-gritty legal contracts, counsel will be asked to opine and clarify.', N'images/silicon valley.jpg', CAST(N'2016-07-13 11:09:49.807' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (29, 9, N'What Will Happen On ''Veep'' Season 6? Selina Meyer''s Future Is More Uncertain Than Ever', N'A small look into HBO''s comedy', N'HBO''s brilliant, cutting political satire Veep has been full of surprises throughout its first five seasons — from Selina Meyer''s unexpected rise to the presidency in the Season 3 finale to the electoral tie in Season 4, the show has never been afraid to throw viewers serious curveballs. But, the Veep Season 5 finale arguably provided the most shocking moment of the entire series when Selina was forced out of the White House entirely and Senator Laura Montez became President. So, what will happen in Veep Season 6 now that Selina (and several members of her long-suffering staff) are jobless?

', N'images/veep.jpg', CAST(N'2016-07-13 11:13:11.567' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (30, 9, N'Prison Break season 5: Cast, characters, plot and everything else you need to know about the reboot', N'Michael Scofield is coming back from the dead in 2017.', N'Back in 2010 - a year after Prison Break originally wrapped - series lead Wentworth Miller implied that the show was unlikely to return:

"I feel as though we told the story we intended to tell. That''s something that''s very rare in television - that you''re allowed closure - and we were."

You can understand the sentiment, since series finale The Final Break had left Miller''s character - aesthetically pleasing, plentifully tattooed architect Michael Scofield - dead and buried.

Five years on and Miller was re-teamed with his former co-star and screen sibling Dominic Purcell on The Flash - Purcell was Heatwave, fiery familiar of Miller''s Captain Cold on the superhero series, and their reunion sparked (no pun intended) new interest in Prison Break.', N'images/prisonbreak.jpg', CAST(N'2016-07-13 11:23:44.077' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (31, 9, N'Return to Hell''s Kitchen in Exclusive ''Marvel''s Daredevil'' Poster & Photos ', N'See who Matt Murdock will face in Season 2 of ''Marvel''s Daredevil,'' streaming only on Netflix March 18! ', N'In Season 1 of "Marvel''s Daredevil," Matt Murdock (Charlie Cox) stopped at nothing to bring justice to Hell''s Kitchens, no matter what stood in his way. Heading into Season 2, the "Devil of Hell''s Kitchen" will face challenges new and familiar, like the deadly vigilante Frank Castle (Jon Bernthal) and the mysterious Elektra Natchios (Elodie Yung), to save his city! See the battles Matt has faced in a new poster along with images from the upcoming season to see what he''s up against!
', N'images/daredevil.jpg', CAST(N'2016-07-13 11:25:33.567' AS DateTime))
INSERT [dbo].[tblNoticias] ([id], [idUsuario], [Titulo], [Copete], [Contenido], [Imagen], [FechaPublicacion]) VALUES (32, 9, N'What To Expect From Jessica Jones Season 2', N'The amazing Netflix series comes back next year', N'There has been some news regarding Marvel’s Netflix TV front over the last several months, including the news that the Punisher will, in fact, be getting his own series. Regardless, news related to Jessica Jones Season 2 has been not so forthcoming. This week, though, series lead Krysten Ritter did answer some questions about the upcoming second season of Jessica Jones, giving us a better understanding of what to expect, and when. 

Probably the single most important thing Krysten Ritten mentioned in this interview is that she has a good idea of when both The Defenders and Jessica Jones will be filming, telling Digital Spy that she is currently training for both roles. She also mentions that both will film back-to-back for premieres, although we may not get those episodes for some time.  
', N'images/jessica jones.jpg', CAST(N'2016-07-13 11:28:04.860' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblNoticias] OFF
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (10, N'Prueba', N'Esta es una noticia de prueba', N'images/ramimalek.jpg', N'alksjdna;kjsdn', N'7', CAST(N'2016-07-07 10:14:44.953' AS DateTime), N'1', CAST(N'2016-07-07 11:51:51.193' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (10, N'', N'', N'images/', N'', NULL, NULL, N'1', CAST(N'2016-07-07 11:52:48.593' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (9, N'aksjdniaj', N'alsjhdbalishd', N'images/houseofcards.jpg', N'askljdbnalksjd', N'1', CAST(N'2016-06-07 18:12:55.607' AS DateTime), N'1', CAST(N'2016-07-07 11:54:31.217' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (0, N'prueba con foto', N'asd123', N'images/maxresdefault.jpg', N'aowjdnao;jsdnaosd', NULL, NULL, N'1', CAST(N'2016-07-07 22:24:02.300' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (12, N'prueba con foto', N'asd123', N'images/maxresdefault.jpg', N'aowjdnao;jsdnaosd', N'1', CAST(N'2016-07-07 22:24:02.293' AS DateTime), N'1', CAST(N'2016-07-07 22:24:54.083' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (7, N'Scorpion se renueva para una tercera temporada', N'Prepárense porque nuestro grupo de genios favoritos llegan para enloquecernos con una tercera temporada.', N'images/scorpion.jpg', N'El equipo de Scorpion tiene grandes noticias para ti, y es que después de unas merecidas vacaciones el elenco volverá al set de grabación para iniciar lo que será su tercera temporada. Y no es de extrañar para nadie porque estos chicos siguen poniendo nuestros martes por la noche de cabeza con todas sus locuras y soluciones ingeniosas que nunca entendemos. Además que no es de extrañar que la cadena CBS haya apostado nuevamente por este drama de la televisión, ya que es uno de los mejores cosechando éxitos a nivel de ratings, ya que alcanza un promedio de 11 millones de personas por episodio.  Y si crees que los has visto todo, entonces prepárate para sorprenderte porque con cada temporada que pasa los casos son más grandes y más difíciles para nuestros genios favoritos. Mientras tanto puedes disfrutar de los nuevos episodios de Scorpion de la segunda temporada todos los martes a las 8 pm Col, 8:30 pm Ven, 9 pm Ven y 10 pm Arg.', N'1', CAST(N'2016-06-09 00:00:00.000' AS DateTime), N'1', CAST(N'2016-07-12 20:59:54.540' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (8, N'Vikings, una de las mejores series de la actualidad', N'Te contamos por qué no podés dejar de ver esta gran producción', N'images/vikings.jpg', N'La cuarta temporada de Vikings cerró su primera mitad con un capítulo excelente, digno de lo mejor que se ha visto en materia de género épico en la televisión. El Rey RagnarLothbrok (TravisFimmel) decide el ataque a París con sus naves de guerra, obsesionado con la traición de Rollo (CliveStanden), su hermano, a manos de un pacto con los franceses para la defensa de la ciudad. La suerte de la batalla decide el destino de Ragnar en el peor momento de su liderazgo. Una temporada diferente, de 20 episodios (las anteriores fueron de 10 capítulos) que retornará con su segunda parte pasada la mitad del año. Vikings se destaca entre las propuestas de shows épicos en las series actuales, muchas veces logrando resultados narrativos más satisfactorios que buenos exponentes del género como la mismísima Game of Thrones. Por eso, compartimos cinco aspectos esenciales de esta notable producción.', N'1', CAST(N'2016-06-10 00:00:00.000' AS DateTime), N'1', CAST(N'2016-07-12 21:00:13.430' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (2, N'''Mr. Robot'': el creador quiere una mayor distancia entre la segunda y la tercera temporada', N'La segunda entrega de la serie revelación de 2015 se estrena el 13 de julio en USA Network.', NULL, N'Mr. Robot, la original ficción de USA Network protagonizada por Rami Malek en la piel del pirata informático Elliot Alderson, estrenará su segunda temporada el próximo 13 de julio en la cadena estadounidense. No obstante, a falta de apenas un mes para el esperado lanzamiento, parece que el equipo de la que fuera una de las series revelación de 2015 ya está pensando en nuevas entregas. Según publica Entertainment Wekly, el ''showrunner'' de Mr. Robot Sam Esmail ha comenzado a cuestionar las "normas" establecidas de la industria y ha expresado su deseo de aumentar la distancia entre temporadas en lugar de estrenar una cada año y en la misma fecha aproximada.  Según el ''showrunner'', lo ideal es estrenar la nueva entrega de una serie cuando el resultado obtenido es el esperado y no teniendo que cumplir con una fecha límite para que se estrene cuando los espectadores esperan que lo haga: "¿Es mejor lanzaor algo que no es tan bueno sólo para estar en fecha porque tienes miedo de perder espectadores? Con una peor calidad de guión o historia los vas a perder de todas formas. Creo que te estás disparando en el pie si haces eso".', N'1', CAST(N'2016-06-06 00:00:00.000' AS DateTime), N'1', CAST(N'2016-07-12 21:02:43.593' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (9, N'Testear', N'asd', N'images/ss+(2016-06-14+at+08.08.17).jpg', N'asdasd', N'1', CAST(N'2016-07-12 21:08:41.630' AS DateTime), N'1', CAST(N'2016-07-12 21:11:59.370' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (5, N'Better Call Saul más cerca de Breaking Bad', N'En la segunda temporada de la serie de Netflix, Jimmy McGill se convierte en Saul Goodman, el inescrupuloso abogado que conocimos en Breaking Bad', N'images/bcs.jpg', N'ALBUQUERQUE.- Es martes de tacos en el set de Better Call Saul . Extras vestidos con traje y técnicos con walkie talkies se acercan a las mesas ubicadas debajo de unos toldos para elegir si quieren comer tacos de pato picante o de carne estilo coreano, todo con un sinfín de condimentos. La comida, una vuelta de tuerca del plato típico mexicano, marida perfecto con el paisaje desértico de las afueras de Albuquerque, Nueva México. Esta ciudad del sudoeste de los Estados Unidos se hizo conocida en todo el mundo gracias a Breaking Bad y ahora es el hogar de Better Call Saul, la precuela de la exitosa serie, que cuenta cómo un abogado entusiasta llamado Jimmy McGill (Bob Odenkirk) se convierte en Saul Goodman, un letrado de dudosa moral que, uno años después, ayudará a Walter White con sus problemas legales derivados de la elaboración y venta de anfetaminas. Tras el almuerzo llega el tiempo de filmar un episodio de la segunda temporada de la serie de Netflix, que desde hoy se podrá ver en la Argentina. Los episodios estarán disponibles de a uno por semana, al ritmo de su estreno en los Estados Unidos.', N'1', CAST(N'2016-06-08 00:00:00.000' AS DateTime), N'1', CAST(N'2016-07-12 21:14:06.717' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (13, N'aksjdniaj', N'alsjhdbalishd', N'images/houseofcards.jpg', N'askljdbnalksjd', N'1', CAST(N'2016-06-07 18:12:55.607' AS DateTime), N'1', CAST(N'2016-07-12 21:32:30.993' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (15, N'prueba con foto', N'asd123', N'images/maxresdefault.jpg', N'aowjdnao;jsdnaosd', N'1', CAST(N'2016-07-07 22:24:02.293' AS DateTime), N'1', CAST(N'2016-07-12 21:32:36.990' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (11, N'Prueba', N'Esta es una noticia de prueba', N'images/ramimalek.jpg', N'54321', N'7', CAST(N'2016-07-07 10:14:44.953' AS DateTime), N'1', CAST(N'2016-07-12 21:32:42.367' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (19, N'Testear', N'asd', N'images/ss+(2016-06-14+at+08.08.17).jpg', N'asdasd', N'1', CAST(N'2016-07-12 21:08:41.630' AS DateTime), N'1', CAST(N'2016-07-12 21:32:46.990' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (3, N'El viernes vuelve House of Cards: ¿se caerá Netflix?', N'En los Estados Unidos se prevé que el estreno incremente el tráfico de la Red entre un 15 y un 35 por ciento durante el fin de semana, como ocurrió hace un año.', NULL, N'El estreno de la nueva temporada de la serie House of Cards, producida y transmitida en exclusiva por Netflix vía streaming, no pasará inadvertida en Internet. Con una temporada completa puesta a disposición de la audiencia, la plataforma de streaming de series, películas y documentales es uno de los servicios más demandantes en el mercado norteamericano, donde ocupa el 36,48 por ciento del tráfico de Internet en Estados Unidos y Canadá en hora pico según la firma canadiense Sandvine, especializada en análisis de redes de comunicaciones. House of Cards es la gran apuesta de la compañía liderada por Reed Hastings, y el estreno de la nueva temporada, pasado mañana, refleja una mayor demanda en los proveedores de Internet. En el análisis de una red de una compañía estadounisense, el fin de semana del lanzamiento de la tercera temporada en 2015 reflejó un incremento en el tráfico de un 10 a un 15 por ciento durante el viernes y sábado, y alcanzó un 35 por ciento durante el domingo, el día de la semana preferido por los abonados de Netflix.  De hecho, para este año se espera que la demanda sea mucho mayor tras el reciente anuncio de la cobertura global de Netflix. Al ser una producción original de la compañía, todos los capítulos de la cuarta temporada de House of Cards está disponible en los catálogos de los 190 países donde opera la plataforma de streaming. A su vez, desde 2014, Netflix elabora un ranking con los proveedores de Internet que mejor respuesta ofrecen para su servicio de transmisión de video por Internet. En la Argentina se destacan Telecentro, Cablevisión Fibertel y Claro, aunque la compañía de Internet aclara que el índice no refleja el máximo rendimiento o capacidad de cada compañía, sino que sólo indica la velocidad del proveedor de Internet basado en la tasa de transferencia de bits de sus contenidos en el horario de mayor audiencia.', N'1', CAST(N'2016-06-07 00:00:00.000' AS DateTime), N'1', CAST(N'2016-07-12 21:05:11.150' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (0, N'Testear', N'asd', N'images/ss+(2016-06-14+at+08.08.17).jpg', N'asdasd', NULL, NULL, N'1', CAST(N'2016-07-12 21:08:41.630' AS DateTime))
INSERT [dbo].[tblNoticiasDEL] ([id], [Titulo], [Copete], [Imagen], [Contenido], [UsuarioAlta], [FechaAlta], [UsuarioBaja], [FechaBaja]) VALUES (28, N'Two things the show ''Silicon Valley'' gets wrong', N'Spoiler alert: It is not possible to review and comment on Episode 4 of the HBO show "Silicon Valley," which aired on Sunday, without revealing some critical plot twists. You are forewarned.', N'images/silicon valley.jpg', N'Episode 4 has two big plot moments. The first is a board meeting to approve the sales agreement that Pied Piper has struck with Maleant Data Systems. 
As the board discusses the agreement, it becomes clear that CEO Jack Barker (Stephen Tobolowsky) has agreed to a five-year exclusive agreement with Maleant that includes the compression algorithms, which means that Richard Hendricks (Thomas Middleditch) and his team cannot build their platform.

Jack thinks he is going to get board approval as the two VCs on board , Laurie Bream (Suzanne Cryer) and Monica (Amanda Crew), will have a fiduciary duty to approve this contract. However, Monica surprises everyone by saying that she values the platform over the agreement and becomes the swing vote that turns down the agreement. Richard and Ehrlich Bachman (T.J. Miller) were the other "no" votes.
Having been a VC for 18 years, I have been through my share of contentious board meetings but it is pretty rare for a private company to have a split board decision this close. If there are such divided opinions on a topic, the board would usually defer a decision until additional consensus is arrived. It is also highly unusual when a VC has two board seats (as Raviga Capital has on the show) that the two board members would split their votes in different directions. That would be a career-limiting move by the junior person in real life.

The one surprising omission by the scriptwriters is not having the corporate lawyer in this scene. Almost all board meetings will have legal counsel and when it comes to nitty-gritty legal contracts, counsel will be asked to opine and clarify.', N'9', CAST(N'2016-07-13 11:12:28.980' AS DateTime), N'9', CAST(N'2016-07-13 11:16:45.497' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblPaises] ON 

INSERT [dbo].[tblPaises] ([id], [Descripcion]) VALUES (1, N'Estados Unidos')
SET IDENTITY_INSERT [dbo].[tblPaises] OFF
SET IDENTITY_INSERT [dbo].[tblSeries] ON 

INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (1, N'Breaking Bad', 1, 1, N'Vince Gilligan', CAST(N'2016-07-13' AS Date), N'Walter White (Bryan Cranston) es un profesor de química de cincuenta años que cuando era joven se especializó en cristalografía que es el estudio de la formación de cristales, por alguna razón Walter termina en una escuela preparatoria a pesar de su genio que lo lleva a tener problemas económicos. ', N'images/breakingbad.jpg', N'images/Miniaturas/breakingbad.jpg')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (2, N'House of Cards', 1, 1, N'Beau Willimon', CAST(N'2013-02-01' AS Date), N'El congresista estadounidense Francis Underwood y su esposa Claire no se detendrán ante nada para lograr sus propósitos. La historia de este drama político se adentra en un mundo repleto de avaricia, sexo y corrupción en la ciudad de Washington.', N'images/houseofcards.jpg', N'images/Miniaturas/houseofcards.jpg')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (3, N'Mr Robot', 1, 1, N'Sam Esmail', CAST(N'2015-06-24' AS Date), N'La serie sigue a Elliot (Rami Malek), un joven pirata informático que sufre algún tipo de trastorno, trabaja como ingeniero de seguridad informática y usa sus habilidades para proteger a las personas por las que se preocupa. Elliot es reclutado por Mr. Robot (Christian Slater), un misterioso líder de un grupo de piratas informáticos quien quiere destruir a poderosos empresarios de multinacionales que están manejando el mundo.', N'images/mrrobot.jpg', N'images/Miniaturas/mrrobot.jpg')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (4, N'Game of Thrones', 2, 1, N'George R. R. Martin', CAST(N'2011-04-17' AS Date), N'Game of Thrones es una novela de fantasía escrita por el autor estadounidense George R. R. Martin en 1996. Se trata de la primera entrega de la serie de gran popularidad Canción de hielo y fuego. La novela se caracteriza por su estética medieval, el uso de numerosos personajes bien detallados, la contraposición de puntos de vista de los múltiples protagonistas, su trama con giros inesperados y un uso sutil y moderado de los aspectos mágicos tan comunes en otras obras de fantasía.', N'images/gameofthrones.jpg', N'images/Miniaturas/gameofthrones.jpg')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (16, N'Vikings', 1, 1, N'Michael Hirst', CAST(N'2013-03-03' AS Date), N'Vikings está basada en las leyendas sobre el vikingo Ragnar Lodbrok, uno de los héroes más famosos de la cultura nórdica que saqueó Northumbria, Francia y Bretaña. La serie retrata a Lodbrok como guerrero curioso y navegante tecnológicamente innovador, ambicioso y rebelde, que hace construir un barco a su amigo Floki, para lanzarse a explorar los territorios al oeste de Escandinavia desobedeciendo al jefe tribal, el conde Haraldson, que ordena viajar hacia el este, como todos los años sucedía.', N'images/vikings.jpg', N'images/')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (17, N'Spartacus', 2, 1, N'Steven S. DeKnight', CAST(N'2010-01-22' AS Date), N'Spartacus es una serie de televisión que presenta, de manera novelada, la vida del famoso gladiador rebelde Espartaco. Allí también se muestra la vida y peripecias de sus compañeros gladiadores y de los romanos más próximos a Espartaco. Rodada en Nueva Zelanda, y producida por Steven S. DeKnight y Robert Tapert, la serie se transmitió por la cadena Starz del 22 de enero de 2010, hasta el 12 de abril de 2013.', N'images/Spartacus-3.jpg', N'images/')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (18, N'Once Upon a Time', 5, 1, N'Edward Kitsis Adam Horowitz', CAST(N'2011-10-22' AS Date), N'La serie se basa en la teoría de que existe un universo alterno donde todos los personajes de los clásicos cuentos de hadas existen, un mundo que tiene una conexión perdida con nuestro mundo, por lo que se centra en los personajes del Bosque Encantado y la conspiración de la Reina Malvada para perturbar la vida de los demás habitantes. Mediante una maldición, la Bruja envía a los personajes de los cuentos al pueblo de Storybrooke, Maine, donde todos ellos viven sin saber quiénes son en realidad, para que sea ella la única con un final feliz.

', N'images/Once_Upon_aTime_promo_image.jpg', N'images/')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (19, N'Silicon Valley', 4, 1, N'	Mike Judge', CAST(N'2014-04-06' AS Date), N'Richard Hendriks (Thomas Middleditch) es un programador solitario tímido que trabaja en una gran empresa de Internet llamada Hooli, mientras desarrolla una aplicación de música llamada Pied Piper en una compañía startup incubadora de empresas dirigida por el empresario Erlich Bachman (T.J. Miller). Después de un rocoso elevator pitch en el TED Richard muestra Pied Piper al capitalista de riesgo Peter Gregory (Christopher Evan Welch). Al día siguiente Hendriks también muestra su trabajo a un par de programadores en Hooli que se burlan de él. En cuestión de horas, sin embargo, el ejecutivo de Hooli Donald "Jared" Dunn (Zach Woods) y la asistente de Gregory, Mónica (Amanda Crew) están descubriendo que la aplicación contiene un revolucionario algoritmo de compresión de datos.', N'images/silicon.jpg', N'images/')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (20, N'Scorpion', 1, 1, N'Nick Santora', CAST(N'2014-09-27' AS Date), N'Se centra en la vida de Walter O''Brien, un excéntrico genio que participa en un grupo de mentes brillantes que conforma la última línea de defensa contra las amenazas a las que se enfrenta la humanidad en un mundo tan globalizado y tecnificado como el nuestro. El equipo de genios incluye a O''Brien, una de las personas más inteligentes del mundo con un CI de 197, Sylvester Dodd, la calculadora humana, Happy Quinn, la mecánica prodigio y Toby Curtis, un experto en conducta. Cabe Gallo es el agente del gobierno asignado al equipo y supervisor gubernamental del mismo. Paige Dineen, era una camarera con un don para relacionarse con la gente y les ayuda a comprender el mundo. A cambio, ellos le ayudan a comprender mejor a su hijo, el cual, también es un genio.', N'images/scorpion.jpg', N'images/')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (21, N'The Sopranos', 1, 1, N'	David Chase', CAST(N'2013-02-07' AS Date), N'Los Soprano ( en inglés The Sopranos) es una serie de televisión estadounidense creada y producida por David Chase. La serie se estrenó en Estados Unidos el 10 de enero de 1999 por el canal de televisión por cable HBO, que la emitió ininterrumpidamente hasta su desenlace, el 10 de junio de 2007. La trama de la serie gira en torno al mafioso de Nueva Jersey Tony Soprano (James Gandolfini) y las dificultades que enfrenta tanto en su hogar como en la organización criminal que dirige. A su vez, la serie también se centra en la historia de los personajes cercanos a Tony, especialmente su esposa Carmela (Edie Falco) y su sobrino y protegido Christopher Moltisanti (Michael Imperioli).', N'images/sopranos.jpg', N'images/')
INSERT [dbo].[tblSeries] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura]) VALUES (22, N'Lost', 6, 1, N'J. J. Abrams', CAST(N'2016-07-04' AS Date), N'Perdidos es una serie dramática que se centra en las vivencias de los "supervivientes" de un accidente aéreo en una isla desierta. Por lo general, cada episodio narra una historia principal que tiene lugar en la isla, intercalada con varios segmentos de una historia secundaria. Estos segmentos pueden ser flashbacks —predominante en las tres primeras temporadas—, flashforwards —a partir del final de la tercera temporada—,4 o «flash-sideways» —en la temporada final.', N'images/LOST.jpg', N'images/')
SET IDENTITY_INSERT [dbo].[tblSeries] OFF
INSERT [dbo].[tblSeriesDEL] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura], [UsuarioBaja], [FechaBaja]) VALUES (13, N'Test', 4, 1, N'Testa', CAST(N'2016-07-14' AS Date), N'asd', N'images/e9b82307527b9cb70806e7250eedc30f.jpg', N'images/', N'dk', CAST(N'2016-07-13 23:57:20.210' AS DateTime))
INSERT [dbo].[tblSeriesDEL] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura], [UsuarioBaja], [FechaBaja]) VALUES (14, N'Prueba', 4, 1, N'Prueba', CAST(N'2016-07-14' AS Date), N'asdasdasd', N'images/overwatch_agent_tracer-HD.jpg', N'images/', N'dk', CAST(N'2016-07-13 23:57:23.050' AS DateTime))
INSERT [dbo].[tblSeriesDEL] ([id], [Nombre], [idGenero], [idPais], [Creador], [Año], [Reseña], [Imagen], [Miniatura], [UsuarioBaja], [FechaBaja]) VALUES (15, N'Prueba', 3, 1, N'Prueba', CAST(N'2016-07-13' AS Date), N'asd', N'images/overwatch_agent_tracer-HD.jpg', N'images/', N'dk', CAST(N'2016-07-14 00:32:50.760' AS DateTime))
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (1, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (1, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (1, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (1, 4)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (1, 5)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (2, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (2, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (2, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (2, 4)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (3, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (4, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (4, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (4, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (4, 4)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (4, 5)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (4, 6)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (15, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (15, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (16, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (16, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (16, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (16, 4)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (17, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (17, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (17, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (18, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (18, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (18, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (18, 4)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (18, 5)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (19, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (19, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (19, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (20, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (20, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (21, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (21, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (21, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (21, 4)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (21, 5)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (21, 6)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (22, 1)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (22, 2)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (22, 3)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (22, 4)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (22, 5)
INSERT [dbo].[tblTemporadasXSerie] ([idSerie], [Temporada]) VALUES (22, 6)
SET IDENTITY_INSERT [dbo].[tblUsuarios] ON 

INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (1, N'dk', N'12345', 1, N'ctk.591@gmail.com', N'Diego Silvera')
INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (4, N'asd', N'12345', NULL, N'asd', N'asd')
INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (5, N'tamara', N'12345', NULL, N'iiuqwie', N'Tamara Herrera')
INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (6, N'tinchin', N'12345', NULL, N'email@mail.com', N'Martin Perez')
INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (7, N'Ramiro', N'12345', 2, N'email@email.com', N'Ramiro Montero')
INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (8, N'prueba', N'testa', 2, N'test@test.com', N'test test')
INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (9, N'ramiromatt', N'123456', 1, N'ramiro@hotmail.com', N'ramiro montero')
INSERT [dbo].[tblUsuarios] ([id], [Nickname], [Contraseña], [Tipo], [Email], [NombreApellido]) VALUES (1009, N'RocíoRegue', N'Rochioo1', 1, N'rochio.regue@gmail.com', N'Rocío Regue')
SET IDENTITY_INSERT [dbo].[tblUsuarios] OFF
/****** Object:  StoredProcedure [dbo].[SP_Capitulos_ABM]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Capitulos_ABM]
@id int = null,
@idSerie int,
@idTemporada int,
@idNumero int,
@Nombre varchar (100),
@Usuario varchar (100),
@Accion varchar (100)
as
DECLARE @Error varchar(100)
set @Error = ''
if @Accion in ('insertar', 'modificar')
begin
if @idSerie = '0'
set @Error = 'Seleccione una serie'
if @idTemporada = '0'
set @Error = 'Seleccione una temporada'
if @Nombre = ''
set @Error = 'Nombre no puede estar vacio'
if @Accion = 'insertar' and @Error = ''
begin
insert into tblCapitulos values(
@idSerie,
@idTemporada,
@idNumero,
@Nombre)
end
if @Accion = 'modificar' and @Error = ''
begin
update tblCapitulos set
Numero = @idNumero,
Nombre = @Nombre
where id = @id
end
if @Error = ''
select 'OK' as resultado
else select @Error as resultado
end
if @Accion = 'eliminar'
begin
DECLARE @UsuarioBaja int
select @UsuarioBaja = id from tblUsuarios where NickName = @Usuario
select @idSerie = idSerie, @idTemporada = Temporada, @idNumero = Numero from tblCapitulos where id = @id
insert into tblCapitulosDEL values(
@id,
@idSerie,
@idTemporada,
@idNumero,
@Nombre,
@UsuarioBaja,
getdate()
)
delete from tblCapitulos where id = @id
select 'OK' as resultado
end

GO
/****** Object:  StoredProcedure [dbo].[SP_Capitulos_Consultar]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SP_Capitulos_Consultar] 'conABM',null,'1'
CREATE procedure [dbo].[SP_Capitulos_Consultar]
@op varchar(20),
@id varchar (100) = null,
@idSerie varchar (100) = null,
@idTemporada varchar (100) = null,
@Numero varchar (100) = null,
@Nombre varchar (100) = null,
@Usuario varchar(100) = null
as
if @id = ''
set @id = null
if @idSerie = ''
set @idSerie = null
if @idTemporada = ''
set @idTemporada = null
if @Numero = ''
set @Numero = null
if @Nombre = ''
set @Nombre = null
if @op = 'con'
begin
Select id, Temporada, Numero, Nombre from tblCapitulos where idSerie = @idSerie and Temporada = @idTemporada
end
if @op = 'conABM'
begin
select tblCapitulos.id, ser.Nombre as Serie, Temporada, Numero, tblCapitulos.Nombre from tblCapitulos
inner join tblSeries ser on idSerie = ser.id
where (@id = tblCapitulos.id or @id is null)
and (@idSerie = idSerie or @idSerie is null)
and (@idTemporada = Temporada or @idTemporada is null)
and (@Numero = Numero or @Numero is null)
and (@Nombre = tblCapitulos.Nombre or @Nombre is null)
end
if @op = 'get'
begin
select id, idSerie, Temporada, Numero, Nombre from tblCapitulos where id = @id
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Capitulos_Listar]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Capitulos_Listar]
@Usuario varchar (100),
@Tipo varchar (100)
as
if lower(@Tipo) = 'series'
begin
select * from tblSeries
end
if lower(@Tipo) = 'temporadas'
begin
select * from tblTemporadasXSerie
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Comentarios_ABM]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Comentarios_ABM]
@id int = null,
@idNoticiaSerie int,
@Comentario varchar (500),
@Usuario varchar (500),
@Accion varchar (500)
as
DECLARE @Error varchar (100)
set @Error = ''

if @Comentario = ''
set @Error = 'Comentario vacio'

if @Accion = 'insertarNoticia'
begin
DECLARE @idUsuario int 
select @idUsuario = id from tblUsuarios where Nickname = @Usuario
insert into tblComentarios values(
@idUsuario,
@Comentario,
getdate()
)
select top 1 @id = id from tblComentarios order by id desc
insert into tblComentariosxNoticia values(
@idNoticiaSerie,
@id
)
end

if @Accion = 'insertarSerie'
begin
DECLARE @idUser int 
select @idUser = id from tblUsuarios where Nickname = @Usuario
insert into tblComentarios values(
@idUser,
@Comentario,
getdate()
)
select top 1 @id = id from tblComentarios order by id desc
insert into tblComentariosxSerie values(
@idNoticiaSerie,
@id
)
end

if @Error = ''
select 'OK' as resultado
else select @Error as resultado
GO
/****** Object:  StoredProcedure [dbo].[SP_Noticias_ABM]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Noticias_ABM]
@id int = null,
@Titulo varchar (500),
@Copete varchar(500),
@Contenido varchar(5000),
@Imagen varchar(100),
@Usuario varchar(100),
@Accion varchar (100)
as
DECLARE @Error varchar (100)
set @Error = ''
DECLARE @idUsuario int

select @idUsuario = id from tblUsuarios where NickName = @Usuario

--Validar si estan vacios
if @Accion in ('insertar', 'modificar')
begin
if @Titulo = ''
set @Error = 'Titulo no puede estar vacio'

if @Copete = ''
set @Error = 'Copete no puede estar vacio'

if @Contenido = ''
set @Error = 'Contenido no puede estar vacio'

if @Accion = 'insertar' and @Error = ''
begin
set @Imagen = 'images/' + @Imagen
insert into tblNoticias values(
@idUsuario,
@Titulo,
@Copete,
@Contenido,
@Imagen,
getdate()
)
end
if @Accion = 'modificar' and @Error = ''
begin
if @Imagen = ''
begin
update tblNoticias set
Titulo = @Titulo,
Copete = @Copete,
Contenido = @Contenido
where id = @id
end
else if @Imagen != ''
begin
set @Imagen = 'images/' + @Imagen
update tblNoticias set
Titulo = @Titulo,
Copete = @Copete,
Imagen = @Imagen,
Contenido = @Contenido
where id = @id
end
end
end
if @Accion = 'eliminar' and @Error = ''
begin
DECLARE @UsuarioAlta int
DECLARE @FechaAlta datetime
DECLARE @UsuarioBaja int
select @UsuarioBaja = id from tblUsuarios where NickName = @Usuario
select @Titulo = Titulo, @Copete = Copete, @Imagen = Imagen, @Contenido = Contenido, @UsuarioAlta = idUsuario, @FechaAlta = FechaPublicacion  from tblNoticias where id = @id
insert into tblNoticiasDEL values(
@id,
@Titulo,
@Copete,
@Imagen,
@Contenido,
@UsuarioAlta,
@FechaAlta,
@UsuarioBaja,
getdate()
)
delete from tblNoticias where id = @id
end
if @Error = ''
select 'OK' as resultado
else select @Error as resultado


GO
/****** Object:  StoredProcedure [dbo].[SP_Noticias_Consultar]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SP_Noticias_Consultar] 'arc','2','1'
CREATE procedure [dbo].[SP_Noticias_Consultar]
@op varchar(20),
@id int = null,
@titulo varchar (500) = null,
@copete varchar (500) = null,
@imagen varchar (100) = null,
@contenido varchar (5000) = null
as
if @op = 'side'
begin
Select id, Titulo, datediff(second, FechaPublicacion, getdate()) as FechaPublicacion from tblNoticias order by id desc
end
if @op = 'ult'
begin
select top (1) id, Titulo, Copete, left(Contenido,300) + '...' as Contenido, Imagen, datediff(second, FechaPublicacion, getdate()) as FechaPublicacion from tblNoticias order by id desc
end
if @op = 'getShort'
begin
select id, Titulo, Copete, left(Contenido,300) + '...' as Contenido, Imagen, datediff(second, FechaPublicacion, getdate()) as FechaPublicacion from tblNoticias where id = @id
end
if @op = 'get'
begin
select id, Titulo, Copete, Contenido, Imagen, datediff(second, FechaPublicacion, getdate()) as FechaPublicacion from tblNoticias where id = @id
end
if @op = 'arc'
begin
declare @identificador int
select top (1) @identificador = id from tblNoticias order by id desc
select top (5) id, Titulo, datediff(second, FechaPublicacion, getdate()) as FechaPublicacion from tblNoticias where id < @identificador order by id desc
end
if @op = 'con'
begin
select id, left(Titulo,30) + '...' as Titulo, left(Copete,30) + '...' as Copete, Imagen, left(Contenido,30) + '...' as Contenido from tblNoticias
where (@titulo = Titulo or @Titulo is null)
and (@copete = Copete or @copete is null)
and (@imagen = Imagen or @imagen is null)
and (@contenido = Contenido or @contenido is null)
end
if @op = 'getCom'
begin
select idComentario, com.Comentario, us.NickName, datediff(second, com.Fecha, getdate()) as Fecha from tblComentariosxNoticia
left join tblComentarios com on idComentario = com.id
left join tblUsuarios us on idUsuario = us.id
where idNoticia = @id
end
if @op = 'cantCom'
begin
select count(idComentario) as cantidadComentarios from tblComentariosxNoticia where idNoticia = @id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Series_ABM]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Series_ABM]
@id int = null,
@Nombre varchar (100),
@Genero int,
@Pais int,
@Creador varchar (100),
@Año varchar(20),
@Reseña varchar(1500),
@Imagen varchar(100),
@Miniatura varchar(100),
@Accion varchar(100),
@Usuario varchar (100)
as
DECLARE @Error varchar(100)
set @Error = ''
if @Accion in ('insertar', 'modificar')
begin
--Validar si estan vacios
if @Nombre = ''
set @Error = 'Nombre no puede estar vacio'
if @Genero = '0'
set @Error = 'Seleccione un genero'
if @Pais = '0'
set @Error = 'Seleccione un pais'
if @Creador = ''
set @Error = 'Creador no puede estar vacio'
if @Año = ''
set @Error = 'Fecha no puede estar vacia'
if @Reseña = ''
set @Error = 'Reseña no puede estar vacia'
--Validar contenido
if isdate(@Año) != 1
set @Error = 'Formato de fecha incorrecto'
if @Accion = 'insertar'
begin
set @Imagen = 'images/' + @Imagen
set @Miniatura = 'images/' + @Miniatura
insert into tblSeries values(
@Nombre,
@Genero,
@Pais,
@Creador,
@Año,
@Reseña,
@Imagen,
@Miniatura
)
end
else if @Accion = 'modificar'
begin
if @Imagen = '' and @Miniatura = ''
begin
update tblSeries set
Nombre = @Nombre,
idGenero = @Genero,
idPais = @Pais,
Creador = @Creador,
Año = @Año,
Reseña = @Reseña
where id = @id
end
else if @Imagen != '' and @Miniatura = ''
begin
set @Imagen = 'images/' + @Imagen
update tblSeries set
Nombre = @Nombre,
idGenero = @Genero,
idPais = @Pais,
Creador = @Creador,
Año = @Año,
Reseña = @Reseña,
Imagen = @Imagen
where id = @id
end
else if @Imagen != '' and @Miniatura != ''
begin
set @Imagen = 'images/' + @Imagen
set @Miniatura = 'images/' + @Miniatura
update tblSeries set
Nombre = @Nombre,
idGenero = @Genero,
idPais = @Pais,
Creador = @Creador,
Año = @Año,
Reseña = @Reseña,
Imagen = @Imagen
where id = @id
end
else if @Imagen = '' and @Miniatura != ''
begin
set @Miniatura = 'images/' + @Miniatura
update tblSeries set
Nombre = @Nombre,
idGenero = @Genero,
idPais = @Pais,
Creador = @Creador,
Año = @Año,
Reseña = @Reseña,
Miniatura = @Miniatura
where id = @id
end
end
end
if @Accion = 'eliminar'
begin
select @id = id, @Nombre = Nombre, @Genero = idGenero, @Pais = idPais, @Creador = Creador, @Año = Año, @Reseña = Reseña, @Imagen = Imagen, @Miniatura = Miniatura from tblSeries where id = @id
delete from tblSeries where id = @id
insert into tblSeriesDEL values(
@id,
@Nombre,
@Genero,
@Pais,
@Creador,
@Año,
@Reseña,
@Imagen,
@Miniatura,
@Usuario,
getdate()
)
end
if @Error = ''
select 'OK' as resultado
else select @Error as resultado

GO
/****** Object:  StoredProcedure [dbo].[SP_Series_Consultar]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SP_Series_Consultar] 'side','2','','','','','','1'
CREATE procedure [dbo].[SP_Series_Consultar]
@op varchar(20),
@id int = null,
@Nombre varchar (100) = null,
@Genero int = null,
@Pais int = null,
@Creador varchar (100) = null,
@Año date = null,
@Reseña varchar(1500) = null,
@Imagen varchar(100) = null,
@Miniatura varchar(100) = null,
@Usuario varchar(100) = null
as
if @id = ''
set @id = null
if @op = 'side'
begin
Select id, Nombre, left(Reseña, 100) + '...' as Reseña from tblSeries
end
if @op = 'con'
begin
--[SP_Series_Consultar] 'con'
Select tblSeries.id, Nombre, (select count(Temporada) from tblTemporadasXSerie where idSerie = tblSeries.id) as Temporadas, gen.Descripcion as Genero, pa.Descripcion as Pais, Creador, Convert(varchar(10),CONVERT(date,Año,106),103) as Año, case when len(Reseña) > 20 then left(Reseña, 20) + '...' else Reseña end as Reseña, Imagen, Miniatura from tblSeries
left join tblGeneros gen on idGenero = gen.id
left join tblPaises pa on idPais = pa.id
where (@id = tblSeries.id or @id is null)
and (@Nombre = Nombre or @Nombre is null)
and (@Genero = idGenero or @Genero is null)
and (@Pais = idPais or @Pais is null)
and (@Creador = Creador or @Creador is null)
and (@Año = Año or @Año is null)
and (@Reseña = Reseña or @Reseña is null)
end
if @op = 'top'
begin
Select top(4) * from tblSeries
end
if @op = 'getOne'
begin
select id, Nombre, (select count(Temporada) from tblTemporadasXSerie where idSerie = @id) as Temporadas, idGenero, idPais, Creador, Convert(varchar(10),CONVERT(date,Año,106),103) as Año, Reseña, Imagen, Miniatura from tblSeries where id = @id
end
if @op = 'get'
begin
Select tblSeries.id, Nombre, (select count(Temporada) from tblTemporadasXSerie where idSerie = @id) as Temporadas, gen.Descripcion as Genero, pa.Descripcion as Pais, Creador, Año, Reseña, Imagen, Miniatura from tblSeries
left join tblGeneros gen on idGenero = gen.id
left join tblPaises pa on idPais = pa.id
where tblSeries.id = @id
end
if @op = 'getCom'
begin
select idComentario, com.Comentario, us.NickName, datediff(second, com.Fecha, getdate()) as Fecha from tblComentariosxSerie
inner join tblComentarios com on idComentario = com.id
inner join tblUsuarios us on idUsuario = us.id
where idSerie = @id
end
if @op = 'cantCom'
begin
select count(idComentario) as cantidadComentarios from tblComentariosxSerie where idSerie = @id
end



GO
/****** Object:  StoredProcedure [dbo].[SP_Series_Listar]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Series_Listar]
@Usuario varchar (100),
@Tipo varchar (100)

as
begin
if lower(@Tipo) = 'generos'
begin
select * from tblGeneros
end
if lower(@Tipo) = 'paises'
begin
select * from tblPaises
end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Temporadas_ABM]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Temporadas_ABM]
@idSerie int,
@idTemporada int,
@Accion varchar (100),
@Usuario varchar (100)
as
DECLARE @Error varchar (100)
set @Error = ''

if @Accion in ('insertar')
begin
insert into tblTemporadasXSerie values(
@idSerie,
@idTemporada
)

if @Error = ''
select 'OK' as 'resultado'
else select @Error AS 'resultado'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Temporadas_Consultar]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SP_Series_Consultar] 'side','2','','','','','','1'
CREATE procedure [dbo].[SP_Temporadas_Consultar]
@op varchar(20),
@idSerie int = null
as
if @idSerie = ''
set @idSerie = null
if @op = 'con'
begin
Select Temporada from tblTemporadasXSerie where idSerie = @idSerie
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Usuarios_ABM]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Usuarios_ABM]
@User varchar(100),
@Password varchar(100),
@NombreApellido varchar(100) = null,
@Email varchar(100) = null,
@op varchar(100)
as
DECLARE @Error varchar(100)
set @Error = ''
--Validar contenido
if @op = 'insertar'
begin
if exists(select Nickname from tblUsuarios where Nickname = @User)
begin
set @Error = 'El nombre de usuario ya existe'
end
if len(@Password) < 5
set @Error = 'La contraseña debe tener un mínimo de 5 caracteres'
if exists(select Email from tblUsuarios where Email = @Email)
begin
set @Error = 'El email ingresado ya está asignado a una cuenta'
end
if @User = ''
set @Error = 'Campo Usuario no puede estar vacio'
if @Password = ''
set @Error = 'Campo contraseña no puede estar vacio'
if @NombreApellido = ''
set @Error = 'Campo Nombre y apellido no puede estar vacio'
if @Email = ''
set @Error = 'Campo Email no puede estar vacio'
end
if @op = 'modificar'
begin
if @Password = ''
set @Error = 'Campo contraseña no puede estar vacio'
end
if @op = 'insertar' and @Error = ''
begin
insert into tblUsuarios(
Nickname,
Contraseña,
NombreApellido,
Email,
Tipo
)
values(
@User,
@Password,
@NombreApellido,
@Email,
2
)
end
if @op = 'modificar' and @Error = ''
begin
update tblUsuarios set
Contraseña = @Password
where Nickname = @User
end

if @Error = ''
select 'OK!' as resultado
else select @Error as resultado


GO
/****** Object:  StoredProcedure [dbo].[SP_Usuarios_Iniciar]    Script Date: 21/07/2016 6:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Usuarios_Iniciar]
@User varchar (100),
@Password varchar (100) = null,
@op varchar (100)
as
DECLARE @Contraseña varchar (100)
if @op = 'login'
begin
if exists(select Nickname from tblUsuarios where Nickname = @User)
begin
select @Contraseña = Contraseña from tblUsuarios where Nickname = @User
if @Contraseña = @Password
begin
select 'OK' as resultado
end
else
select 'Contraseña invalida' as resultado 
end
else
select 'Usuario inexistente' as resultado
end
if @op = 'permisos'
begin
select Tipo from tblUsuarios where Nickname = @User
end


GO
USE [master]
GO
ALTER DATABASE [SilverMont_Series] SET  READ_WRITE 
GO
