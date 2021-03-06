USE [master]
GO
/****** Object:  Database [inventory_01022018]    Script Date: 02/02/2018 11.21.06 ******/
CREATE DATABASE [inventory_01022018] ON  PRIMARY 
( NAME = N'inventory_01022018', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\inventory_01022018.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'inventory_01022018_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\inventory_01022018_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [inventory_01022018] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inventory_01022018].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inventory_01022018] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inventory_01022018] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inventory_01022018] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inventory_01022018] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inventory_01022018] SET ARITHABORT OFF 
GO
ALTER DATABASE [inventory_01022018] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inventory_01022018] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [inventory_01022018] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inventory_01022018] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inventory_01022018] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inventory_01022018] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inventory_01022018] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inventory_01022018] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inventory_01022018] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inventory_01022018] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inventory_01022018] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inventory_01022018] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inventory_01022018] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inventory_01022018] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inventory_01022018] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inventory_01022018] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inventory_01022018] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inventory_01022018] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inventory_01022018] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [inventory_01022018] SET  MULTI_USER 
GO
ALTER DATABASE [inventory_01022018] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inventory_01022018] SET DB_CHAINING OFF 
GO
USE [inventory_01022018]
GO
/****** Object:  Table [dbo].[DataBarang]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataBarang](
	[Kode Barang] [varchar](10) NOT NULL,
	[Nama Barang] [varchar](10) NULL,
	[Kode Kelompok] [varchar](10) NULL,
	[Stok] [int] NOT NULL,
	[Satuan] [varchar](20) NULL,
	[Harga beli] [bigint] NOT NULL,
	[Harga Jual] [bigint] NOT NULL,
	[Delete] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataBarang] PRIMARY KEY CLUSTERED 
(
	[Kode Barang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataKelompok]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataKelompok](
	[Kode Kelompok] [varchar](10) NOT NULL,
	[Nama Kelompok] [varchar](50) NULL,
	[Delete] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataKelompok] PRIMARY KEY CLUSTERED 
(
	[Kode Kelompok] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataPelanggan]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataPelanggan](
	[Kode Pelanggan] [varchar](10) NOT NULL,
	[Nama Pelanggan] [varchar](25) NULL,
	[Alamat] [text] NULL,
	[Kota] [varchar](50) NULL,
	[Telepon] [varchar](20) NULL,
	[Delete] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataPelanggan] PRIMARY KEY CLUSTERED 
(
	[Kode Pelanggan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataPelunasan]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataPelunasan](
	[No Pelunasan] [varchar](10) NOT NULL,
	[No Piutang] [varchar](10) NOT NULL,
	[Tanggal] [date] NULL,
	[Bayar] [bigint] NULL,
	[Delete] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataPelunasan] PRIMARY KEY CLUSTERED 
(
	[No Pelunasan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataPembelian]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataPembelian](
	[No Pembelian] [varchar](10) NOT NULL,
	[Kode Supplier] [varchar](10) NOT NULL,
	[Tanggal] [date] NOT NULL,
	[Sub Total] [bigint] NOT NULL,
	[Diskon1] [decimal](13, 2) NOT NULL,
	[PPN1] [decimal](13, 2) NOT NULL,
	[Diskon2] [decimal](13, 2) NOT NULL,
	[PPN2] [decimal](13, 2) NOT NULL,
	[Total] [decimal](13, 2) NOT NULL,
	[Digunakan] [char](1) NOT NULL,
	[Delete] [char](1) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataPembelian] PRIMARY KEY CLUSTERED 
(
	[No Pembelian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataPenjualan]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataPenjualan](
	[No Penjualan] [varchar](10) NOT NULL,
	[Tanggal] [date] NULL,
	[Jenis] [varchar](10) NULL,
	[No Pesanan] [varchar](10) NULL,
	[Kode Pelanggan] [varchar](10) NULL,
	[Jatuh Tempo] [date] NULL,
	[Sub Total] [bigint] NULL,
	[Diskon1] [decimal](13, 2) NULL,
	[Diskon2] [decimal](13, 2) NULL,
	[PPN1] [decimal](13, 2) NULL,
	[PPN2] [decimal](13, 2) NULL,
	[Total] [decimal](13, 2) NULL,
	[Panjar] [decimal](13, 0) NULL,
	[Delete] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataPenjualan] PRIMARY KEY CLUSTERED 
(
	[No Penjualan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataPesanan]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataPesanan](
	[No Pesanan] [varchar](10) NOT NULL,
	[Kode Pelanggan] [varchar](10) NOT NULL,
	[Tanggal] [date] NOT NULL,
	[Sub Total] [bigint] NOT NULL,
	[Diskon1] [decimal](13, 2) NOT NULL,
	[PPN1] [decimal](13, 2) NOT NULL,
	[Diskon2] [decimal](13, 2) NOT NULL,
	[PPN2] [decimal](13, 2) NOT NULL,
	[Total] [decimal](13, 2) NOT NULL,
	[Digunakan] [char](1) NOT NULL,
	[Delete] [char](1) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataPesanan] PRIMARY KEY CLUSTERED 
(
	[No Pesanan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataPiutang]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataPiutang](
	[No Piutang] [varchar](10) NOT NULL,
	[Kode Pelanggan] [varchar](10) NULL,
	[Nilai] [bigint] NULL,
	[Panjar] [bigint] NULL,
	[Total Bayar] [bigint] NULL,
	[Jatuh Tempo] [date] NULL,
 CONSTRAINT [PK_DataPiutang] PRIMARY KEY CLUSTERED 
(
	[No Piutang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataSupplier]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataSupplier](
	[Kode Supplier] [varchar](10) NOT NULL,
	[Nama Supplier] [varchar](25) NULL,
	[Alamat] [text] NULL,
	[Kota] [varchar](50) NULL,
	[Telepon] [varchar](20) NULL,
	[Delete] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DataSupplier] PRIMARY KEY CLUSTERED 
(
	[Kode Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataTerminPelunasan]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataTerminPelunasan](
	[No Termin] [varchar](10) NOT NULL,
	[No Penjualan] [varchar](10) NOT NULL,
	[Jumlah Termin] [int] NOT NULL,
 CONSTRAINT [PK_DataTerminPiutang] PRIMARY KEY CLUSTERED 
(
	[No Termin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataUser]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataUser](
	[User Name] [varchar](25) NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_DataUser] PRIMARY KEY CLUSTERED 
(
	[User Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailPembelian]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailPembelian](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[No Pembelian] [varchar](10) NOT NULL,
	[Kode Barang] [varchar](10) NOT NULL,
	[Nama Barang] [varchar](50) NOT NULL,
	[Qty] [int] NOT NULL,
	[Satuan] [varchar](10) NOT NULL,
	[Harga] [decimal](13, 0) NOT NULL,
	[Sub Total] [decimal](13, 0) NOT NULL,
 CONSTRAINT [PK_DetailPembelian] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailPenjualan]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailPenjualan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[No Penjualan] [varchar](10) NULL,
	[Kode Barang] [varchar](10) NULL,
	[Qty] [int] NULL,
	[Harga] [bigint] NULL,
	[Sub Total] [bigint] NULL,
 CONSTRAINT [PK_DetailPenjualan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailPesanan]    Script Date: 02/02/2018 11.21.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailPesanan](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[No Pesanan] [varchar](10) NOT NULL,
	[Kode Barang] [varchar](10) NOT NULL,
	[Nama Barang] [varchar](50) NOT NULL,
	[Qty] [int] NOT NULL,
	[Satuan] [varchar](10) NOT NULL,
	[Harga] [decimal](13, 0) NOT NULL,
	[Sub Total] [decimal](13, 0) NOT NULL,
 CONSTRAINT [PK_DetailPesanan_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DataBarang] ADD  CONSTRAINT [DF_DataBarang_Stok]  DEFAULT ((0)) FOR [Stok]
GO
ALTER TABLE [dbo].[DataBarang] ADD  CONSTRAINT [DF_DataBarang_Harga beli]  DEFAULT ((0)) FOR [Harga beli]
GO
ALTER TABLE [dbo].[DataBarang] ADD  CONSTRAINT [DF_DataBarang_Harga Jual]  DEFAULT ((0)) FOR [Harga Jual]
GO
ALTER TABLE [dbo].[DataPembelian] ADD  CONSTRAINT [DF_DataPembelian_Sub Total]  DEFAULT ((0)) FOR [Sub Total]
GO
ALTER TABLE [dbo].[DataPembelian] ADD  CONSTRAINT [DF_DataPembelian_Diskon1]  DEFAULT ((0)) FOR [Diskon1]
GO
ALTER TABLE [dbo].[DataPembelian] ADD  CONSTRAINT [DF_DataPembelian_PPN1]  DEFAULT ((0)) FOR [PPN1]
GO
ALTER TABLE [dbo].[DataPembelian] ADD  CONSTRAINT [DF_DataPembelian_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[DataPembelian] ADD  CONSTRAINT [DF_DataPembelian_Digunakan]  DEFAULT ('N') FOR [Digunakan]
GO
ALTER TABLE [dbo].[DataPembelian] ADD  CONSTRAINT [DF_DataPembelian_Delete]  DEFAULT ('N') FOR [Delete]
GO
ALTER TABLE [dbo].[DataPesanan] ADD  CONSTRAINT [DF_DataPesanan_Sub Total]  DEFAULT ((0)) FOR [Sub Total]
GO
ALTER TABLE [dbo].[DataPesanan] ADD  CONSTRAINT [DF_DataPesanan_Diskon]  DEFAULT ((0)) FOR [Diskon1]
GO
ALTER TABLE [dbo].[DataPesanan] ADD  CONSTRAINT [DF_DataPesanan_PPN]  DEFAULT ((0)) FOR [PPN1]
GO
ALTER TABLE [dbo].[DataPesanan] ADD  CONSTRAINT [DF_DataPesanan_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[DataPesanan] ADD  CONSTRAINT [DF_DataPesanan_Digunakan]  DEFAULT ('N') FOR [Digunakan]
GO
ALTER TABLE [dbo].[DataPesanan] ADD  CONSTRAINT [DF_DataPesanan_Delete]  DEFAULT ('N') FOR [Delete]
GO
ALTER TABLE [dbo].[DetailPembelian] ADD  CONSTRAINT [DF_DetailPembelian_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[DetailPembelian] ADD  CONSTRAINT [DF_DetailPembelian_Harga]  DEFAULT ((0)) FOR [Harga]
GO
ALTER TABLE [dbo].[DetailPembelian] ADD  CONSTRAINT [DF_DetailPembelian_Sub Total]  DEFAULT ((0)) FOR [Sub Total]
GO
ALTER TABLE [dbo].[DetailPesanan] ADD  CONSTRAINT [DF_DetailPesanan_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[DetailPesanan] ADD  CONSTRAINT [DF_DetailPesanan_Harga]  DEFAULT ((0)) FOR [Harga]
GO
ALTER TABLE [dbo].[DetailPesanan] ADD  CONSTRAINT [DF_DetailPesanan_Sub Total]  DEFAULT ((0)) FOR [Sub Total]
GO
ALTER TABLE [dbo].[DataBarang]  WITH CHECK ADD  CONSTRAINT [FK_DataBarang_DataKelompok1] FOREIGN KEY([Kode Kelompok])
REFERENCES [dbo].[DataKelompok] ([Kode Kelompok])
GO
ALTER TABLE [dbo].[DataBarang] CHECK CONSTRAINT [FK_DataBarang_DataKelompok1]
GO
ALTER TABLE [dbo].[DataPelunasan]  WITH CHECK ADD  CONSTRAINT [FK_DataPelunasan_DataPiutang] FOREIGN KEY([No Piutang])
REFERENCES [dbo].[DataPiutang] ([No Piutang])
GO
ALTER TABLE [dbo].[DataPelunasan] CHECK CONSTRAINT [FK_DataPelunasan_DataPiutang]
GO
ALTER TABLE [dbo].[DataPembelian]  WITH CHECK ADD  CONSTRAINT [FK_DataPembelian_DataSupplier] FOREIGN KEY([Kode Supplier])
REFERENCES [dbo].[DataSupplier] ([Kode Supplier])
GO
ALTER TABLE [dbo].[DataPembelian] CHECK CONSTRAINT [FK_DataPembelian_DataSupplier]
GO
ALTER TABLE [dbo].[DataPenjualan]  WITH CHECK ADD  CONSTRAINT [FK_DataPenjualan_DataPelanggan] FOREIGN KEY([Kode Pelanggan])
REFERENCES [dbo].[DataPelanggan] ([Kode Pelanggan])
GO
ALTER TABLE [dbo].[DataPenjualan] CHECK CONSTRAINT [FK_DataPenjualan_DataPelanggan]
GO
ALTER TABLE [dbo].[DataPenjualan]  WITH CHECK ADD  CONSTRAINT [FK_DataPenjualan_DataPesanan] FOREIGN KEY([No Pesanan])
REFERENCES [dbo].[DataPesanan] ([No Pesanan])
GO
ALTER TABLE [dbo].[DataPenjualan] CHECK CONSTRAINT [FK_DataPenjualan_DataPesanan]
GO
ALTER TABLE [dbo].[DataPesanan]  WITH CHECK ADD  CONSTRAINT [FK_DataPesanan_DataPelanggan] FOREIGN KEY([Kode Pelanggan])
REFERENCES [dbo].[DataPelanggan] ([Kode Pelanggan])
GO
ALTER TABLE [dbo].[DataPesanan] CHECK CONSTRAINT [FK_DataPesanan_DataPelanggan]
GO
ALTER TABLE [dbo].[DataPiutang]  WITH CHECK ADD  CONSTRAINT [FK_DataPiutang_DataPelanggan] FOREIGN KEY([Kode Pelanggan])
REFERENCES [dbo].[DataPelanggan] ([Kode Pelanggan])
GO
ALTER TABLE [dbo].[DataPiutang] CHECK CONSTRAINT [FK_DataPiutang_DataPelanggan]
GO
ALTER TABLE [dbo].[DataTerminPelunasan]  WITH CHECK ADD  CONSTRAINT [FK_DataTerminPiutang_DataTerminPiutang] FOREIGN KEY([No Termin])
REFERENCES [dbo].[DataTerminPelunasan] ([No Termin])
GO
ALTER TABLE [dbo].[DataTerminPelunasan] CHECK CONSTRAINT [FK_DataTerminPiutang_DataTerminPiutang]
GO
ALTER TABLE [dbo].[DetailPembelian]  WITH CHECK ADD  CONSTRAINT [FK_DetailPembelian_DataBarang] FOREIGN KEY([Kode Barang])
REFERENCES [dbo].[DataBarang] ([Kode Barang])
GO
ALTER TABLE [dbo].[DetailPembelian] CHECK CONSTRAINT [FK_DetailPembelian_DataBarang]
GO
ALTER TABLE [dbo].[DetailPembelian]  WITH CHECK ADD  CONSTRAINT [FK_DetailPembelian_DetailPembelian] FOREIGN KEY([No Pembelian])
REFERENCES [dbo].[DataPembelian] ([No Pembelian])
GO
ALTER TABLE [dbo].[DetailPembelian] CHECK CONSTRAINT [FK_DetailPembelian_DetailPembelian]
GO
ALTER TABLE [dbo].[DetailPesanan]  WITH CHECK ADD  CONSTRAINT [FK_DetailPesanan_DataBarang] FOREIGN KEY([Kode Barang])
REFERENCES [dbo].[DataBarang] ([Kode Barang])
GO
ALTER TABLE [dbo].[DetailPesanan] CHECK CONSTRAINT [FK_DetailPesanan_DataBarang]
GO
ALTER TABLE [dbo].[DetailPesanan]  WITH CHECK ADD  CONSTRAINT [FK_DetailPesanan_DataPesanan] FOREIGN KEY([No Pesanan])
REFERENCES [dbo].[DataPesanan] ([No Pesanan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetailPesanan] CHECK CONSTRAINT [FK_DetailPesanan_DataPesanan]
GO
USE [master]
GO
ALTER DATABASE [inventory_01022018] SET  READ_WRITE 
GO
