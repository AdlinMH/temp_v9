﻿Imports System.Data.SqlClient

Public Class FormBarang

#Region "Instance"

    Private _isTambah As Boolean = False
    Private _isUbah As Boolean = False
    Private _isTampil As Boolean = True
    Private _idSelected As String = String.Empty

    Private _db As DbEntities
    Private _cls As ClassBarang
    Private _data As DataBarang

#End Region

#Region "Constructor"
    Public Sub New()
        InitializeComponent()
        _db = New DbEntities()
        _cls = New ClassBarang(_db)
        _data = New DataBarang()
        gvData.AutoGenerateColumns = False
    End Sub
#End Region

#Region "Events"
    Private Sub FormBarang_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        gvData.DataSource = _cls.GetEntitiesView()
        InitControls()
    End Sub

    Private Sub gvData_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles gvData.CellClick
        If IsHaveData() Then
            _data = _cls.GetEntity(IdSelected())
            ModelToView()
            InitControls()
        End If
    End Sub

    Private Sub btnTambah_Click(sender As Object, e As EventArgs) Handles btnTambah.Click
        InitStatus("tambah")
        _data = New DataBarang()
        ModelToView()
        tbKode.Text = _cls.GetNextKode()
        InitControls()
        tbNama.Focus()
    End Sub

    Private Sub btnSimpan_Click(sender As Object, e As EventArgs) Handles btnSimpan.Click

        If ValidateChildren(ValidationConstraints.Enabled) Then
            ViewToModel()
            _cls.Data = _data
            _cls.AddOrUpdate()

            gvData.DataSource = _cls.GetEntitiesView()
            _data = New DataBarang()
            ModelToView()
            InitStatus("tampil")
            InitControls()
            btnTambah.Focus()

            MessageBox.Show("Data Sudah Tersimpan")
        End If
    End Sub

    Private Sub btnReload_Click(sender As Object, e As EventArgs) Handles btnReload.Click
        gvData.DataSource = _cls.GetEntitiesView()
        ResetSearch()
    End Sub

    Private Sub btnUbah_Click(sender As Object, e As EventArgs) Handles btnUbah.Click
        InitStatus("ubah")
        _data = _cls.GetEntity(IdSelected())
        ModelToView()
        InitControls()

        tbNama.Focus()
    End Sub

    Private Sub btnHapus_Click(sender As Object, e As EventArgs) Handles btnHapus.Click
        _data = _cls.GetEntity(IdSelected())
        _cls.Data = _data
        _cls.DeleteData()
        gvData.DataSource = _cls.GetEntitiesView()

        _data = New DataBarang()
        ModelToView()
        InitControls()

        btnTambah.Focus()
    End Sub

    Private Sub btnBatal_Click(sender As Object, e As EventArgs) Handles btnBatal.Click
        InitStatus("tampil")
        _data = New DataBarang()
        ModelToView()

        InitControls()
        ResetErrorMessage()
        btnTambah.Focus()
    End Sub

    Private Sub btnKelompok_Click(sender As Object, e As EventArgs) Handles btnKelompok.Click
        Dim frm = New FormBrowerKelompok(_db)

        If (frm.ShowDialog = DialogResult.OK) Then
            _data.DataKelompok = frm.Entity
            tbKelompok.Text = _data.DataKelompok.Kode_Kelompok
            tbNamaKelompok.Text = _data.DataKelompok.Nama_Kelompok
        End If

    End Sub

    Private Sub TextBox_Validating(sender As Object, e As System.ComponentModel.CancelEventArgs) Handles tbNama.Validating, tbSatuan.Validating
        Dim textbox As Control = sender

        If (String.IsNullOrEmpty(textbox.Text)) Then
            e.Cancel = True
            errMessage.SetError(textbox, "Field Tidak Boleh Kosong")
        Else
            errMessage.SetError(textbox, String.Empty)
        End If

    End Sub

    Private Sub btnTutup_Click(sender As Object, e As EventArgs) Handles btnTutup.Click
        Close()
    End Sub

    Private Sub tbPencarian_TextChanged(sender As Object, e As EventArgs) Handles tbPencarian.TextChanged
        If (rbKode.Checked) Then
            gvData.DataSource = _cls.GetEntitiesView(Function(x) x.Kode_Barang.Contains(tbPencarian.Text))
        Else
            gvData.DataSource = _cls.GetEntitiesView(Function(x) x.Nama_Barang.Contains(tbPencarian.Text))
        End If
    End Sub

#End Region

#Region "Functions"
    Private Function IsHaveData() As Boolean
        Return gvData.RowCount > 0
    End Function

    Private Function IdSelected() As String
        Dim idx = gvData.CurrentRow.Index
        Return gvData.Item(0, idx).Value
    End Function
#End Region

#Region "Methods"
    Private Sub InitStatus(status As String)
        _isTampil = IIf(status = "tampil", True, False)
        _isTambah = IIf(status = "tambah", True, False)
        _isUbah = IIf(status = "ubah", True, False)
    End Sub

    Private Sub InitControls()

        rbKode.Checked = True

        tbNama.Enabled = Not _isTampil
        tbStok.Enabled = Not _isTampil
        tbSatuan.Enabled = Not _isTampil
        tbHargaBeli.Enabled = Not _isTampil
        tbHargaJual.Enabled = Not _isTampil

        btnSimpan.Enabled = Not _isTampil
        btnBatal.Enabled = Not _isTampil
        btnKelompok.Enabled = Not _isTampil

        gvData.Enabled = _isTampil
        tbPencarian.Enabled = _isTampil
        rbKode.Enabled = _isTampil
        rbNama.Enabled = _isTampil

        btnHapus.Enabled = IsHaveData() And Not _isTambah And Not _isUbah
        btnUbah.Enabled = IsHaveData() And Not _isTambah And Not _isUbah
        btnTambah.Enabled = Not _isTambah And Not _isUbah
        btnReload.Enabled = Not _isTambah And Not _isUbah
    End Sub

    Private Sub ResetErrorMessage()
        errMessage.SetError(tbNama, String.Empty)
    End Sub

    Private Sub ResetSearch()
        tbPencarian.Text = String.Empty
        rbKode.Checked = True
    End Sub

    Private Sub ViewToModel()
        _data.Kode_Barang = tbKode.Text
        _data.Nama_Barang = tbNama.Text
        _data.Harga_beli = tbHargaBeli.Text
        _data.Harga_Jual = tbHargaJual.Text
        _data.Stok = Integer.Parse(tbStok.Text)
        _data.Satuan = tbSatuan.Text
        _data.Kode_Kelompok = tbKelompok.Text
    End Sub

    Private Sub ModelToView()
        tbKode.Text = _data.Kode_Barang
        tbNama.Text = _data.Nama_Barang
        tbHargaBeli.Text = _data.Harga_beli
        tbHargaJual.Text = _data.Harga_Jual
        tbStok.Text = _data.Stok
        tbSatuan.Text = _data.Satuan

        If (_data.DataKelompok Is Nothing) Then
            tbKelompok.Text = ""
            tbNamaKelompok.Text = ""
        Else
            tbKelompok.Text = _data.DataKelompok.Kode_Kelompok
            tbNamaKelompok.Text = _data.DataKelompok.Nama_Kelompok
        End If
    End Sub

    Private Sub tbHargaBeli_Validating(sender As Object, e As System.ComponentModel.CancelEventArgs) Handles tbStok.Validating, tbHargaJual.Validating, tbHargaBeli.Validating
        Dim tb As TextBox = sender
        Dim d As Decimal
        If (tb.Text = "") Then
            e.Cancel = True
            errMessage.SetError(tb, "Field Tidak Boleh Kosong")
        ElseIf (Not Decimal.TryParse(tb.Text, d)) Then
            e.Cancel = True
            errMessage.SetError(tb, "Field Harus Angka")
        ElseIf (Decimal.Parse(tb.Text) < 0) Then
            e.Cancel = True
            errMessage.SetError(tb, "Field tidak boleh Negatif")
        Else
            errMessage.SetError(tb, "")
        End If
    End Sub

    Private Sub tbKelompok_Validating(sender As Object, e As System.ComponentModel.CancelEventArgs) Handles tbKelompok.Validating
        If String.IsNullOrEmpty(tbKelompok.Text) Then
            e.Cancel = True
            errMessage.SetError(tbKelompok, "Field Tidak Boleh Kosong")
        Else
            errMessage.SetError(tbKelompok, "")
        End If
    End Sub


#End Region

End Class