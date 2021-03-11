<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ElectronicSigning.aspx.vb" Inherits="ElectronicSigning" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Mon Feb 22 2021 02:20:19 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="600e8f7bc7218712f3c31bf8" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
<head>
    <meta charset="utf-8">
    <title>Electronic Signing</title>
    <meta content="Electronic Signing" property="og:title">
    <meta content="Electronic Signing" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
    <script type="text/javascript">WebFont.load({ google: { families: ["Merriweather:300,300italic,400,400italic,700,700italic,900,900italic", "Great Vibes:400"] } });</script>
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
       
        .aligntext {
            text-align: left
        }

        #btnAll {
            border: none;
        }

        .table-index {
            border-spacing: 0 12px;
            min-width: 100%;
            border-collapse: separate;
        }

            .table-index tbody tr {
                box-shadow: 0px 1px 4px rgba(4, 80, 193, 0.1);
            }

            .table-index td {
                padding: 13px 10px;
                border-right: none;
                font-family: "Helvetica neue", sans-serif;
            }

            .table-index th {
                padding: 0 10px;
                border-right: none;
                background-color: transparent;
                font-family: "Helvetica neue", sans-serif;
                font-size: 13px;
                font-weight: 400;
                color: #7A869A;
            }

            .table-index tbody tr {
                border-radius: 2px;
                overflow: hidden;
            }

            .table-index td:first-child {
                padding-left: 20px;
            }

            .table-index td:last-child {
                text-align: right;
                padding-right: 20px;
            }

        .file-name-index {
            color: #253858;
            font-size: 13px;
            font-weight: 500;
        }

        .user-name-index {
            color: #B3BAC5;
            font-size: 13px;
            font-weight: 400;
        }

        .day-created-index {
            color: #253858;
            font-size: 13px;
            font-weight: 400;
        }

        .boder-none {
            border: none;
        }
  

    </style>
    <script>
        function SignDoc() {
            //var idfile = localStorage.getItem("idFile");
            //var tkk = localStorage.getItem("Taikhoanky");
            //var ptk = localStorage.getItem("Phuongthucky");
            //var ttk = localStorage.getItem("trinhtuky");
            //cpsign.PerformCallback(idfile + "|" + tkk + "|" + ptk + "|" + ttk);
            loading.Show();
            var phuongthuc = $("#sign-method").val();
            sessionStorage.setItem("pthucky", phuongthuc);
            if (phuongthuc == 1) {
                var page = sessionStorage.getItem("signpage");
                cpsign.PerformCallback(page + "|" + phuongthuc);
            }
            else {
                loading.Hide();

                var code = new Date().YYYYMMDDHHMMSS();
                var linkfile = localStorage.getItem("urlFile");
                var info = sessionStorage.getItem("signInfo")
                var idfile = localStorage.getItem("idFile");
                var taikhoanky = localStorage.getItem("Taikhoanky");
                var trinhtuky = sessionStorage.getItem("trinhtuky");
                if (info != null) {
                    cpupdate.PerformCallback(linkfile + "|" + code + "|" + info + "|" + phuongthuc + "|" + idfile + "|" + taikhoanky + "|" + trinhtuky);


                }
                else {
                    alert('Chưa chọn vùng ký trên văn bản')
                }
            }
        }
        function Getptk() {
            pop.Show();


        }
        function EndSign(s, e) {
            alert('Gửi yêu cầu ký văn bản thành công. Nếu ký bằng USB token, vui lòng ký văn bản đang chờ bằng tool ký bằng USB Token.');
        }
        function EndSignDoc(s, e) {
            alert(e.result);
            if (e.result == 1) {
                alert("Ký thành công");
                window.location.href = "Index.aspx";
            } else if (e.result == 0) {
                alert("Ký không thành công");
            } else if (e.result == -1) {
                alert("Lỗi hệ thống");
            } else if (e.result == -2) {
                alert("Tài khoản không đủ điều kiện để ký ");
            } else {
                alert(e.result);
            }
        }
   <%--     function UpdateSign() {
            var linkfile = localStorage.getItem('urlFile');
            var code = new Date().YYYYMMDDHHMMSS();
            var tk ='<%= Session("Login") %>';
            var info = sessionStorage.getItem("signInfo");
            var idfile = localStorage.getItem("idFile");
            var ptk = sessionStorage.getItem("pthucky");
            cpupdate.PerformCallback(idfile + "|" + ptk + "|" + linkfile + "|" + code + "|" + tk);
        }--%>

        function UpdateSignDoc(s, e) {
            alert(e.result);
            window.location.href = "Index.aspx";
        }

        function Logout() {
            cplogout.PerformCallback();
        }

        function EndLogout(s, e) {
            localStorage.clear();
            sessionStorage.clear();
            window.location.href = "Signin.aspx";
        }
        function showUserMenu() {
            var userMenuToggle = document.querySelector(".nav-user");
            var userMenu = document.querySelector(".user-dropdown");

            userMenuToggle.addEventListener("click", function () {
                if (userMenu.style.display === "none") {
                    userMenu.style.display = "block";
                }
                else {
                    userMenu.style.display = "none";
                }
            });
        };
    </script>

</head>
<body>



    <form id="form1" runat="server">




        <dx:ASPxPopupControl ID="pop" ClientInstanceName="pop" runat="server" Width="500px"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div class="">
                        <div class="modal-form">

                            <div class="title-dialog">Ký Số</div>
                            <div class="digital-content">
                                <div class="sign-method">
                                    <div class="selection-label">Chọn phương thức ký số:</div>
                                    <select class="sign-select" id="sign-method">
                                        <option value="">Chọn phương thức ký</option>
                                        <option value="2">Ký bằng USB Token</option>
                                        <option value="1">Ký bằng Mobile Sign</option>
                                    </select>
                                </div>
                            </div>
                            <div class="center-element">
                                <button class="button-6 w-button" onclick="SignDoc()" type="submit">Xác nhận</button>
                            </div>

                        </div>
                    </div>


                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>


        <header id="nav" class="sticky-nav">
            <div class="close">
                <div class="file-name" id="name-file">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.</div>
            </div>
            <div class="nav-right">
                <div>
                    <div class="request-state" id="trangthaivb">Đang tiến hành</div>
                </div>
                <div class="nav-notification">
                    <img src="Content/images/Mask-Group-653.png" loading="lazy" alt="Notification" />
                </div>

                <div class="nav-divider"></div>
                <div class="nav-user">
                    <div class="user-avatar">
                        <div class="first-word-name" onclick="showUserMenu()">K</div>
                    </div>
                    <img src="Content/images/Drop Default.svg" loading="lazy" alt="" class="drop-default" />
                    <img src="Content/images/Drop Hover.svg" loading="lazy" alt="" class="drop-hover" />
                    <img src="Content/images/Drop Clicked.svg" loading="lazy" alt="" class="drop-clicked" />
                    <div class="user-dropdown">
                        <div class="user-drop-card">
                            <div class="user-name-card" id="name"></div>
                            <div class="user-email-card" id="gmail"></div>
                            <div class="card-divider add-margin"></div>
                            <a href="SettingAccount.aspx" class="option-button w-inline-block">
                                <img
                                    src="Content/images/Account Setting.svg" loading="lazy" alt="" class="icon-option">
                                <div class="option-text">Cài đặt tài khoản</div>
                            </a>
                            <a href="../setting/plan-and-billing.html" class="option-button w-inline-block">
                                <img
                                    src="Content/images/Plan.svg" loading="lazy" alt="" class="icon-option">
                                <div class="option-text">Gói dịch vụ</div>
                            </a>
                            <a href="#" class="option-button w-inline-block">
                                <img src="Content/images/Help.svg" loading="lazy"
                                    alt="" class="icon-option">
                                <div class="option-text">Trợ giúp và hỗ trợ</div>
                            </a>
                            <div class="card-divider"></div>
                            <%--  <asp:Button ID="Button1" runat="server" CssClass="option-button remove-padding w-inline-block" Text="Đăng xuất" OnClick="btnDangxuat_Click" />--%>
                            <a href="#" class="option-button remove-padding w-inline-block" onclick="Logout()">
                                <img src="Content/images/Log Out.svg"
                                    loading="lazy" alt="" class="icon-option">
                                <div class="option-text">Đăng xuất</div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="request-content">
            <div class="hide-background">
                <div class="checkbox-container">
                    <div class="form-block-2 w-form">
                        <label class="w-checkbox accept-checkbox">
                            <input type="checkbox" id="accept-checkbox-id" name="checkbox" data-name="Checkbox" class="w-checkbox-input"><span class="checkbox-label-2 w-form-label">Tôi đồng ý sử dụng phương thức ký điện tử và ký số để thực hiện giao dịch</span></label>
                    </div>
                </div>
            </div>
            <div class="request-tab">
                <div data-duration-in="300" data-duration-out="100" class="tabs-detail w-tabs">
                    <div class="tabs-menu w-tab-menu">
                        <a data-w-tab="Content" class="tab-link-tab-1 w-inline-block w-tab-link w--current">
                            <div class="text-block-8">Nội dung văn bản</div>
                        </a>
                        <a data-w-tab="Activity" class="tab-link-tab-2 w-inline-block w-tab-link">
                            <div class="text-block-7">Lịch sử hoạt động</div>
                        </a>
                    </div>
                    <div class="w-tab-content">
                        <div data-w-tab="Content" class="tab-pane-content w-tab-pane">
                            <div class="pdf-container">
                                <div class="center-viewer">
                                    <%--    <iframe id="pdf-files" style="border:1px solid #000000" title="PDF in an i-Frame" src="Content/images/demopdf.pdf"
                frameborder="1" scrolling="auto" height="780" width="1350"></iframe>--%>
                                    <div id="viewer1" style="width: 100%; height: 1000px;"></div>
                                </div>
                            </div>
                            <div class="footer-button w-clearfix">
                                <div class="sign-button-container">
                                    <a href="#" class="back-page w-button" id="tuchoi">Từ chối</a>
                                    <%--   <a href="#" id="sign-button1" onclick="clicked()" class="sign-button w-button">Gửi yêu cầu ký</a>--%>
                                    <a href="#" onclick="Getptk()" id="kyvb" class="sign-button w-button">Ký</a>

                                </div>
                            </div>
                        </div>

                        <div data-w-tab="Activity" class="w-tab-pane w--tab-active">
                            <div class="function-panel">
                                <div class="download-icon">
                                    <img src="Content/images/Download.png" loading="lazy" alt="">
                                </div>
                                <div class="print-icon">
                                    <img src="Content/images/Print.png" loading="lazy" alt="">
                                </div>
                            </div>
                            <div class="page-content">
                                <div class="request-infomation">
                                    <div class="request-heading">
                                        <div class="info-heading">Thông tin chi tiết</div>
                                    </div>
                                    <div class="request-body">
                                        <div class="request-text">
                                            <div class="info-wrapper">
                                                <div class="title-info">Tiêu đề Mail</div>
                                                <div class="subtitle-info" id="tieudemail">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.</div>
                                            </div>
                                            <div class="info-wrapper">
                                                <div class="title-info">ID Văn bản</div>
                                                <div class="subtitle-info" id="idvanban">647b1951-4d66-416f-8b84-5ac5e7a01d14</div>
                                            </div>
                                            <div class="info-wrapper">
                                                <div class="title-info">Ngày tạo văn bản</div>
                                                <div class="subtitle-info" id="ngaytaovb">15:05 13/12/2020</div>
                                            </div>
                                            <div class="info-wrapper">
                                                <div class="title-info">Ngày gửi</div>
                                                <div class="subtitle-info" id="ngaygui">15:05 15/12/2020</div>
                                            </div>
                                            <div class="info-wrapper" id="getinfo">
                                                <div class="title-info add-margin">Người nhận</div>

                                                <%--   <div class="recipient-info">
                                                    <div class="recipient-text">
                                                        <div class="subtitle-info">Trần Thu Thảo</div>
                                                        <div class="hint-text">thaotomnic@nacencomm.vn</div>
                                                    </div>
                                                    <div class="recipient-role">
                                                        <img src="Content/images/Receive a copy.png" loading="lazy" alt="" class="image-11">
                                                        <div class="subtitle-info">Nhận bản sao</div>
                                                    </div>
                                                </div>
                                                <div class="recipient-info">
                                                    <div class="recipient-text">
                                                        <div class="subtitle-info">Nguyễn Hoàng Hải</div>
                                                        <div class="hint-text">hainh@nacencomm.vn</div>
                                                    </div>
                                                    <div class="recipient-role">
                                                        <img src="Content/images/Sign.png" loading="lazy" alt="" class="image-11">
                                                        <div class="subtitle-info">Ký tài liệu</div>
                                                    </div>
                                                </div>--%>
                                            </div>
                                        </div>
                                        <div class="request-text">
                                            <div class="info-wrapper">
                                                <div class="title-info">Tên văn bản</div>
                                                <div class="subtitle-info" id="tenvb">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.</div>
                                            </div>
                                            <div class="info-wrapper">
                                                <div class="title-info">Người gửi</div>
                                                <div class="subtitle-info" id="tennguoigui">Nguyễn Trần Văn Khanh</div>
                                                <div class="hint-text" id="emailnguoigui">nguyentranvankhanh123@gmail.com</div>
                                            </div>
                                            <div class="info-wrapper">
                                                <div class="title-info">Trạng thái</div>
                                                <div class="request-state regular" id="trangthaivanban">Đang tiến hành</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="request-activity">
                                    <div class="activity-title">
                                        <div class="info-heading">Lịch sử hoạt động</div>
                                        <a href="#" class="sign-map w-inline-block">
                                            <div class="map-text">Xem sơ đồ lệnh ký</div>
                                            <img src="Content/images/Sign Map.png" loading="lazy" alt="">
                                        </a>
                                    </div>



                                </div>
                               <table class="table-index">
                                    <tr>
                                        <td>
                                            <div class="username">
                                                <div class="name-text">Người dùng</div>
                                            </div>
                                        </td>

                                        <td>
                                            <div class="username">
                                                <div class="name-text">Thời gian</div>
                                            </div>
                                        </td>

                                        <td>
                                            <div class="username">
                                                <div class="name-text">Hoạt động</div>
                                            </div>
                                        </td>
                                       <%--  <td>
                                            <div class="username">
                                                <div class="name-text">Trạng thái</div>
                                            </div>
                                        </td>--%>

                                    </tr>
                                </table>
                                <dx:ASPxGridView ID="grLogvb" runat="server" Width="100%" Theme="Default"  CssClass="boder-none" Border-BorderStyle="None">
                               
                                    <Templates>
                                        <DataRow>
                                              
                                            <table class="table-index">

                                                <tr>
                                                    <td style="width: 25%">
                                                        <%# Eval("Taikhoanthuchien") %>
                                                    </td>
                                                    <td style="width: 25%">
                                                        <%# Eval("Thoigian") %>
                                                                  
                                                    </td>
                                                    <td style="width: 30%;">
                                                        <%# Eval("Noidung") %>
                                                                   
                                                    </td>
                                                    
                                                </tr>
                                            </table>

                                        </DataRow>
                                    </Templates>
                                    <Settings ShowColumnHeaders="false" />
                                </dx:ASPxGridView>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <dx:ASPxCallback ID="cplogout" runat="server" OnCallback="cplogout_Callback" ClientInstanceName="cplogout">
            <ClientSideEvents CallbackComplete="EndLogout" />
        </dx:ASPxCallback>
        <dx:ASPxHiddenField ID="hdurl" runat="server" ClientInstanceName="hdurl"></dx:ASPxHiddenField>
        <dx:ASPxLoadingPanel ID="loading" runat="server" ClientInstanceName="loading" Text="Đang xử lý" Modal="true" />
        <dx:ASPxCallback ID="cpsign" runat="server" OnCallback="cpsign_Callback" ClientInstanceName="cpsign">
            <ClientSideEvents CallbackComplete="EndSignDoc" />
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cpendsign" runat="server" OnCallback="cpendsign_Callback" ClientInstanceName="cpendsign">
            <ClientSideEvents CallbackComplete="EndSign" />
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cpupdate" runat="server" OnCallback="cpupdate_Callback" ClientInstanceName="cpupdate">
            <ClientSideEvents CallbackComplete="UpdateSignDoc" />
        </dx:ASPxCallback>
        <dx:ASPxTextBox ID="txtstartx" ClientInstanceName="txtstartx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtstarty" ClientInstanceName="txtstarty" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtendx" ClientInstanceName="txtendx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtendy" ClientInstanceName="txtendy" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="Scripts/js/webflow.js" type="text/javascript"></script>
        <script src="Scripts/js/pages/accept-checkbox.js"></script>
        <script src="lib/webviewer.min.js"></script>
        <script>





            //function clicked() {
            //    pop.Show();
            //}

            //function Closepop() {
            //    pop.Hide();
            //}



            Object.defineProperty(Date.prototype, 'YYYYMMDDHHMMSS', {
                value: function () {
                    function pad2(n) {  // always returns a string
                        return (n < 10 ? '0' : '') + n;
                    }

                    return this.getFullYear() +
                        pad2(this.getMonth() + 1) +
                        pad2(this.getDate()) +
                        pad2(this.getHours()) +
                        pad2(this.getMinutes()) +
                        pad2(this.getSeconds());
                }
            });
            $(document).ready(function () {
                pop.Hide();
                var tieudemail = sessionStorage.getItem("tieudemail");
                var idfile = localStorage.getItem("idFile");
                var tenvanban = sessionStorage.getItem("tenvb");
                var nguoigui = sessionStorage.getItem("taikhoantao");
                var ngaytao = sessionStorage.getItem("ngaytao");
                var ngaygui = sessionStorage.getItem("thoigiangui");
                var trangthaiky = sessionStorage.getItem("trangthaiky");
                var blurBackground = document.querySelector(".hide-background");
                var checkdl = sessionStorage.getItem("checkdl");
                var trangthaibutton = sessionStorage.getItem("trangthaibutton");
                var hinhthucky = sessionStorage.getItem("hinhthucky");
                var taikhoanky = sessionStorage.getItem("taikhoanky");
                var tennguoitao = sessionStorage.getItem("tennguoitao");
                var tennguoiky = sessionStorage.getItem("tennguoiky");
                var tenky = tennguoiky.split(",");
                var taikhoan = taikhoanky.split(",");
                var hinhthuc = hinhthucky.split(",");
                for (var i = 0; i < taikhoan.length; i++) {
                    if (hinhthuc[i] == 0) {
                        $("#getinfo").append('<div class="recipient-info"><div class="recipient-text"><div class="subtitle-info" id="tennguoinhan">' + tenky[i] + '</div><div class="hint-text" id="emailnguoinhan">' + taikhoan[i] + '</div></div><div class="recipient-role"><img src="Content/images/Sign.png" loading="lazy" alt="" class="image-11"><div class="subtitle-info">' + hinhthuc[i] + '</div></div></div>');
                    } else if (hinhthuc[i] == 1) {
                        $("#getinfo").append('<div class="recipient-info"><div class="recipient-text"><div class="subtitle-info" id="tennguoinhan">' + tenky[i] + '</div><div class="hint-text" id="emailnguoinhan">' + taikhoan[i] + '</div></div><div class="recipient-role"><img src="Content/images/Sign.png" loading="lazy" alt="" class="image-11"><div class="subtitle-info">Ký số</div></div></div>');

                    } else if (hinhthuc[i] == 2) {
                        $("#getinfo").append('<div class="recipient-info"><div class="recipient-text"><div class="subtitle-info" id="tennguoinhan">' + tenky[i] + '</div><div class="hint-text" id="emailnguoinhan">' + taikhoan[i] + '</div></div><div class="recipient-role"><img src="Content/images/Sign.png" loading="lazy" alt="" class="image-11"><div class="subtitle-info">Nhận bản sao</div></div></div>');

                    }

                }

                if (trangthaiky == 1) {
                    blurBackground.style.display = "none";
                }
                if (trangthaibutton == 2) {
                    document.getElementById('kyvb').style.opacity = 0;
                    document.getElementById('tuchoi').style.opacity = 0;
                }
                var datesend = new Date(ngaygui);
                var daterecei = new Date(ngaytao);
                var ngayguivanban = datesend.getHours() + ":" + datesend.getMinutes() + " " + datesend.getDay() + "/" + datesend.getMonth() + "/" + datesend.getFullYear();
                var ngaytaovanban = daterecei.getHours() + ":" + daterecei.getMinutes() + " " + daterecei.getDay() + "/" + daterecei.getMonth() + "/" + daterecei.getFullYear();
                document.getElementById("tieudemail").innerHTML = tieudemail;
                document.getElementById("idvanban").innerHTML = idfile;
                document.getElementById("tenvb").innerHTML = tenvanban;
                document.getElementById("tennguoigui").innerHTML = tennguoitao;
                document.getElementById("ngaytaovb").innerHTML = ngaytaovanban;
                document.getElementById("ngaygui").innerHTML = ngayguivanban;
                document.getElementById("tieudemail").innerHTML = tieudemail;
                document.getElementById("emailnguoigui").innerHTML = nguoigui;

                var name = sessionStorage.getItem("name");
                var email = sessionStorage.getItem("email");
                document.getElementById("name").innerHTML = name;
                document.getElementById("gmail").innerHTML = email;
                var tenvb = sessionStorage.getItem("tenvb");
                document.getElementById("name-file").innerHTML = tenvb;
                var trangthaivb = sessionStorage.getItem("trangthaivb");

                if (trangthaivb == 1) {
                    document.getElementById("trangthaivb").innerHTML = "Nháp";
                    document.getElementById("trangthaivanban").innerHTML = "Nháp";
               
                } else if (trangthaivb == 2) {
                    document.getElementById("trangthaivb").innerHTML = "Chờ ký";
                    document.getElementById("trangthaivanban").innerHTML = "Chờ ký";
                  
                } else if (trangthaivb == 3) {
                    document.getElementById("trangthaivb").innerHTML = "Ký hoàn tất";
                    document.getElementById("trangthaivanban").innerHTML = "Ký hoàn tất";
                   
                } else if (trangthaivb == 4) {
                    document.getElementById("trangthaivb").innerHTML = "Từ chối";
                    document.getElementById("trangthaivanban").innerHTML = "Từ chối";
                   
                } else if (trangthaivb == 5) {
                    document.getElementById("trangthaivb").innerHTML = "Thu hồi";
                    document.getElementById("trangthaivanban").innerHTML = "Thu hồi";
                  
                } else if (trangthaivb == 6) {
                    document.getElementById("trangthaivb").innerHTML = "Xóa";
                    document.getElementById("trangthaivanban").innerHTML = "Xóa";
                   
                }

                var duongdan = localStorage.getItem("urlFile");
                var doc = duongdan;
                hdurl.Set('value', doc);
                sessionStorage.setItem("path", doc);
                sessionStorage.setItem('document', doc);
                if (duongdan != null || duongdan != '') {
                    localStorage.setItem('value', duongdan);

                    const instance = getInstance();
                    if (instance != null) {
                        instance.loadDocument(doc);
                    }
                    else {

                        WebViewer(
                            {
                                //    path: 'http://localhost:8001/lib/',
                                path: 'http://localhost:58988/lib/',
                                //pdftronServer: 'http://localhost:8001',
                                initialDoc: doc,
                            },
                            document.getElementById('viewer1')
                        ).then(instance => {
                            //samplesSetup(instance);
                            const { Annotations, docViewer, annotManager } = instance;
                            const getMouseLocation = e => {
                                const { docViewer, annotManager } = instance;
                                const scrollElement = docViewer.getScrollViewElement();
                                const scrollLeft = scrollElement.scrollLeft || 0;
                                const scrollTop = scrollElement.scrollTop || 0;
                                //var pagenumber = docViewer.getCurrentPage();
                                const doc = docViewer.getDocument();
                                ////const pdfCoords = doc.getViewerCoordinates(pagenumber, e.x, e.y); 
                                //const viewerCoords1  = doc.getViewerCoordinates(pagenumber, e.x, e.y);
                                //const pdfCoords = doc.getPDFCoordinates(pagenumber, viewerCoords.x, viewerCoords.y);
                                var windowCoordinates = { x: e.pageX + scrollLeft, y: e.pageY + scrollTop }
                                const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                                const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                                const clickedPage = (page.first !== null) ? page.first : docViewer.getCurrentPage();
                                const pageCoordinates = displayMode.windowToPage(windowCoordinates, clickedPage);
                                const viewerCoords = doc.getViewerCoordinates(clickedPage, pageCoordinates.x, pageCoordinates.y);
                                sessionStorage.setItem('x', viewerCoords.x);
                                sessionStorage.setItem('y', viewerCoords.y);
                                return {
                                    x: viewerCoords.x, // e.pageX + scrollLeft,
                                    y: viewerCoords.y //e.pageY + scrollTop
                                };



                            };

                            instance.setHeaderItems(header => {
                                header.push({
                                    type: 'actionButton',
                                    img: '/img/logoNCM1.png',
                                    onClick: async () => {
                                        const doc = docViewer.getDocument();
                                        const xfdfString = await annotManager.exportAnnotations();
                                        const data = await doc.getFileData({
                                            // saves the document with annotations in it
                                            xfdfString
                                        });
                                        const arr = new Uint8Array(data);
                                        const blob = new Blob([arr], { type: 'application/pdf' });

                                        var a = "test";
                                        // sessionStorage.setItem('val',blob);

                                        var reader = new FileReader();
                                        reader.readAsDataURL(blob);
                                        reader.onloadend = function () {
                                            var base64data = reader.result;
                                            sessionStorage.setItem('val', base64data);
                                            cpsave.PerformCallback(base64data);
                                        }
                                        //   cpsave.PerformCallback(blob);
                                        //window.saveAs(blob, a + '.pdf');
                                    }
                                })

                                docViewer.on('mouseLeftDown', e => {
                                    // refer to getMouseLocation implementation above
                                    const windowCoordinates = getMouseLocation(e);
                                    //  console.log(windowCoordinates);
                                    txtstartx.SetText(windowCoordinates.x);
                                    txtstarty.SetText(windowCoordinates.y);
                                });

                                docViewer.on('mouseLeftUp', e => {
                                    // refer to getMouseLocation implementation above
                                    const windowCoordinates = getMouseLocation(e);
                                    const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                                    const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                                    //  console.log(windowCoordinates);
                                    txtendx.SetText(windowCoordinates.x);
                                    txtendy.SetText(windowCoordinates.y);
                                    const clickedPage = docViewer.getCurrentPage();
                                    const rectangleAnnot = new Annotations.RectangleAnnotation();
                                    rectangleAnnot.PageNumber = clickedPage;
                                    // values are in page coordinates with (0, 0) in the top left

                                    var startx, starty, endx, endy;
                                    startx = txtstartx.GetText();
                                    starty = txtstarty.GetText();
                                    endx = txtendx.GetText();
                                    endy = txtendy.GetText();

                                    var width, height;
                                    width = Math.abs(endx - startx);
                                    height = Math.abs(starty - endy);

                                    const doc = docViewer.getDocument();
                                    var point = { x: startx, y: starty }
                                    const viewerCoords1 = doc.getViewerCoordinates(clickedPage, startx, starty);

                                    rectangleAnnot.X = viewerCoords1.x;
                                    rectangleAnnot.Y = viewerCoords1.y;
                                    rectangleAnnot.Width = width;
                                    rectangleAnnot.Height = height;
                                    annotManager.redrawAnnotation(rectangleAnnot);
                                    var signinfo = txtstartx.GetText() + " " + txtstarty.GetText() + " " + width + " " + height + " " + clickedPage;
                                    sessionStorage.setItem("signInfo", signinfo);
                                    sessionStorage.setItem("signpage", clickedPage);

                                });
                            });
                        });
                    }
                } else {
                    alert('Không tìm thấy file');
                }


            });


        </script>
        <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
        <script src="Scripts/js/pages/add-signature-modal.js"></script>
    </form>
</body>
</html>

