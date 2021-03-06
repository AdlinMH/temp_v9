USE [Inventory]
GO
/****** Object:  Table [dbo].[DataBarang]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataKelompok]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataPelanggan]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataPelunasan]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataPenjualan]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataPesanan]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataPiutang]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataSupplier]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DataUser]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DetailPenjualan]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[DetailPesanan]    Script Date: 24/01/2018 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
ALTER TABLE [dbo].[DataBarang] ADD  CONSTRAINT [DF_DataBarang_Stok]  DEFAULT ((0)) FOR [Stok]
GO
ALTER TABLE [dbo].[DataBarang] ADD  CONSTRAINT [DF_DataBarang_Harga beli]  DEFAULT ((0)) FOR [Harga beli]
GO
ALTER TABLE [dbo].[DataBarang] ADD  CONSTRAINT [DF_DataBarang_Harga Jual]  DEFAULT ((0)) FOR [Harga Jual]
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
