
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub cplogout_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Session.Clear()
    End Sub
End Class

