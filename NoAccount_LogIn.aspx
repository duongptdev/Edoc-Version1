<%@ Page Language="VB" AutoEventWireup="false" CodeFile="signin.aspx.vb" Inherits="signin" EnableEventValidation="false" %>
<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Sign In</title>
    <meta content="Sign In" property="og:title" />
    <meta content="Sign In" property="twitter:title" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css" />
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/images/webclip.png" rel="apple-touch-icon" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/css/font-awesome.min.css" />
    <script type="text/javascript">

        function Checkaccount() {
            var uid, password;
            uid = txtuserid.GetText();
            password = txtpassword.GetText();

            if (uid != '' && password != '') {
                cplogin.PerformCallback(uid + '|' + password);
            }
            else
                alert('Vui lòng nhập đủ thông tin đăng nhập');
        }
        function LoginComp(s, e) {
            if (e.result != null) {
                //0: Tai khoan khong dung,1: thành công, -1: Lỗi,  -2 :TK chưa kích hoạt, -3: Tài khoản đã bị khóa, -4: Tài khoản bị khóa do dang nhap sai qua 5 lan, -5: Thong tin dang nhap khong dung

                var arr = e.result.split('|');

                var trangthai = arr[0];
                localStorage.setItem("email", arr[1]);
                localStorage.setItem("hoten", arr[2]);
                localStorage.setItem("sdt", arr[3]);
                localStorage.setItem("mst", arr[4]);
                localStorage.setItem("tentc", arr[5]);
                localStorage.setItem("datechang", arr[6]);
                if (trangthai == 1) {   

                    window.location.href = 'Danhsachyeucau.aspx';
                } else if (trangthai == 0) {
                    alert('Tài khoản đăng nhập không đúng.');

                } else if (trangthai == -1) {
                    alert('Lỗi');
                } else if (trangthai == -2) {
                    alert('Tài khoản chưa kích hoạt.');

                } else if (trangthai == -3) {
                    alert('Tài khoản đã bị khóa.');
                }
                else if (trangthai == -4) {
                    alert('Tài khoản đã bị khóa do đăng nhập sai quá 5 lần.');
                }
                else if (trangthai == -5) {
                    alert('Thông tin đăng nhập không đúng.');
                }
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">

        <dx:ASPxCallback ID="cpLogin" runat="server" OnCallback="cpLogin_Callback" ClientInstanceName="cplogin">
            <ClientSideEvents CallbackComplete="LoginComp" />
        </dx:ASPxCallback>

        <div class="container-fluid">
            <div class="card">
                <div class="card-content">
                    <div class="content-container">
                        <div class="heading-card">Xác thực truy cập</div>
                        <div class="subtitle-card">
                            Vui lòng nhập Email và mã truy cập đã cung cấp vào trường bên dưới để tiến hành truy cập
                        </div>
                        <div class="email-form w-form">
                            <div id="email-form" name="email-form" data-name="Email Form" method="post" class="form">
                                <label for="Password" class="form-label">Email</label>

                                    <%--<dx:ASPxTextBox ID="txtEmail" ClientInstanceName="txtuserid" runat="server" CssClass="form-field w-input" MaxLength="256" CausesValidation="true"></dx:ASPxTextBox>--%>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-field w-input"></asp:TextBox>
                                <div>
                                    <label for="Password" class="form-label">Mã truy cập</label>
                                </div>

                                <div class="password-field">
                                    <%-- <dx:ASPxTextBox ID="txtPass" runat="server" ClientInstanceName="txtpassword" CssClass="form-field w-input" CausesValidation="true" Password="true"></dx:ASPxTextBox>--%>
                                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" onkeypress="myFunction()" CssClass="form-field w-input">
                                        
                                    </asp:TextBox>
                                    <a href="#" class="eye-icon w-inline-block" onclick="">
                                       
                                        <img src="Content/images/Mask-Group-432.png" loading="lazy" onclick="showPassword()" alt="" id="imagepass" class="eye-image">
                                       <%-- <img src="Content/images/eye-slash.svg" loading="lazy" onclick="showPassword()" alt="" id="imagepasshide" class="eye-image" hidden>--%>
                                    </a>
                                </div>
                                <div>
                                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                </div>
                               <%--  <input type="button" onclick="Checkaccount()" value="Đăng nhập" class="form-button button-color w-button text-center" style="color:white" />--%>
                                <asp:Button ID="btnDangNhap" runat="server" Text="Truy cập" CssClass="form-button button-color w-button text-center" OnClick="btnDangNhap_Click" />
                            </div>
                            <div class="w-form-done">
                                <div>Thank you! Your submission has been received!</div>
                            </div>
                            <div class="w-form-fail">
                                <div>Oops! Something went wrong while submitting the form.</div>
                            </div>
                        </div>
                        <div class="text-link-wrapper">
                            
                                <%--<a href="http://192.168.2.108:8001/download/ToolSigndoc.exe">Tải tool ký EDOC USB Token</a>--%>
                      
                            <%--<div class="text-link reset-margin">Bạn chưa có tài khoản? <a href="SignUp.aspx" class="link">Đăng ký</a> ngay</div>--%>
                        </div>
                    </div>
                </div>
                <div class="card-image">
                    <img src="Content/images/no-account-log.svg" loading="lazy" alt="" class="image">
                </div>
            </div>
            <div class="copyright">
                <img src="Content/images/Icon-material-copyright.png" loading="lazy" alt="" class="image-2">
                <div class="text-block">Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
            </div>
        </div>
        <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="Scripts/js/webflow.js" type="text/javascript"></script>
        <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
        <script>
            function showPassword() {
                var x = document.getElementById("txtPass");
                if (x.type === "password") {
                    x.type = "text";
                     document.getElementById("imagepass").src ="Content/images/eye-slash.svg" ;
                } else {
                    x.type = "password";
                    document.getElementById("imagepass").src = "Content/images/Mask-Group-432.png";
                   
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $("#txtEmail").attr("placeholder", "Nhập Email của bạn");
                $("#txtPass").attr("placeholder", "Nhập mã truy cập");
               
          
                 document.getElementById('btnDangNhap').style.opacity=0.3;
              

            });
            function myFunction() {
              document.getElementById('btnDangNhap').style.opacity=1;
            }
        </script>
        <script>
            $('#btnDangNhap').click(function () {
                var a = $('#txtEmail').val();
                var b = $("#txtPass").val();
                if (a == "" || b == "") {
                    alert("Mời nhập đầy đủ thông tin");
                    return false;
                }
            });
        </script>
    </form>
</body>
</html>
