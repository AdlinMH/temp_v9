
'------------------------------------------------------------------------------
' <auto-generated>
'    This code was generated from a template.
'
'    Manual changes to this file may cause unexpected behavior in your application.
'    Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic


Partial Public Class DataPiutang

    Public Property No_Piutang As String

    Public Property Kode_Pelanggan As String

    Public Property Nilai As Nullable(Of Long)

    Public Property Panjar As Nullable(Of Long)

    Public Property Total_Bayar As Nullable(Of Long)

    Public Property Jatuh_Tempo As Nullable(Of Date)



    Public Overridable Property DataPelanggan As DataPelanggan

    Public Overridable Property DataPelunasan As ICollection(Of DataPelunasan) = New HashSet(Of DataPelunasan)


End Class
