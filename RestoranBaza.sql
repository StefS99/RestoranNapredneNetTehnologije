USE [master]
GO
/****** Object:  Database [RestoranNapredneNet]    Script Date: 12.02.2024. 03.10.15 ******/
CREATE DATABASE [RestoranNapredneNet]
GO
ALTER DATABASE [RestoranNapredneNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RestoranNapredneNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestoranNapredneNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestoranNapredneNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestoranNapredneNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestoranNapredneNet] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RestoranNapredneNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestoranNapredneNet] SET  MULTI_USER 
GO
ALTER DATABASE [RestoranNapredneNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestoranNapredneNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestoranNapredneNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestoranNapredneNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestoranNapredneNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestoranNapredneNet] SET QUERY_STORE = OFF
GO
USE [RestoranNapredneNet]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [RestoranNapredneNet]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](max) NULL,
	[Prezime] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jela]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jela](
	[JeloId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[TipJela] [nvarchar](max) NULL,
	[KuvarId] [int] NOT NULL,
	[Slika] [nvarchar](max) NULL,
	[CenaJela] [float] NULL,
	[OpisJela] [nvarchar](max) NULL,
 CONSTRAINT [PK_Jela] PRIMARY KEY CLUSTERED 
(
	[JeloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JeloPorudzbina]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JeloPorudzbina](
	[JelaJeloId] [int] NOT NULL,
	[PorudzbinePorudzbinaId] [int] NOT NULL,
 CONSTRAINT [PK_JeloPorudzbina] PRIMARY KEY CLUSTERED 
(
	[JelaJeloId] ASC,
	[PorudzbinePorudzbinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kuvari]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kuvari](
	[KuvarId] [int] IDENTITY(1,1) NOT NULL,
	[KuvarIme] [nvarchar](max) NULL,
	[KuvarPrezime] [nvarchar](max) NULL,
	[DatumRodjenja] [datetime2](7) NULL,
	[Specijalnost] [nvarchar](max) NULL,
	[Slika] [nvarchar](max) NULL,
 CONSTRAINT [PK_Kuvari] PRIMARY KEY CLUSTERED 
(
	[KuvarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PorudzbinaUser]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PorudzbinaUser](
	[PorudzbinaId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DatumPorudzbine] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PorudzbinaUser] PRIMARY KEY CLUSTERED 
(
	[PorudzbinaId] ASC,
	[UserId] ASC,
	[DatumPorudzbine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Porudzbine]    Script Date: 12.02.2024. 03.10.15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Porudzbine](
	[PorudzbinaId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[Cena] [float] NULL,
	[Slika] [nvarchar](max) NULL,
	[Datum] [datetime2](7) NULL,
	[Adresa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Porudzbine] PRIMARY KEY CLUSTERED 
(
	[PorudzbinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240112200610_InitialMigration', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240118205808_AddedCenaJelaAtribut', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240118233545_AddedSlikaKuvar', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240129203713_AddedOpisJela', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240129220024_AddedAdresaPorucioca', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240129220820_AddedAdresa', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240208165321_AddedSlikaInsteadImagePath', N'8.0.1')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'Admin', N'ADMIN', N'49dde383-9526-44f8-94bc-d00e47a94af3')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'Kupac', N'KUPAC', N'ad4c-8693f3f131ff')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (8, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (9, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (10, 2)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Ime], [Prezime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (3, N'Stefan', N'Simic', N'stef', N'STEF', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEI142NNSEbBC45KHhOiilg/1u6QoUtB+hwagD/fZ+3BB3YuK4RSc3PadVXDxtQBfnw==', N'APGHMFQ5UOFZXLQXEY7YHMLL33WB35LN', N'47181d48-9df9-454f-bc21-280547e3ff91', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Ime], [Prezime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (8, N'Milan', N'Milić', N'milan', N'MILAN', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEK4W2sPUnR6evuHfUFi2HDNmza620xkf+bQNxqREaHFV3gGG5ES7u8RmRqrfJi0aqA==', N'2MNXHMNQQHMJIFNGSVAGOS7OHL52JHLS', N'5a95557f-7654-40f8-9475-03ffe7b75666', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Ime], [Prezime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (9, N'Petar', N'Petrović', N'petar', N'PETAR', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEOnbJlto49jBdUiBEbf/pNeEHkQblxjvUKHJaec/5iyfitR1okqVLNdgV8duYVzKnA==', N'GBG5YJHPL2XJ4NYZSMDRSOLZ5KJZ5C6I', N'29f9745c-3192-43c8-bb8f-ac25a612bf56', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Ime], [Prezime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (10, N'Miodrag', N'Rakić', N'miodrag', N'MIODRAG', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEN4LrtPeFQSnhp8oBK1t5QKdj6QZLmBq2PBUjf663UyrLfl26cBlFf1bSBlaHaHERQ==', N'G47N2LNOQJCOD5HJTXECEGNCPPR4CGNH', N'ae64242d-149b-4995-9968-8dfd97f5f832', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Jela] ON 

INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (21, N'Božićna čarolija', N'Slatki specijaliteti', 7, N'assets\img\menu21.png', 650, N'Slatko lisnato testo sa belim krenom, ribizlom i jestivom dekoracijom od šećera.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (26, N'Voćni desert', N'Slatki specijaliteti', 11, N'assets\img\menu26.png', 600, N'Voćni spoj borovnice, banane i manga sa mrvicama cimeta.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (31, N'Ćufte sa špagetama', N'Glavna jela', 13, N'assets\img\menu31.png', 800, N'Teleće ćufte sa špagetama, prelivene paradajz sosom i parmezanom.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (32, N'Voćna salata', N'Salate', 9, N'assets\img\menu32.png', 550, N'Salata sa kolutovima manga, pomorandže, borovnice i indijskog oraha.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (33, N'Riža sa piletinom', N'Predjela', 8, N'assets\img\menu33.png', 550, N'Riža sa piletinom i tikvicama.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (34, N'Cezar salata', N'Salate', 9, N'assets\img\menu34.jpg', 600, N'Cezar salata sastoji se od rimske zelene salate, krutona, prepečene slanine, grilovane piletine iseckane na komade, dresinga i parmezana posutoh po vrhu.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (35, N'Torta na sprat', N'Slatki specijaliteti', 7, N'assets\img\menu35.jpg', 800, N'Torta sa osnovom i spratom od plazme, spojena šlagom, prelivena džemom od kajsija i  sa narom na vrhu.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (36, N'Mozzarella', N'Predjela', 9, N'assets\img\menu36.jpg', 550, N'Mozzarela sa paprikom i paradajzom.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (37, N'Kuvani jastog', N'Glavna jela', 10, N'assets\img\menu37.jpg', 2500, N'Kuvani jastog sa limunom.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (38, N'Rolat od jastoga', N'Glavna jela', 10, N'assets\img\menu38.jpg', 3000, N'Napravljen je od mesa jastoga koji se servira na pečenoj lepinji u stilu hot dog-a . Punjenje može da sadrži i puter, limunov sok, so i crni biber.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (39, N'Vrt povrća', N'Salate', 9, N'assets\img\menu39.jpg', 500, N'Salata sa šargarepom, paradajzom, krastavcima, rotkvicama, peršunom, zelenom salatom i crvenim kupusom.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (40, N'Mešano roštiljsko meso', N'Glavna jela', 6, N'assets\img\menu40.jpg', 900, N'U ovu mešavinu idu 5 ćevapa, pljeskavica 200g i 200g belog mesa.')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (41, N'Ražani hleb', N'Predjela', 12, N'assets\img\menu41.jpg', 250, N'Ražani, fino pečeni hleb 100g')
INSERT [dbo].[Jela] ([JeloId], [Naziv], [TipJela], [KuvarId], [Slika], [CenaJela], [OpisJela]) VALUES (42, N'Grčka salata', N'Salate', 14, N'assets\img\menu42.jpg', 450, N'Grčka salata je napravljena sa komadima paradajza, krastavaca, narezanog luka, feta sira, i maslinama (obično kalamata masline), obično začinjene solju i origanom, i prelivena maslinovim uljem. Mogu da se koriste i kriške zelenih paprika.')
SET IDENTITY_INSERT [dbo].[Jela] OFF
GO
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (21, 15)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (36, 15)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (39, 15)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (40, 15)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (41, 15)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (21, 16)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (35, 16)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (26, 17)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (31, 17)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (39, 17)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (34, 18)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (37, 18)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (40, 20)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (41, 20)
INSERT [dbo].[JeloPorudzbina] ([JelaJeloId], [PorudzbinePorudzbinaId]) VALUES (42, 20)
GO
SET IDENTITY_INSERT [dbo].[Kuvari] ON 

INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (6, N'Novak', N'Petrović', CAST(N'1980-02-17T12:12:00.0000000' AS DateTime2), N'Meso i roštiljski specijaliteti', N'assets\img\chefs\chefs-11.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (7, N'Lidija', N'Marić', CAST(N'1990-02-12T12:12:00.0000000' AS DateTime2), N'Kolači i slatka peciva', N'assets\img\chefs\chefs-21.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (8, N'Ilija', N'Rašović', CAST(N'1984-11-20T03:05:00.0000000' AS DateTime2), N'Japanska i kineska kuhinja', N'assets\img\chefs\chefs-31.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (9, N'Milena', N'Popović', CAST(N'1996-07-31T23:21:00.0000000' AS DateTime2), N'Mediteranske i voćne salate', N'assets\img\chefs\chefs-41.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (10, N'Aleksa', N'Stojić', CAST(N'1997-07-04T12:12:00.0000000' AS DateTime2), N'Riba i morski plodovi', N'assets\img\chefs\chefs-51.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (11, N'Jovana', N'Ranković', CAST(N'1999-10-23T12:12:00.0000000' AS DateTime2), N'Torte i voćni kolači', N'assets\img\chefs\chefs-61.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (12, N'Dušan', N'Kovačević', CAST(N'1996-11-02T04:12:00.0000000' AS DateTime2), N'Testa i peciva', N'assets\img\chefs\chefs-71.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (13, N'Marko', N'Stefanović', CAST(N'1999-09-16T04:23:00.0000000' AS DateTime2), N'Čorbe sa mesom i testeninom', N'assets\img\chefs\chefs-81.jpg')
INSERT [dbo].[Kuvari] ([KuvarId], [KuvarIme], [KuvarPrezime], [DatumRodjenja], [Specijalnost], [Slika]) VALUES (14, N'Aleksandra', N'Bojanić', CAST(N'1993-06-12T01:05:00.0000000' AS DateTime2), N'Mediteranska predjela i salate', N'assets\img\chefs\chefs-91.jpg')
SET IDENTITY_INSERT [dbo].[Kuvari] OFF
GO
INSERT [dbo].[PorudzbinaUser] ([PorudzbinaId], [UserId], [DatumPorudzbine]) VALUES (15, 8, CAST(N'2024-02-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[PorudzbinaUser] ([PorudzbinaId], [UserId], [DatumPorudzbine]) VALUES (16, 8, CAST(N'2024-03-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[PorudzbinaUser] ([PorudzbinaId], [UserId], [DatumPorudzbine]) VALUES (17, 9, CAST(N'2024-02-17T12:00:00.0000000' AS DateTime2))
INSERT [dbo].[PorudzbinaUser] ([PorudzbinaId], [UserId], [DatumPorudzbine]) VALUES (18, 9, CAST(N'2024-01-22T12:40:00.0000000' AS DateTime2))
INSERT [dbo].[PorudzbinaUser] ([PorudzbinaId], [UserId], [DatumPorudzbine]) VALUES (20, 10, CAST(N'2024-02-22T13:15:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Porudzbine] ON 

INSERT [dbo].[Porudzbine] ([PorudzbinaId], [Naziv], [Cena], [Slika], [Datum], [Adresa]) VALUES (15, N'Dnevni obrok', 3150, N'assets\img\menu36.jpg', CAST(N'2024-02-20T07:00:00.0000000' AS DateTime2), N'Milosa Trebinjca 2, Pančevo')
INSERT [dbo].[Porudzbine] ([PorudzbinaId], [Naziv], [Cena], [Slika], [Datum], [Adresa]) VALUES (16, N'Slatki užitak', 1750, N'assets\img\menu21.png', CAST(N'2024-02-15T18:20:00.0000000' AS DateTime2), N'Milosa Trebinjca 2, Pančevo')
INSERT [dbo].[Porudzbine] ([PorudzbinaId], [Naziv], [Cena], [Slika], [Datum], [Adresa]) VALUES (17, N'Ručak sa poslasticom', 2200, N'assets\img\menu39.jpg', CAST(N'2024-02-17T12:00:00.0000000' AS DateTime2), N'Jovana Ristića 1, Beograd')
INSERT [dbo].[Porudzbine] ([PorudzbinaId], [Naziv], [Cena], [Slika], [Datum], [Adresa]) VALUES (18, N'Morski plodovi', 3400, N'assets\img\menu37.jpg', CAST(N'2024-02-19T12:40:00.0000000' AS DateTime2), N'Jovana Ristića 1, Beograd')
INSERT [dbo].[Porudzbine] ([PorudzbinaId], [Naziv], [Cena], [Slika], [Datum], [Adresa]) VALUES (20, N'Mediteranska kuhinja sa mesom', 1900, N'assets\img\menu42.jpg', CAST(N'2024-02-22T13:15:00.0000000' AS DateTime2), N'Kneza Mihaila 10, Beograd')
SET IDENTITY_INSERT [dbo].[Porudzbine] OFF
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jela_KuvarId]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [IX_Jela_KuvarId] ON [dbo].[Jela]
(
	[KuvarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JeloPorudzbina_PorudzbinePorudzbinaId]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [IX_JeloPorudzbina_PorudzbinePorudzbinaId] ON [dbo].[JeloPorudzbina]
(
	[PorudzbinePorudzbinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PorudzbinaUser_UserId]    Script Date: 12.02.2024. 03.10.16 ******/
CREATE NONCLUSTERED INDEX [IX_PorudzbinaUser_UserId] ON [dbo].[PorudzbinaUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Jela]  WITH CHECK ADD  CONSTRAINT [FK_Jela_Kuvari_KuvarId] FOREIGN KEY([KuvarId])
REFERENCES [dbo].[Kuvari] ([KuvarId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Jela] CHECK CONSTRAINT [FK_Jela_Kuvari_KuvarId]
GO
ALTER TABLE [dbo].[JeloPorudzbina]  WITH CHECK ADD  CONSTRAINT [FK_JeloPorudzbina_Jela_JelaJeloId] FOREIGN KEY([JelaJeloId])
REFERENCES [dbo].[Jela] ([JeloId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JeloPorudzbina] CHECK CONSTRAINT [FK_JeloPorudzbina_Jela_JelaJeloId]
GO
ALTER TABLE [dbo].[JeloPorudzbina]  WITH CHECK ADD  CONSTRAINT [FK_JeloPorudzbina_Porudzbine_PorudzbinePorudzbinaId] FOREIGN KEY([PorudzbinePorudzbinaId])
REFERENCES [dbo].[Porudzbine] ([PorudzbinaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JeloPorudzbina] CHECK CONSTRAINT [FK_JeloPorudzbina_Porudzbine_PorudzbinePorudzbinaId]
GO
ALTER TABLE [dbo].[PorudzbinaUser]  WITH CHECK ADD  CONSTRAINT [FK_PorudzbinaUser_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PorudzbinaUser] CHECK CONSTRAINT [FK_PorudzbinaUser_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PorudzbinaUser]  WITH CHECK ADD  CONSTRAINT [FK_PorudzbinaUser_Porudzbine_PorudzbinaId] FOREIGN KEY([PorudzbinaId])
REFERENCES [dbo].[Porudzbine] ([PorudzbinaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PorudzbinaUser] CHECK CONSTRAINT [FK_PorudzbinaUser_Porudzbine_PorudzbinaId]
GO
USE [master]
GO
ALTER DATABASE [RestoranNapredneNet] SET  READ_WRITE 
GO
