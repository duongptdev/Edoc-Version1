<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Resend.aspx.vb" Inherits="Resend" %>

<!DOCTYPE html><!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Wed Jan 13 2021 06:46:38 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ff52e3d9ba581431905017f" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
<head>
  <meta charset="utf-8">
  <title>Resend Activation</title>
  <meta content="Resend Activation" property="og:title">
  <meta content="Resend Activation" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
  <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
  <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="Content/images/webclip.png" rel="apple-touch-icon">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
     <form id="form1" runat="server">
  <div class="container-fluid">
    <div class="center-content">
      <div class="heading-card">Email của bạn đã nhận link kích hoạt!</div>
      <div class="subtitle-card center">Có vẻ chúng tôi đã gửi link kích hoạt đến Email <a href="#" class="link">
          <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></a> của bạn.<br>Nếu chưa nhận được vui lòng nhấp vào &quot;Gửi lại link&quot; để nhận lại link kích hoạt.</div>
      <div class="image-container"><img src="Content/images/Group-14509.png" loading="lazy" alt="" class="notification-image"></div>
        <div>
               <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label><br />
          </div>
      <div class="button-container">
          
          <div>
               <asp:Button ID="btnResend" runat="server" Text="Gửi lại link" CssClass="button-color form-button button-color add-width w-button" OnClick="btnResend_Click"/>
          </div>
         
  
   <%--     <a href="#" class="button-color form-button button-color add-width w-button">Gửi lại link</a>--%>
      </div>
    </div>
    <div class="copyright"><img src="Content/images/Icon-material-copyright.png" loading="lazy" alt="" class="image-2">
      <div class="text-block">Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="Scripts/js/webflow.js" type="text/javascript"></script>
  <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
         </form>
</body>
</html>
