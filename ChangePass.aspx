<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="ChangePass.aspx.vb" Inherits="ChangePass" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
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
            <div class="title-body">Mật khẩu</div>
            <div class="subtitle-body">Chủ động quản lý quyền riêng tư và bảo mật của bạn. Giữ cho mật khẩu của bạn<br>
                an toàn và luôn được cập nhật.</div>
            <div class="change-password-form">
                <div class="form-block-3 w-form">
                  
                        <div class="current-password">
                            <label for="Current-Password" class="new-pass-label">Mật khẩu hiện tại</label>
                            <input type="password" id="oldpass" class="w-input" maxlength="256" name="Current-Password" data-name="Current Password" placeholder="Nhập mật khẩu hiện tại" id="Current-Password" required="">
                        </div>
                        <div class="new-password">
                            <label for="New-Password" class="new-pass-label">Mật khẩu mới</label>
                            <input type="password" id="newpass" class="new-field w-input" maxlength="256" name="New-Password" data-name="New Password" placeholder="Nhập mật khẩu mới" id="New-Password" required="">
                            <input type="password" id="renewpass" class="retype-field w-input" maxlength="256" name="Re-type-Password" data-name="Re-type Password" placeholder="Nhập lại mật khẩu mới" id="Re-type-Password" required="">
                        </div>
                        <div class="password-hint">
                            <div class="hint-container">
                                <div class="rectangle"></div>
                                <div class="hint-content">Mật khẩu tối thiểu 6 ký tự</div>
                            </div>
                            <div class="hint-container add-margin">
                                <div class="rectangle"></div>
                                <div class="hint-content">Không chứa các ký tự đặc biệt /, &gt;, &lt; và dấu cách</div>
                            </div>
                        </div>
                        <div class="pass-form-button">
                            <a href="#" class="transparent-button w-button">Bỏ qua</a><input type="submit" value="Cập nhật" data-wait="" id="btnChangePass" class="update-password-button w-button">
                        </div>
                  
                    <div class="w-form-done">
                        <div>Thank you! Your submission has been received!</div>
                    </div>
                    <div class="w-form-fail">
                        <div>Oops! Something went wrong while submitting the form.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $("#btnChangePass").click(function () {
            var opass = $("#oldpass").val();
            var npass = $("#newpass").val();
          
            cpChangPass.PerformCallback(opass + "|" + npass);
        });
        function ChangPass(s, e) {
            var arr = e.result;
            if (arr == 1) {
                alert("Đổi mật khẩu thành công");
                window.location.href = "SettingAccount.aspx";
            } else if (arr == 0) {
                alert("Tài khoản không tồn tại");
            } else if (arr == -1) {
                alert("Lỗi hệ thống");
            } else {
                alert(arr);
            }
        };
    </script>
    
    <dx:ASPxCallback ID="cppChangePass" runat="server" OnCallback="cppChangePass_Callback" ClientInstanceName="cpChangPass">
        <ClientSideEvents CallbackComplete="ChangPass" />
    </dx:ASPxCallback>
</asp:Content>

