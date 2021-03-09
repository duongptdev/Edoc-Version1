<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SetNewPass.aspx.vb" Inherits="SetNewPass" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Jan 19 2021 02:07:46 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ff66f8dfef02f1fcc0386df" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8">
    <title>Set New Password</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script
        type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
</head>

<body>
    <div class="container">
        <div class="card password-card">
            <div class="card-content">
                <div class="content-container top-password">
                    <div class="heading-card new-password-heading">Đặt lại mật khẩu</div>
                    <div class="subtitle-card">
                        Chủ động quản lý quyền riêng tư và bảo mật cho tài khoản của bạn.
                    </div>
                    <div class="email-form w-form">
                   
                        <label for="Password" class="form-label">Mật khẩu mới</label>
                        <div class="password-field">
                            <input type="password" class="form-field w-input"
                                autofocus="true" maxlength="256" name="Password" data-name="Password"
                                pattern="[0-9a-zA-Z]{6,}" placeholder="Nhập mật khẩu mới"
                                title="Vui lòng nhập đúng định dạng mật khẩu" id="password1" required="">
                            <!-- <a href="#" class="eye-icon w-inline-block" onclick=""><img
                                        src="images/Mask-Group-432.png" loading="lazy" alt="" class="eye-image"></a> -->
                        </div>
                        <div class="password-field">
                            <input type="password" class="form-field w-input"
                                maxlength="256" name="Re-type-password" data-name="Re-type password"
                                pattern="[0-9a-zA-Z]{6,}" placeholder="Nhập lại mật khẩu mới"
                                title="Vui lòng nhập đúng định dạng mật khẩu" id="password2" required="">
                            <!-- <a href="#" class="eye-icon w-inline-block" onclick=""><img
                                        src="images/Mask-Group-432.png" loading="lazy" alt="" class="eye-image"></a> -->
                        </div>
                        <div>
                            <div class="hint-container">
                                <div class="rectangle"></div>
                                <div class="hint-content">Mật khẩu tối thiểu 6 ký tự</div>
                            </div>
                            <div class="hint-container add-margin">
                                <div class="rectangle"></div>
                                <div class="hint-content">
                                    Không chứa các ký tự đặc biệt /, &gt;, &lt; và dấu cách
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="two-button">
                        <a href="sign-in.html" class="ghost-button w-button">Bỏ qua</a>
                        <button class="form-button button-color add-width w-button" id="myButton">Cập nhật</button>
                    </div>

                </div>
            </div>
        </div>
        <div class="copyright">
            <img src="Content/images/Icon-material-copyright.png" loading="lazy" alt="" class="image-2">
            <div class="text-block">Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
        </div>
    </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script src="js/webflow.js" type="text/javascript"></script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
    <script>
        function showPassword() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</body>

</html>

