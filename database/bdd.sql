USE [master]
GO
/****** Object:  Database [Reservation]    Script Date: 03/07/2025 10:59:03 ******/
CREATE DATABASE [Reservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Reservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Reservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Reservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Reservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Reservation] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Reservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Reservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Reservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Reservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Reservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Reservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Reservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Reservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Reservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Reservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Reservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Reservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Reservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Reservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Reservation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Reservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Reservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Reservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Reservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Reservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Reservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Reservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Reservation] SET RECOVERY FULL 
GO
ALTER DATABASE [Reservation] SET  MULTI_USER 
GO
ALTER DATABASE [Reservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Reservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Reservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Reservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Reservation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Reservation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Reservation', N'ON'
GO
ALTER DATABASE [Reservation] SET QUERY_STORE = ON
GO
ALTER DATABASE [Reservation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Reservation]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 03/07/2025 10:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](100) NOT NULL,
	[ville] [nvarchar](100) NOT NULL,
	[adresse] [nvarchar](255) NOT NULL,
	[prix] [decimal](10, 2) NOT NULL,
	[periodedispo] [nvarchar](100) NULL,
	[imageUrl] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 03/07/2025 10:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoomID] [int] NULL,
	[CheckInDate] [date] NOT NULL,
	[CheckOutDate] [date] NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 03/07/2025 10:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[HotelID] [int] NULL,
	[RoomType] [nvarchar](50) NULL,
	[PricePerNight] [decimal](10, 2) NULL,
	[IsAvailable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/07/2025 10:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Hotels] ON 

INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (1, N'Hotel Central', N'Marrakech', N'12 rue de la Paix', CAST(120.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Hotel+Central')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (2, N'Riad El Fenn', N'Marrakech', N'2 Derb Moulay Abdellah Ben Hezzian, Medina', CAST(220.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Riad+El+Fenn')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (3, N'Kenzi Tower Hotel', N'Casablanca', N'Twin Center, Boulevard Zerktouni', CAST(180.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Kenzi+Tower+Hotel')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (4, N'Hotel Sahrai', N'Fès', N'Bab Lghoul, Dhar El Mehraz', CAST(200.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Hotel+Sahrai')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (5, N'Sofitel Agadir Royal Bay', N'Agadir', N'Baie des Palmiers, Cité Founty P4', CAST(170.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Sofitel+Agadir+Royal+Bay')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (6, N'Palais Faraj Suites & Spa', N'Fès', N'16-18 Quartier Ziat, Derb Bensouda', CAST(240.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Palais+Faraj+Suites+&+Spa')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (7, N'Riad Yasmine', N'Marrakech', N'209 Rue Ank Jemel, Bab Taghzout', CAST(160.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Riad+Yasmine')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (8, N'Barceló Anfa Casablanca', N'Casablanca', N'44 Boulevard d’Anfa', CAST(190.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Barceló+Anfa+Casablanca')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (9, N'Atlas Sky Airport Hotel', N'Nouaceur', N'Zone aéroport Mohammed V', CAST(130.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Atlas+Sky+Airport+Hotel')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (10, N'Villa Maroc', N'Essaouira', N'10 Rue Abdellah Ben Yassine', CAST(150.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Villa+Maroc')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (11, N'Hotel ibis Oujda', N'Oujda', N'Bd Zerktouni, Place de la Gare', CAST(95.00 AS Decimal(10, 2)), NULL, N'https://via.placeholder.com/200x130?text=Hotel+ibis+Oujda')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (12, N'Hôtel Atlas', N'Marrakech', N'Rue Mohammed V, Gueliz', CAST(750.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-15', N'https://example.com/atlas.jpg')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (13, N'Riad Bahia', N'Fès', N'Quartier El Bali', CAST(650.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-30', N'https://example.com/bahia.jpg')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (14, N'Sofitel Jardin des Roses', N'Rabat', N'Avenue Imam Malek, Souissi', CAST(1200.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-09-01', N'https://example.com/sofitel.jpg')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (15, N'Hôtel Toubkal', N'Casablanca', N'Rue Sidi Belyout', CAST(900.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://example.com/toubkal.jpg')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (16, N'Kenzi Solazur', N'Tanger', N'Avenue Mohamed VI', CAST(800.00 AS Decimal(10, 2)), N'2025-07-15 au 2025-09-15', N'https://example.com/solazur.jpg')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (17, N'Hôtel Les Jardins de Marrakech', N'Marrakech', N'Avenue Mohammed VI, Marrakech', CAST(850.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-15', N'https://via.placeholder.com/200x130?text=Jardins+Marrakech')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (18, N'Riad El Fès', N'Fès', N'12 Derb El Miter, Fès Medina', CAST(700.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-25', N'https://via.placeholder.com/200x130?text=Riad+Fes')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (19, N'Hôtel Casablanca Center', N'Casablanca', N'Boulevard Zerktouni, Casablanca', CAST(950.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Casablanca+Center')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (20, N'Palais Bleu Chefchaouen', N'Chefchaouen', N'Rue Targui, Chefchaouen', CAST(600.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-20', N'https://via.placeholder.com/200x130?text=Palais+Chefchaouen')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (21, N'Atlas Essaouira & Spa', N'Essaouira', N'Boulevard Mohammed V, Essaouira', CAST(1100.00 AS Decimal(10, 2)), N'2025-07-15 au 2025-09-05', N'https://via.placeholder.com/200x130?text=Atlas+Essaouira')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (22, N'Kenzi Tower Hotel', N'Casablanca', N'Twin Center, Casablanca', CAST(1200.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-30', N'https://via.placeholder.com/200x130?text=Kenzi+Tower')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (23, N'Hôtel Ifrane Palace', N'Ifrane', N'Place Atlas, Ifrane', CAST(650.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-10', N'https://via.placeholder.com/200x130?text=Ifrane+Palace')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (24, N'Riad Tanger Medina', N'Tanger', N'Rue de la Kasbah, Tanger', CAST(750.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-08-25', N'https://via.placeholder.com/200x130?text=Riad+Tanger')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (25, N'La Sultana Oualidia', N'Oualidia', N'Plage de Oualidia', CAST(1300.00 AS Decimal(10, 2)), N'2025-07-20 au 2025-09-10', N'https://via.placeholder.com/200x130?text=Sultana+Oualidia')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (26, N'Sofitel Rabat Jardin des Roses', N'Rabat', N'Avenue Imam Malik, Rabat', CAST(1400.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Sofitel+Rabat')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (27, N'Hôtel Les Jardins de Marrakech', N'Marrakech', N'Avenue Mohammed VI, Marrakech', CAST(850.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-15', N'https://via.placeholder.com/200x130?text=Jardins+Marrakech')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (28, N'Riad El Fès', N'Fès', N'12 Derb El Miter, Fès Medina', CAST(700.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-25', N'https://via.placeholder.com/200x130?text=Riad+Fes')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (29, N'Hôtel Casablanca Center', N'Casablanca', N'Boulevard Zerktouni, Casablanca', CAST(950.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Casablanca+Center')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (30, N'Palais Bleu Chefchaouen', N'Chefchaouen', N'Rue Targui, Chefchaouen', CAST(600.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-20', N'https://via.placeholder.com/200x130?text=Palais+Chefchaouen')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (31, N'Atlas Essaouira & Spa', N'Essaouira', N'Boulevard Mohammed V, Essaouira', CAST(1100.00 AS Decimal(10, 2)), N'2025-07-15 au 2025-09-05', N'https://via.placeholder.com/200x130?text=Atlas+Essaouira')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (32, N'Kenzi Tower Hotel', N'Casablanca', N'Twin Center, Casablanca', CAST(1200.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-30', N'https://via.placeholder.com/200x130?text=Kenzi+Tower')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (33, N'Hôtel Ifrane Palace', N'Ifrane', N'Place Atlas, Ifrane', CAST(650.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-10', N'https://via.placeholder.com/200x130?text=Ifrane+Palace')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (34, N'Riad Tanger Medina', N'Tanger', N'Rue de la Kasbah, Tanger', CAST(750.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-08-25', N'https://via.placeholder.com/200x130?text=Riad+Tanger')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (35, N'La Sultana Oualidia', N'Oualidia', N'Plage de Oualidia', CAST(1300.00 AS Decimal(10, 2)), N'2025-07-20 au 2025-09-10', N'https://via.placeholder.com/200x130?text=Sultana+Oualidia')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (36, N'Sofitel Rabat Jardin des Roses', N'Rabat', N'Avenue Imam Malik, Rabat', CAST(1400.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Sofitel+Rabat')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (37, N'La Mamounia', N'Marrakech', N'Avenue Bab Jdid', CAST(2200.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'/images/mamounia.jpg')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (38, N'Royal Mansour', N'Marrakech', N'Rue Abou Abbas El Sebti', CAST(3000.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Royal+Mansour')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (39, N'Sofitel Casablanca Tour Blanche', N'Casablanca', N'Avenue des FAR', CAST(1500.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Sofitel+Casablanca')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (40, N'Mazagan Beach Resort', N'El Jadida', N'Route côtière d''El Haouzia', CAST(1700.00 AS Decimal(10, 2)), N'2025-07-15 au 2025-09-15', N'https://via.placeholder.com/200x130?text=Mazagan+Resort')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (41, N'Hyatt Regency', N'Casablanca', N'Place des Nations Unies', CAST(1300.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-15', N'https://via.placeholder.com/200x130?text=Hyatt+Regency')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (42, N'Sofitel Palais des Roses', N'Agadir', N'Baie des Palmiers', CAST(1200.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Sofitel+Agadir')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (43, N'Hôtel Sahrai', N'Fès', N'Bab Lghoul', CAST(1400.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Hotel+Sahrai')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (44, N'Hotel Kenzi Tower', N'Casablanca', N'Boulevard Zerktouni', CAST(1000.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-08-20', N'https://via.placeholder.com/200x130?text=Kenzi+Tower')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (45, N'Le Casablanca Hotel', N'Casablanca', N'Rue du Soldat Ahmida', CAST(1800.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-30', N'https://via.placeholder.com/200x130?text=Le+Casablanca')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (46, N'Atlas Sky Airport', N'Casablanca', N'Zone Aéroportuaire de Nouasseur', CAST(850.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Atlas+Sky')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (47, N'Palais Faraj Suites & Spa', N'Fès', N'Derb Ziat', CAST(1600.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-25', N'https://via.placeholder.com/200x130?text=Palais+Faraj')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (48, N'Barceló Anfa', N'Casablanca', N'Boulevard Anfa', CAST(1450.00 AS Decimal(10, 2)), N'2025-07-15 au 2025-09-10', N'https://via.placeholder.com/200x130?text=Barcelo+Anfa')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (49, N'Riad Fès Relais & Châteaux', N'Fès', N'5 Derb Zerbtana', CAST(1350.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Riad+Fes')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (50, N'Hôtel Michlifen', N'Ifrane', N'Parc National d''Ifrane', CAST(2500.00 AS Decimal(10, 2)), N'2025-07-20 au 2025-09-15', N'https://via.placeholder.com/200x130?text=Michlifen')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (51, N'Val d’Anfa Hotel', N'Casablanca', N'Boulevard de la Corniche', CAST(1100.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Val+d+Anfa')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (52, N'Tikida Golf Palace', N'Agadir', N'Domaine du Golf de l’Océan', CAST(1350.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-25', N'https://via.placeholder.com/200x130?text=Tikida+Golf')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (53, N'Riad Ksar Ighnda', N'Ouarzazate', N'Douar Asfalou, Aït Ben Haddou', CAST(1250.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-08-30', N'https://via.placeholder.com/200x130?text=Ksar+Ighnda')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (54, N'Hôtel Transatlantique', N'Meknès', N'Avenue des FAR', CAST(950.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-15', N'https://via.placeholder.com/200x130?text=Transatlantique')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (55, N'Mogador Marina', N'Casablanca', N'Avenue Pasteur', CAST(800.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Mogador+Marina')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (56, N'Hotel Oumnia Puerto', N'Tanger', N'10 Rue Regraga', CAST(1000.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Oumnia+Puerto')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (57, N'Fairmont Taghazout Bay', N'Agadir', N'Taghazout', CAST(2200.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Fairmont+Taghazout')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (58, N'Hotel Cesar', N'Tanger', N'Avenue Mohamed VI', CAST(1200.00 AS Decimal(10, 2)), N'2025-07-15 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Hotel+Cesar')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (59, N'Sultana Oualidia', N'Oualidia', N'Parc Lagoon Oualidia', CAST(1800.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Sultana+Oualidia')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (60, N'Radisson Blu', N'Marrakech', N'Avenue Hassan II', CAST(1400.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Radisson+Marrakech')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (61, N'Kenzi Basma', N'Casablanca', N'Avenue Moulay Hassan I', CAST(900.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Kenzi+Basma')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (62, N'Zephyr Agadir', N'Agadir', N'Avenue Hassan II', CAST(1250.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Zephyr+Agadir')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (63, N'Dar Rhizlane', N'Marrakech', N'Avenue Jnane El Harti', CAST(1600.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-09-05', N'https://via.placeholder.com/200x130?text=Dar+Rhizlane')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (64, N'Movenpick Hotel', N'Casablanca', N'Avenue Hassan II', CAST(1450.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Movenpick+Casa')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (65, N'Hotel Chems', N'Marrakech', N'Avenue Houmane El Fetouaki', CAST(900.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Chems+Hotel')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (66, N'Le Doge', N'Casablanca', N'Rue du Docteur Veyre', CAST(1300.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Hotel+Le+Doge')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (67, N'Sofitel Tamuda Bay Beach & Spa', N'Tanger', N'Km 12 Route de M’diq', CAST(1800.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Sofitel+Tamuda+Bay')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (68, N'Hotel Continental', N'Tanger', N'Avenue Mohamed VI', CAST(1100.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-09-01', N'https://via.placeholder.com/200x130?text=Hotel+Continental')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (69, N'Dar Sultan', N'Tanger', N'Rue Talaa Kebira', CAST(950.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-30', N'https://via.placeholder.com/200x130?text=Dar+Sultan')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (70, N'Sofitel Tamuda Bay Beach & Spa', N'Saidia', N'Plage de Saidia', CAST(2000.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-09-05', N'https://via.placeholder.com/200x130?text=Sofitel+Saidia')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (71, N'Hôtel La Perle Bleue', N'Saidia', N'Boulevard de la Plage', CAST(1400.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=La+Perle+Bleue')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (72, N'Hôtel Atlas Asni', N'Safi', N'Avenue Mohamed V', CAST(900.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Atlas+Asni')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (73, N'Riad Safi', N'Safi', N'Rue de la Kasbah', CAST(800.00 AS Decimal(10, 2)), N'2025-07-10 au 2025-08-30', N'https://via.placeholder.com/200x130?text=Riad+Safi')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (74, N'Atlantic Dakhla', N'Dakhla', N'Zone Touristique', CAST(1800.00 AS Decimal(10, 2)), N'2025-07-05 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Atlantic+Dakhla')
INSERT [dbo].[Hotels] ([id], [nom], [ville], [adresse], [prix], [periodedispo], [imageUrl]) VALUES (75, N'Hotel Dar Dakhla', N'Dakhla', N'Quartier Bougafer', CAST(1300.00 AS Decimal(10, 2)), N'2025-07-01 au 2025-08-31', N'https://via.placeholder.com/200x130?text=Dar+Dakhla')
SET IDENTITY_INSERT [dbo].[Hotels] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [Email], [PasswordHash], [CreatedAt]) VALUES (1, N'Sarah Benali', N'sarah@example.com', N'hash1234', CAST(N'2025-05-15T12:12:06.697' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534A332DF8A]    Script Date: 03/07/2025 10:59:03 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [Reservation] SET  READ_WRITE 
GO
