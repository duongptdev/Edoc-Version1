<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="DigitalSignture.aspx.vb" Inherits="DigitalSignture" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script>
        function myFunction() {
            var value = $("#sign-method").val();
            if (value == 1) {
                $("#passregis").removeAttr('hidden');
                $("#serial").attr("hidden", true);
                $("#idcts").attr("hidden", true);
            } else if (value == 2) {

                $("#serial").removeAttr('hidden');
                $("#passregis").attr("hidden", true);
                $("#idcts").attr("hidden", true);
            }

            else if (value == 3) {
                $("#idcts").removeAttr('hidden');
                $("#serial").attr('hidden', true);
                $("#passregis").attr('hidden', true);
            }

        }
        function AddSerial() {

            cpusbtoken.PerformCallback();
        }
        function SerialMobile() {
            var serialmobile = $("#serial-mobile").val();
            cpmobileserial.PerformCallback(serialmobile);
        }
        function IdctsMobile() {
            var idctsmobile = $("#idcts-passcode").val();
            cpmobileidcts.PerformCallback(idctsmobile);
        }
        function Endusbtoken(s, e) {
            if (e.result == 1) {
                alert("Thiết lập thành công");
                window.location.href = "DigitalSignture.aspx";

            } else if (e.result == 0) {
                alert("Thiết lập không thành công");
            } else if (e.result == -1) {
                alert("Lỗi hệ thống");
            } else if (e.result == -3) {
                alert("Serial không được trống");
            } else if (e.result == -4) {
                alert("Tài khoản không hợp lệ");
            }
        }
        function Endmobileserial(s, e) {
            if (e.result == 1) {
                alert("Thiết lập thành công");
                window.location.href = "DigitalSignture.aspx";

            } else if (e.result == 0) {
                alert("Thiết lập không thành công");
            } else if (e.result == -1) {
                alert("Lỗi hệ thống");
            } else if (e.result == -3) {
                alert("CTS mobilesign không tồn tại hoặc không hợp lệ");
            } else if (e.result == -4) {
                alert("Tài khoản không hợp lệ");
            }
        }
        function Endmobileidcts(s, e) {
            if (e.result == 1) {
                alert("Thiết lập thành công");
                window.location.href = "DigitalSignture.aspx";

            } else if (e.result == 0) {
                alert("Thiết lập không thành công");
            } else if (e.result == -1) {
                alert("Lỗi hệ thống");
            } else if (e.result == -3) {
                alert("CTS mobilesign không tồn tại hoặc không hợp lệ");
            } else if (e.result == -4) {
                alert("Tài khoản không hợp lệ");
            }
        }
    </script>
    <div class="setting-body">
        <div class="setting-menu">
            <div class="title-menu">cài đặt</div>
            <a href="SettingAccount.aspx" class="menu-item-link w-inline-block">
                <div class="menu-item-text">Thiết lập tài khoản</div>
            </a>
            <a href="Electronic-Signature.aspx" class="menu-item-link w-inline-block">
                <div class="menu-item-text">Chữ ký điện tử</div>
            </a>
            <a href="DigitalSignture.aspx" class="menu-item-link w-inline-block">
                <div class="menu-item-text">Chữ ký số</div>
            </a>
            <a href="PassWord.aspx" aria-current="page" class="menu-item-link w-inline-block w--current">
                <div class="menu-item-text">Mật khẩu</div>
            </a>
            <a href="#" class="menu-item-link w-inline-block">
                <div class="menu-item-text">Gói dịch vụ</div>
            </a>
        </div>
        <div class="setting-content">
            <div class="title-body">Chữ ký số</div>
            <div class="subtitle-body">
                Kết nối tài khoản Mobile Sign với thiết bị, đảm bảo quy trình ký tài liệu diễn
                ra<br>
                nhanh chóng và tiện lợi
            </div>
            <div class="add-signature-button">
                <!-- <div class="button-text">Vui lòng quét mã QR Code để kết nối với tài khoản Mobile Sign</div>
                <img src="../images/QR-Code.png" loading="lazy" alt="" class="image-14"> -->
                <div class="button-text">Chọn phương thức ký số:</div>
                <select class="sign-select" id="sign-method" onchange="myFunction()">
                    <option value="">Chọn phương thức ký</option>
                    <option value="2">Ký bằng USB Token</option>
                    <option value="1">Ký bằng Mobile Sign Serial</option>

                    <option value="3">Ký bằng Mobile Sign mã CTS</option>
                </select>
            </div>

            <div id="serial" hidden>
                <div class="button-text">Thiết lập ký USB token</div>

                <input type="submit" class="form-button button-color w-button" onclick="AddSerial()" value="Gửi" />
            </div>

            <div id="passregis" hidden>
                <div class="button-text">Nhập serial</div>
                <input id="serial-mobile" class="register-input" type="text" required="required" />
                <input type="submit" class="form-button button-color w-button" onclick="SerialMobile()" value="Gửi" />
            </div>
            <div id="idcts" hidden>
                <div class="button-text">Nhập CTS:</div>
                <input id="idcts-passcode" class="register-input" type="text" required="required" />
                <input type="submit" class="form-button button-color w-button" onclick="IdctsMobile()" value="Gửi" />
            </div>



            <div class="digital-certificate">
                <div class="cert-text">Thông tin chứng thư số</div>
                <div class="cert-info">
                    <div class="info-field">
                        <div class="cert-label">Tên chứng thư:</div>
                        <div class="cert-input">Trần Văn Khanh</div>
                    </div>
                    <div class="info-field">
                        <div class="cert-label">Số Serial:</div>
                        <div class="cert-input">5402BC5ACE669C20150000000379</div>
                    </div>
                    <div class="info-field">
                        <div class="cert-label">Thiết bị:</div>
                        <div class="cert-input">PC-DE5Z 009</div>
                    </div>
                    <div class="info-field">
                        <div class="cert-label">Device ID:</div>
                        <div class="cert-input">HFNS-JSHEFHU-ZJSD-BHD</div>
                    </div>
                    <div class="info-field">
                        <div class="cert-label">Ngày cấp:</div>
                        <div class="cert-input">15:23 15/05/2019</div>
                    </div>
                    <div class="info-field">
                        <div class="cert-label">Ngày hết hạn:</div>
                        <div class="cert-input">15/05/2021</div>
                    </div>
                    <div class="info-field">
                        <div class="cert-label">Đơn vị cấp:</div>
                        <div class="cert-input">Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
                    </div>
                </div>
                <a href="#" class="disable-cert w-inline-block">
                    <img src="../images/Disable-Icon.png" loading="lazy"
                        alt="">
                    <div class="text-block-17">Ngắt kết nối</div>
                </a>
            </div>
        </div>
    </div>
    <dx:ASPxCallback ID="cpusbtoken" OnCallback="cpusbtoken_Callback" runat="server" ClientInstanceName="cpusbtoken">
        <ClientSideEvents CallbackComplete="Endusbtoken" />
    </dx:ASPxCallback>
    <dx:ASPxCallback ID="cpmobileserial" OnCallback="cpmobileserial_Callback" runat="server" ClientInstanceName="cpmobileserial">
        <ClientSideEvents CallbackComplete="Endmobileserial" />
    </dx:ASPxCallback>
    <dx:ASPxCallback ID="cpmobileidcts" OnCallback="cpmobileidcts_Callback" runat="server" ClientInstanceName="cpmobileidcts">
        <ClientSideEvents CallbackComplete="Endmobileidcts" />
    </dx:ASPxCallback>
</asp:Content>
