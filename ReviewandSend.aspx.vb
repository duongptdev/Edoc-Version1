Imports System.IO

Partial Class ReviewandSend
    Inherits System.Web.UI.Page
    Protected Sub ReviewSend_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim arr As String() = e.Parameter.Split("|")
        Dim tieude As String = arr(0)
        Dim loinhan As String = arr(1)
        Dim email As String() = arr(2).Split(",")
        Dim body As String = String.Empty
        Using reader As StreamReader = New StreamReader(Server.MapPath("NotificationSign.html"))
            body = reader.ReadToEnd()
        End Using
        body = body.Replace("{nameSend}", Session("Name"))
        body = body.Replace("{nameFile}", Session("Namefile"))
        body = body.Replace("{url}", "http://27.71.231.212:8001/Signin.aspx")
        'Dim subject As String = ""
        Dim ccmail As String = ""
        Dim res As Integer = 0
        Dim idfile = Session("idFile")
        Dim serv As New swEDoc.apiEdoc
        Dim rec As Integer = 0

        For i = 0 To email.Count - 1
            rec = serv.GuiVB(idfile, email(i))
            res = serv.SendMail(email(i), tieude, body, ccmail, "Ca2.Sign.")
            serv.Capnhattieudeguimail(idfile, "Ca2.Sign", tieude)

        Next
        e.Result = res
    End Sub
    Protected Sub cplogout_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Session.Clear()
    End Sub
    Protected Sub btnDangxuat_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Signin.aspx")
    End Sub
End Class
