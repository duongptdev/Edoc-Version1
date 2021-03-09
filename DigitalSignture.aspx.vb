
Partial Class DigitalSignture
    Inherits System.Web.UI.Page

    Protected Sub cpusbtoken_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)

        Dim taikhoan As String = Session("Login")
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = 0
        res = serv.Thietlapphuongthuckytoken(taikhoan, "1234", 1)
        e.Result = res
    End Sub
    Protected Sub cpmobileserial_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim serialmobile As String = e.Parameter
        Dim taikhoan As String = Session("Login")
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = 0
        res = serv.Thietlapphuongthuckymobilesign_Serial(taikhoan, serialmobile, 1)
        e.Result = res
    End Sub
    Protected Sub cpmobileidcts_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim idctsmobile As String = e.Parameter
        Dim taikhoan As String = Session("Login")
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = 0
        res = serv.Thietlapphuongthuckymobilesign_IDCTS(taikhoan, idctsmobile, 1)
        e.Result = res
    End Sub
End Class
