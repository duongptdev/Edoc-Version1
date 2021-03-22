<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddSigntureField.aspx.vb" Inherits="AddSigntureField" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Jan 19 2021 02:07:46 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="60011c5a12fdee57bc58cace" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8">
    <title>Add Signature Field</title>
    <meta content="Add Signature Field" property="og:title">
    <meta content="Add Signature Field" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script
        type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script type="text/javascript">
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
        var ptsign = [];
        var infosign = [];
        var code = [];
        var trangky = [];

        function Getptky() {

            sessionStorage.setItem("ptky", "0");
            //$("#digi-sign").prop('disabled', !$("#digi-sign").prop("disabled"))
            ptsign.push(0);
            var info = sessionStorage.getItem("signInfo");
            infosign.push(info);
            var codesign = new Date().YYYYMMDDHHMMSS();
            code.push(codesign);
            var signpage = sessionStorage.getItem("signpage");
            trangky.push(signpage);
        }
        function Getpthuck() {

            sessionStorage.setItem("ptky", "1");
            //$("#elec-sign").prop('disabled', !$("#elec-sign").prop("disabled"))    
            $("#btnTiepTuc").removeAttr("disabled").removeClass("disable-button");
            ptsign.push(1);
            var info = sessionStorage.getItem("signInfo");
            infosign.push(info);
            var codesign = new Date().YYYYMMDDHHMMSS();
            code.push(codesign);
            var signpage = sessionStorage.getItem("signpage");
            trangky.push(signpage);
        }
        function Getsign() {
            var phuongthuc = $("#sign-method").val();

            pop.Hide();
        }
        $(document).ready(function (s, e) {
            var name = sessionStorage.getItem("name");
            var email = sessionStorage.getItem("email");
            document.getElementById("name").innerHTML = name;
            document.getElementById("gmail").innerHTML = email;
            var sessionValue = '<%= Session("Namefile") %>';
            var na = localStorage.getItem("name");
            var name = na.split(",");
            for (var i = 0; i < name.length; i++) {
                $("#signer").append($('<option>',
                    {
                        value: i,
                        text: name[i]
                    }));
            }
            if (sessionValue != null) {
                document.getElementById("filename").innerHTML = sessionValue;

            }
            var sessionUser = '<%= Session("Login") %>';
            var seri ='<%= Session("Serial") %>';
            localStorage.setItem("serial", seri);



            var urlFile = localStorage.getItem("urlFile");

            var duongdan = urlFile;

            var doc = duongdan;


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


        function SignDoc() {
           
            //var inFo = sessionStorage.getItem("signInfo");
            //var arr = sessionStorage.getItem("infoSign");
            //var array = [];
            //array.push(inFo, arr);
            //sessionStorage.setItem("Info", array);
            phuongthuc = sessionStorage.getItem("ptky");
            sessionStorage.setItem("ptsign", ptsign);
            sessionStorage.setItem("ifsign", infosign);
            var htk = localStorage.getItem("htky");
            var countht = htk.split(",").length;
            var inffo = sessionStorage.getItem("ifsign");
            var countinfo = inffo.split(",").length;
            if (countinfo==countht) {
                loading.Hide();
                var linkfile = sessionStorage.getItem('document');
                var tk = localStorage.getItem("email");
                var ttk = localStorage.getItem("ttk");
                var htk = localStorage.getItem("htky");

                //cpky.PerformCallback(code + "|" + tkhoan + "|" + linkfile + "|" + info);
                cpSigndoc.PerformCallback(linkfile + "|" + code + "|" + tk + "|" + infosign + "|" + ttk + "|" + htk + "|" + trangky + "|" + ptsign);
            } else if (countht > countinfo) {
                alert("Bạn chọn thiếu vùng ký");
                return false;
            }
            else {
                alert("Chưa chọn phương thức ký");
            }


        }

        function EndSign(s, e) {
            if (e.result == 1) {
                window.location.href = "ReviewandSend.aspx";
            } else if (e.result == 0) {
                alert("Thiết lập vùng ký không thành công");
            } else if (e.result == -1) {
                alert("Lỗi hệ thống");
            }
        }
    </script>
    <script>
        //$("#btnTiepTuc").click(function () {
        //    window.location.href = "ReviewandSend.aspx";
        //});
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
<body class="body-3">
    <form id="form1" runat="server">
        <%--   <dx:ASPxPopupControl ID="pop" ClientInstanceName="pop" runat="server" Width="400px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div class="background-modal" style="display:normal!important">
        <div class="modal-form" style="display:normal">
            <div class="heading-modal align-right">
                <div class="close-button">
                    <img src="Content/images/Path-30115.png" loading="lazy" alt="Close Modal" onclick="Closepop();"></div>
            </div>
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
                <div class="digital-cert-icate">
                    <div class="selection-label">Chứng thư số:</div>
                    <select class="sign-select" id="digital-cert">
                        <option value="digital-certificate">5402BC5ACE669C20150000000379</option>
                    </select>
                </div>
                <div id="usb-token" class="usb-token">
                    <div class="certificate-text">
                        <div class="label">Tên chứng thư:</div>
                        <div class="label-content">Nguyễn Trần Văn Khanh</div>
                    </div>
                    <div class="certificate-text">
                        <div class="label">Ngày cấp:</div>
                        <div class="label-content">15:23 15/05/2019</div>
                    </div>
                    <div class="certificate-text">
                        <div class="label">Ngày hết hạn:</div>
                        <div class="label-content">15/05/2021</div>
                    </div>
                    <div class="certificate-text no-margin">
                        <div class="label">Đơn vị cấp:</div>
                        <div class="label-content">Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
                    </div>
                </div>
                <div id="mobile-sign" class="mobile-sign">
                    <div class="certificate-text">
                        <div class="label">Tên chứng thư:</div>
                        <div class="label-content">Nguyễn Trần Văn Khanh</div>
                    </div>
                    <div class="certificate-text">
                        <div class="label">Thiết bị:</div>
                        <div class="label-content">PC-DE5Z 009</div>
                    </div>
                    <div class="certificate-text">
                        <div class="label">Device ID:</div>
                        <div class="label-content">HFNS-JSHEFHU-ZJSD-BHD</div>
                    </div>
                    <div class="certificate-text">
                        <div class="label">Ngày cấp:</div>
                        <div class="label-content">15:23 15/05/2019</div>
                    </div>
                    <div class="certificate-text">
                        <div class="label">Ngày hết hạn:</div>
                        <div class="label-content">15/05/2021</div>
                    </div>
                    <div class="certificate-text no-margin">
                        <div class="label">Đơn vị cấp:</div>
                        <div class="label-content">Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
                    </div>
                </div>
                <div class="qr-code">
                    <img src="images/QR-Code.png" loading="lazy" alt="" class="image-13">
                    <div class="hint-qr">Vui lòng quét mã QR Code để kết nối với tài khoản Mobile Sign</div>
                </div>
            </div>
            <div class="center-element">
                <a class="button-6 w-button" onclick="Getsign()" >Xác nhận</a>
            </div>

        </div>
    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>--%>

        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script src="FileSaver.min.js"></script>
        <script type="text/javascript">  
            function EndRender(s, e) {
                var res = e.result;
                if (res == 1) {
                    alert('Lưu file thành công');
                }
                else {
                    alert(res);
                }
            }


            function EndSignDoc(s, e) {
                loading.Hide();
                var res = e.result;
                if (res == 1) {
                    alert('Ký văn bản thành công');
                    var doc = s.cp_path;

                    const instance = getInstance();
                    instance.loadDocument(doc);

                }
                else {
                    alert('Có lỗi:' + res);
                }
            }

            function RefreshDoc() {
                var doc = hdduongdan.Get('value');//sessionStorage.getItem('document')

                const instance = getInstance();
                if (instance != null) {
                    alert('not null');
                    instance.closeDocument().then(function () {
                        console.log('Document is closed');
                        instance.loadDocument(doc);
                    });

                }
            }

            function EndKy(s, e) {

            }
        </script>

        <script src="lib/webviewer.min.js"></script>
        <script src="modernizr.custom.min.js"></script>
        <dx:ASPxLoadingPanel ID="loading" runat="server" ClientInstanceName="loading" Text="Đang xử lý" Modal="true" />
        <script src="old-browser-checker.js"></script>
        <%--<script src="global.js"></script>--%>
        <dx:ASPxHiddenField ID="hdserial" runat="server" ClientInstanceName="hdserial"></dx:ASPxHiddenField>
        <dx:ASPxHiddenField ID="hdphuongthuc" runat="server" ClientInstanceName="hdphuongthuc"></dx:ASPxHiddenField>
        <dx:ASPxHiddenField ID="hdUser" runat="server" ClientInstanceName="hduser"></dx:ASPxHiddenField>
        <dx:ASPxHiddenField ID="hdduongdan" ClientInstanceName="hdduongdan" runat="server"></dx:ASPxHiddenField>
        <dx:ASPxCallback ID="cpSave" runat="server" OnCallback="cpSave_Callback" ClientInstanceName="cpsave">
            <ClientSideEvents CallbackComplete="EndRender" />
        </dx:ASPxCallback>
        <%--   <dx:ASPxCallback ID="cpky" runat="server" OnCallback="cpky_Callback" ClientInstanceName="cpky">
            <ClientSideEvents CallbackComplete="EndKy" />
        </dx:ASPxCallback>--%>
        <dx:ASPxCallback ID="cpsign" runat="server" OnCallback="cpsign_Callback" ClientInstanceName="cpsign">
            <ClientSideEvents CallbackComplete="EndSignDoc" />
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cpSigndoc" runat="server" OnCallback="cpSigndoc_Callback" ClientInstanceName="cpSigndoc">
            <ClientSideEvents CallbackComplete="EndSign" />
        </dx:ASPxCallback>

        <dx:ASPxTextBox ID="txtstartx" ClientInstanceName="txtstartx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtstarty" ClientInstanceName="txtstarty" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtendx" ClientInstanceName="txtendx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtendy" ClientInstanceName="txtendy" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <header id="nav" class="sticky-nav">
            <div class="close">
                                <a href="index.html" class="back-to-home w-inline-block">
                    <img src="Content/images/Icons-Close-16px.svg"
                        loading="lazy" alt="" /></a>
                <div class="file-name" id="filename"></div>
            </div>
            <div class="nav-right">
                <div class="nav-notification">
                    <img src="Content/images/Mask-Group-653.png" loading="lazy" alt="Notification" />
                </div>
                <div class="nav-divider"></div>
                <div class="nav-user">

                <div class="user-avatar">
                    <div class="first-word-name">K</div>
                </div><img src="Content/images/Drop Default.svg" loading="lazy" alt="" class="drop-default"><img
                    src="../images/Drop-Hover.svg" loading="lazy" alt="" class="drop-hover"><img
                    src="../images/Drop-Clicked.svg" loading="lazy" alt="" class="drop-clicked">
                <div class="user-dropdown">
                    <div class="user-drop-card">
                        <div class="user-name-card">Nguyễn Trần Văn Khanh</div>
                        <div class="user-email-card">nguyentranvankhanh123@gmail.com</div>
                        <div class="card-divider add-margin"></div>
                        <a href="../settings.html" class="option-button w-inline-block"><img
                                src="Content/images/Account-Setting.svg" loading="lazy" alt="" class="icon-option">
                            <div class="option-text">Cài đặt tài khoản</div>
                        </a>
                        <a href="../setting/plan-and-billing.html" class="option-button w-inline-block"><img
                                src="Content/images/Plan.svg" loading="lazy" alt="" class="icon-option">
                            <div class="option-text">Gói dịch vụ</div>
                        </a>
                        <a href="#" class="option-button w-inline-block"><img src="Content/images/Help.svg" loading="lazy"
                                alt="" class="icon-option">
                            <div class="option-text">Trợ giúp và hỗ trợ</div>
                        </a>
                        <div class="card-divider"></div>
                        <a href="#" class="option-button remove-padding w-inline-block">
                            <img src="Content/images/Log-Out.svg"
                                loading="lazy" alt="" class="icon-option">
                            <asp:Button ID="btnDangxuat" runat="server" CssClass="option-text" Text="Đăng xuất" OnClick="btnDangxuat_Click" />
                        </a>

                    </div>
                </div>
            </div>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row row-margin">
                <div style="padding-left: 50px;" class="col-sm-2">
                    <form action="review-and-send.html" class="function-container">
                        <select class="filter-select" name="signer" id="signer"></select>
                        <button id="selection-input" type="submit" class="w-hidden">Tiếp tục</button>
                    </form>
                    <div class="function-text">
                        <div class="function-title">Gán trường ký</div>
                        <div class="function-divider"></div>
                    </div>
                    <div class="function-button">
                        <button type="button" id="digi-sign" class="signature-button w-button" onclick="Getpthuck()">
                            <img src="Content/images/Icons- D-Signature.png" class="margin-icon" alt="icon">
                            Chữ ký số
                        </button>
                        <button type="button" id="elec-sign" class="signature-button w-button" onclick="Getptky()">
                            <img src="Content/images/Icons- E-Signature.png" class="margin-icon" alt="icon">
                            Chữ ký điện tử
                        </button>
                    </div>
                    <div class="sign-hint">Hướng dẫn: Chọn và khoanh vùng trường ký vào khu vực ký mong muốn</div>
                </div>
                <div class="col-sm-10">

                    <div style="width: 100%;">
                        <%--   <div style="float: left">
                            <img src="Content/images/icons8-info-40.png" style="height: 32px" />
                            Bấm và giữ chuột để chọn vùng ký! <a href="#" onclick="SignDoc()">Bấm vào đây để ký văn bản</a>
                            <%--  &nbsp;&nbsp;&nbsp;<a href="#" onclick="RefreshDoc()">Xem văn bản đã ký</a>
                        </div>--%>

                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100px">
                                    <dx:ASPxButton ID="btnSign" runat="server" Text="Sign" OnClick="btnSign_Click" ClientVisible="false" />
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </div>


                    <div id="viewer1" style="width: 100%; height: 1000px;"></div>
                    <%-- <iframe id="Iframe1" runat="server" width="100%" height="1000px"></iframe>--%>
                </div>
            </div>
        </div>
        <div class="footer-button">
            <div class="add-receiver-button add-width">
                <a href="add-receiver.html" class="back-button w-button">Quay lại</a>
                <%--<a href="#" id="btnTiepTuc" onclick="SignDoc()" class="next-button w-button">Tiếp tục</a>--%>
                <input id="btnTiepTuc" type="submit" name="sign-now" value="Tiếp tục" onclick="SignDoc()" class="sign-button disable-button w-button" disabled />
            </div>
        </div>

        <dx:ASPxCallback ID="cplogout" runat="server" OnCallback="cplogout_Callback" ClientInstanceName="cplogout">
            <ClientSideEvents CallbackComplete="EndLogout" />
        </dx:ASPxCallback>



        <script src="Scripts/js/e-dropdown.js"></script>

        <script>
            //$("#btnTiepTuc").click(function () {
            //    window.location.href = "ReviewandSend.aspx";
            //});
            $("#btnDangxuat").click(function () {
                localStorage.clear();
                sessionStorage.clear();
            });
        </script>

<%--             <dx:ASPxCallback ID="cplogout" runat="server" OnCallback="cplogout_Callback" ClientInstanceName="cplogout">
                <ClientSideEvents CallbackComplete="EndLogout" />
            </dx:ASPxCallback>--%>
    

    </form>

</body>

</html>
