Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class Index
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub Index_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") Is Nothing Then
            Response.Redirect("Signin.aspx")
        End If
        Dim email As String = Session("Login").ToString()
        'gridDanhsach.SettingsDataSecurity.AllowReadUnlistedFieldsFromClientApi = DevExpress.Utils.DefaultBoolean.True
        'gridDanhsach.FocusedRowIndex = -1

        Dim serv As New swEDoc.apiEdoc
        Dim data As DataTable = New DataTable()
        data = serv.LayDSVB(email, 0)
        'grvDsvb.DataSource = data
        'grvDsvb.DataBind()
        gridDanhsach.DataSource = data
        gridDanhsach.DataBind()
        If data.Rows.Count > 0 Then
            pnHaveFile.Visible = True
            pnEmpty.Visible = False
        Else
            pnEmpty.Visible = True
            pnHaveFile.Visible = False
        End If
    End Sub
    Private Sub LoadData()

    End Sub
    Protected Sub gridDanhsach_DataBinding(sender As Object, e As EventArgs)
        Dim email As String = Session("Login").ToString()
        Dim serv As New swEDoc.apiEdoc
        Dim data As DataTable = New DataTable()
        data = serv.LayDSVBNhan(email)
        'dsDagui.SelectCommand = "select * from v_VBChitiet where  Taikhoantao='" & Session("Login").ToString & "' order by idFile desc"
        'dsDagui.DataBind()
        gridDanhsach.DataSource = data
        gridDanhsach.DataBind()
    End Sub
    Protected Sub gridDanhsach_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)

    End Sub
    Protected Sub gridDanhsach_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs)
        If e.Column.FieldName = "TrangthaiVB" Then
            If e.Value = 1 Then
                e.DisplayText = "Nháp"
                e.Column.CellStyle.ForeColor = Drawing.Color.Silver
            ElseIf e.Value = 2 Then
                e.DisplayText = "Chờ ký"
                e.Column.CellStyle.ForeColor = Drawing.Color.Blue
            ElseIf e.Value = 3 Then
                e.DisplayText = "Ký hoàn tất"
                e.Column.CellStyle.ForeColor = Drawing.Color.Red
            ElseIf e.Value = 4 Then
                e.DisplayText = "Từ chối"
                e.Column.CellStyle.ForeColor = Drawing.Color.Silver
            ElseIf e.Value = 5 Then
                e.DisplayText = "Thu hồi"
            ElseIf e.Value = 6 Then
                e.DisplayText = "Xóa"
                e.Column.CellStyle.ForeColor = Drawing.Color.Green
            End If
        End If

    End Sub

    Protected Sub gridDanhsach_DataBound(sender As Object, e As EventArgs)


    End Sub
    Protected Sub btnXem_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim idfile As Integer = gridDanhsach.GetRowValues(container.VisibleIndex, "idFile")
        Dim duongdanfile = gridDanhsach.GetRowValues(container.VisibleIndex, "Vitriluu")
        Dim taikhoan = gridDanhsach.GetRowValues(container.VisibleIndex, "Taikhoantao")
        Dim tenvb As String = gridDanhsach.GetRowValues(container.VisibleIndex, "TenVBGoc")
        Dim trangthaivb As String = gridDanhsach.GetRowValues(container.VisibleIndex, "TrangthaiVB")
        Dim res As New swEDoc.clThietlapnguoiky
        Dim serv As New swEDoc.apiEdoc
        res = serv.Checkky_Taikhoan(idfile, Session("Login"))
        Dim info As String = res.Info
        Dim tkk As String = res.Taikhoanky
        Dim trangthaiky As Integer = res.Trangthaiky
        Dim trinhtuky As Integer = res.Trinhtuky
        Dim checkdl As Integer = res.CheckDL
        Dim link As String = duongdanfile.Replace("D:\EDOC_TEST\WEBEDOC\Edoc0103", "http://27.71.231.212:8001")
        'Dim link As String = duongdanfile.Replace("D:\Web\Edoc", "http://localhost:58988")
        Session("idf") = idfile
        btn.JSProperties("cp_idfile") = idfile
        btn.JSProperties("cp_tkk") = tkk
        btn.JSProperties("cp_info") = info
        btn.JSProperties("cp_checkdl") = checkdl
        btn.JSProperties("cp_trangthaivb") = trangthaivb
        btn.JSProperties("cp_email") = Session("Login")
        btn.JSProperties("cp_name") = Session("Ten")
        btn.JSProperties("cp_trangthaiky") = trangthaiky
        btn.JSProperties("cp_urlFile") = link
        btn.JSProperties("cp_tenvb") = tenvb
        btn.JSProperties("cp_trinhtuky") = trinhtuky
        Dim data As New DataTable
        data = serv.LayTTVB(idfile)
        btn.JSProperties("cp_ttk") = data.Rows(0)(13)
        Session("ttk") = data.Rows(0)(13)
        btn.JSProperties("cp_taikhoantao") = taikhoan
        btn.JSProperties("cp_tennguoitao") = data.Rows(0)(3)
        btn.JSProperties("cp_ngaytao") = data.Rows(0)(4)
        btn.JSProperties("cp_tieudemail") = data.Rows(0)(7)
        btn.JSProperties("cp_chudemail") = data.Rows(0)(8)
        Dim listtennguoiky As New List(Of String)
        For i = 0 To data.Rows.Count - 1
            If IsDBNull(data.Rows(i)(11)) = False Then
                listtennguoiky.Add(data.Rows(i)(11))
            End If

        Next
        btn.JSProperties("cp_tennguoiky") = listtennguoiky
        Dim listky As New List(Of String)
        For i = 0 To data.Rows.Count - 1
            If IsDBNull(data.Rows(i)(10)) = False Then
                listky.Add(data.Rows(i)(10))
            End If
        Next

        btn.JSProperties("cp_taikhoanky") = listky
        Dim listhtk As New List(Of Integer)
        For j = 0 To data.Rows.Count - 1
            If IsDBNull(data.Rows(j)(13)) = False Then
                listhtk.Add(data.Rows(j)(13))
            End If
        Next

        btn.JSProperties("cp_hinhthucky") = listhtk
        btn.JSProperties("cp_trangthaigui") = data.Rows(0)(14)
        btn.JSProperties("cp_thoigiangui") = data.Rows(0)(15)

        Dim trangthai As Integer = checkttky(idfile, trinhtuky - 1)

        If trinhtuky = 1 And trangthaiky = 0 Then
            btn.JSProperties("cp_trinhtu") = 1
        Else
            If trangthai = 1 Then
                btn.JSProperties("cp_trinhtu") = 1
            Else
                btn.JSProperties("cp_trinhtu") = 2
            End If
        End If
        Dim logvb As New DataTable
        Dim listnoidung As New List(Of String)
        Dim listthoigian As New List(Of String)
        Dim listtkthuchien As New List(Of String)
        Dim listtrangthaivb As New List(Of String)
        Dim listhotennguoiguilog As New List(Of String)

        logvb = serv.LaylogVB(idfile)
        Session("Logvb") = logvb
        For k = 0 To logvb.Rows.Count - 1
            If IsDBNull(logvb.Rows(k)(2)) = False Then
                listnoidung.Add(logvb.Rows(k)(2))
            End If
            If IsDBNull(logvb.Rows(k)(3)) = False Then
                listthoigian.Add(logvb.Rows(k)(3))
            End If
            If IsDBNull(logvb.Rows(k)(4)) = False Then
                listtkthuchien.Add(logvb.Rows(k)(4))
            End If
            If IsDBNull(logvb.Rows(k)(8)) = False Then
                listtrangthaivb.Add(logvb.Rows(k)(8))
            End If
            If IsDBNull(logvb.Rows(k)(7)) = False Then
                listhotennguoiguilog.Add(logvb.Rows(k)(7))
            End If



           
        Next
        btn.JSProperties("cp_noidunglog") = listnoidung
        btn.JSProperties("cp_thoigianlog") = listthoigian
        btn.JSProperties("cp_tkthuchien") = listtkthuchien
        btn.JSProperties("cp_trangthailog") = listtrangthaivb
        btn.JSProperties("cp_hotennguoigui") = listhotennguoiguilog
        serv.GhilogxemVB(idfile, Session("Login"), trangthaivb)
    End Sub
    Protected Sub gridDanhsach_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        'If e.DataColumn.FieldName = "Trinhtuky" Then
        '    'Dim btn As ASPxButton = TryCast(gridDanhsach.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "btnXem"), ASPxButton)
        '    Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        '    Dim trinhtu As String = gridDanhsach.GetRowValues(e.VisibleIndex, "Trinhtuky")
        '    Dim idfile As String = gridDanhsach.GetRowValues(e.VisibleIndex, "idFile")
        '    Dim trangthaiky As Integer = checkttky(idfile, trinhtu - 1)

        '    If trinhtu = 1 Then
        '        btn.JSProperties("cp_trinhtu") = 1
        '    Else
        '        If trangthaiky = 1 Then
        '            btn.JSProperties("cp_trinhtu") = 1
        '        Else
        '            btn.JSProperties("cp_trinhtu") = 2
        '        End If

        '    End If

        'End If
    End Sub
    Private Function checkttky(idfile As String, trinhtu As Integer) As Integer
        Dim trangthaiky As Integer = 0
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Trangthaiky from v_VBChitiet where idFile = '" & idfile & "' and Trinhtuky=" & trinhtu
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                If reader(0) IsNot DBNull.Value Then
                    trangthaiky = Convert.ToInt32(reader(0).ToString)
                End If
            End While
            reader.Close()
        Else
            trangthaiky = 0
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        Return trangthaiky
    End Function
    Private Function laydsvb(tieuchi As Integer) As DataTable
        Dim data As DataTable = New DataTable
        Dim serv As New swEDoc.apiEdoc
        data = serv.LayDSVB(Session("Login"), tieuchi)
        gridDanhsach.DataSource = data
        gridDanhsach.DataBind()
        Return data
    End Function

    Protected Sub cpChoky_Callback(source As Object, e As CallbackEventArgs)
        Dim serv As New swEDoc.apiEdoc
        Dim trangthai As Integer = e.Parameter
        Dim data As New DataTable
        data = serv.LayDSVB(Session("Login"), trangthai)
        Session("dt") = data

    End Sub
    Protected Sub gridDanhsach_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)
        If Session("dt") IsNot Nothing Then
            Dim dt As DataTable = DirectCast(Session("dt"), DataTable)
            gridDanhsach.DataSource = dt
            gridDanhsach.DataBind()
        End If
    End Sub
    Protected Sub cbXoa_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxCheckBox = DirectCast(sender, ASPxCheckBox)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim idfile As Integer = gridDanhsach.GetRowValues(container.VisibleIndex, "idFile")
        Dim taikhoan As String = Session("Login")

        btn.JSProperties("cp_idfilexoa") = idfile
        btn.JSProperties("cp_taikhoanthuchien") = taikhoan
    End Sub
    Protected Sub cpxoavb_Callback(source As Object, e As CallbackEventArgs)
        Dim arr As String() = e.Parameter.Split(",")
        Dim idfile As Integer = arr(0)
        Dim taikhoanthuchien As String = arr(1)
        Dim res As Integer = 0
        Dim serv As New swEDoc.apiEdoc
        res = serv.XoaVB(idfile, taikhoanthuchien)
        e.Result = res
    End Sub
End Class
