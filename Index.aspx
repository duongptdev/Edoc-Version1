<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="Index.aspx.vb" Inherits="Index" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .bg-white {
            background-color: white;
            border: none;
        }

        #image {
            float: left;
        }
    </style>

    <link href="Content/css/edoc.webflow.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <script>
        function Viewfile(s, e) {
            var idfile = s.cp_idfile;
            var tkk = s.cp_tkk;
            var ttk = s.cp_ttk;
            var hinhthucky = s.cp_hinhthucky;
            var checkdl = s.cp_checkdl;
            var urlfile = s.cp_urlFile;
            var tenvb = s.cp_tenvb;
            var info = s.cp_info;
            var email = s.cp_email;
            var name = s.cp_name;
            var taikhoantao = s.cp_taikhoantao;
            var ngaytao = s.cp_ngaytao;
            var tieudemail = s.cp_tieudemail;
            var chudemail = s.cp_chudemail;
            var taikhoanky = s.cp_taikhoanky;
            var trangthaigui = s.cp_trangthaigui;
            var thoigiangui = s.cp_thoigiangui;
            var trangthaivb = s.cp_trangthaivb;
            var trangthaiky = s.cp_trangthaiky;
            var taikhoantao = s.cp_taikhoantao;
            var trinhtuky = s.cp_trinhtuky;
            var trangthaibutton = s.cp_trinhtu;
            var tennguoitao = s.cp_tennguoitao;
            var tennguoiky = s.cp_tennguoiky;
            var noidunglog = s.cp_noidunglog;
            var thoigianthuchien = s.cp_thoigianlog;
            var taikhoanthuchien = s.cp_tkthuchien;
            var trangthailog = s.cp_trangthailog;
            var hotennguoilog = s.cp_hotennguoigui;
            sessionStorage.setItem("tennguoitao", tennguoitao);
            sessionStorage.setItem("trangthailog", trangthailog);
            sessionStorage.setItem("hotennguoilog", hotennguoilog);
            sessionStorage.setItem("thoigianthuchien", thoigianthuchien);
            sessionStorage.setItem("taikhoanthuchien", taikhoanthuchien);
         
            sessionStorage.setItem("noidunglog", noidunglog);
            sessionStorage.setItem("tennguoiky", tennguoiky);
               sessionStorage.setItem("trangthaibutton", trangthaibutton);

            sessionStorage.setItem("signInfo", info);
            sessionStorage.setItem("tenvb", tenvb);
            sessionStorage.setItem("trangthaiky", trangthaiky);
            sessionStorage.setItem("hinhthucky", hinhthucky);
            sessionStorage.setItem("checkdl", checkdl);
            sessionStorage.setItem("email", email);
            sessionStorage.setItem("name", name);
            sessionStorage.setItem("trangthaivb", trangthaivb);
            sessionStorage.setItem("taikhoantao", taikhoantao);
            sessionStorage.setItem("ngaytao", ngaytao);
            sessionStorage.setItem("tieudemail", tieudemail);
            sessionStorage.setItem("chudemail", chudemail);
            sessionStorage.setItem("taikhoanky", taikhoanky);
            sessionStorage.setItem("trangthaigui", trangthaigui);
            sessionStorage.setItem("thoigiangui", thoigiangui);
            sessionStorage.setItem("taikhoantao", taikhoantao);
            sessionStorage.setItem("trinhtuky", trinhtuky);

            var ptk ='<%= Session("ptKy") %>';

            localStorage.setItem("idFile", idfile);
            localStorage.setItem("Taikhoanky", tkk);
            localStorage.setItem("Phuongthucky", ptk);
            localStorage.setItem("trinhtuky", ttk);
            localStorage.setItem("urlFile", urlfile);
            //if (ptk == 1) {
            window.location.href = "ElectronicSigning.aspx";
            cpgetinfo.PerformCallback();

            //}  else {
            //     window.location.href = "DigitalSigning.aspx";
            //    cpgetinfo.PerformCallback();
            //}
        }
        function vbChoky() {
            cpChoky.PerformCallback(2);
        }
        function vbTatca() {
            cpChoky.PerformCallback(0);
        }
        function vbNhap() {
            cpChoky.PerformCallback(1);
        }
        function vbKyht() {
            cpChoky.PerformCallback(3);
        }
        function vbTuchoi() {
            cpChoky.PerformCallback(4);
        }
        function vbThuhoi() {
            cpChoky.PerformCallback(5);
        }
        function vbXoa() {
            cpChoky.PerformCallback(6);

        }
        function EndGetVb(s, e) {
            griddagui.PerformCallback();
        }
        function Chonvbxoa(s, e) {
            var idfilexoa = s.cp_idfilexoa;
            var taikhoanthuchien = s.cp_taikhoanthuchien;
            sessionStorage.setItem("idfilexoa", idfilexoa);
            sessionStorage.setItem("taikhoanthuchien", taikhoanthuchien);
        }
        function Xoavb() {
            var idfilexoa = sessionStorage.getItem("idfilexoa");
            var taikhoanthuchien = sessionStorage.getItem("taikhoanthuchien");
            cpxoavb.PerformCallback(idfilexoa + "," + taikhoanthuchien);
        }
        function EndXoavb(s, e) {
            if (e.result == 1) {
                alert("Xóa thành công văn bản");
                window.location.href = "Index.aspx";
            } else {
                alert("Xóa không thành công");
            }
        }
    </script>
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
    </style>
     
      <%--Updated 16/03/2021--%>
     <div class="background-modal">
        <div class="add-folder-form">
            <div class="heading-modal">
                <div class="contact-text">Thêm vào thư mục</div>
                <div class="close-button">
                    <img src="Content/images/Icons-Close-16px.svg" loading="lazy" alt="Close Modal">
                </div>
            </div>
            <div class="folder-form-body">
                <div class="folder-hint-text">Chọn thư mục muốn thêm văn bản</div>
                <div class="folder-block">
                    <div class="folder-card-wrapper">
                        <div class="folder-card">
                            <img class="folder-icon" src="Content/images/add-folder.png" alt="" />
                            <div>Thư mục</div>
                        </div>
                        <div class="folder-card-element">
                            <div class="folder-card active">
                                <img class="folder-icon" src="Content/images/folder.svg" alt="" />
                                <div>Nacencomm</div>
                            </div>
                            <div class="folder-element">
                                <img class="folder-icon" src="Content/images/folder.svg" alt="" />
                                <div>NIC Team</div>
                            </div>
                            <div class="folder-element">
                                <img class="folder-icon" src="Content/images/folder.svg" alt="" />
                                <div>NIC Design</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="folder-form-button">
                <a href="../multiple-signatures/upload-file.html" aria-current="page"
                    class="back-button w-button w--current">Bỏ qua</a>
                <button type="submit" class="button-4 w-button">Xác nhận</button>
            </div>
        </div>
    </div>

    <div class="voided-background-modal hidden-block">
        <div class="voided-form">
            <div class="heading-modal">
                <div class="contact-text">Thu hồi tài liệu</div>
                <div id="voided-close" class="close-button">
                    <img src="Content/images/Icons-Close-16px.svg" loading="lazy" alt="">
                </div>
            </div>
            <div class="voided-form-body">

                <div class="folder-hint-text">Tài liệu sẽ được thu hồi và không thể hoàn tác.</div>
                <div class="voided-text-form">*Sau khi nhập lí do thu hồi tài liệu và ấn xác nhận, bạn sẽ hủy tất cả các hoạt động ký của người nhận đã ký và chưa ký tài liệu. Tất cả người nhận được thông báo qua email 
                bao gồm thông báo thu hồi tài liệu và lý do thu hồi của bạn.
                </div>
                             
                                <label class="message-label">Lý do thu hồi tài liệu*</label>
                                <textarea
                                    placeholder="Nhập lý do thu hồi tài liệu"
                                    id="email-message"
                                    name="email-message"
                                    maxlength="1000"
                                    class="textarea w-input" 
                                    onkeyup="countChar(this)"></textarea>
                                <div class="content-text-area">
                                    <div id="charNum">0</div>
                                    <div>/1000</div>
                                </div>
                            
                 <div class="voided-form-button">
                    <a href="../multiple-signatures/upload-file.html" aria-current="page"
                        class="back-button w-button w--current">Bỏ qua</a>
                    <button type="submit" class="button-4 w-button">Xác nhận</button>
                </div>
            </div>

        </div>
    </div>

    <div class="delete-background-modal hidden-block">
        <div class="voided-form">
            <div class="heading-modal">
                <div class="contact-text"></div>
                <div id="delete-close" class="close-button">
                    <img src="Content/images/Icons-Close-16px.svg" loading="lazy" alt="Close Modal">
                </div>
            </div>
            <div class="delete-form-body">
                <div>
                    <div class="delete-modal-text">Tài liệu của bạn sẽ bị xóa và chuyển đến thư mục "<strong>Đã xóa</strong>".<br />Bạn có chắc chắn muốn tiếp tục?</div>
                    <button type="submit" class="button-4 add-width w-button">Tiếp tục</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row row-margin">
            <div class="col-sm-2">
            <div id="w-node-339fecbc6fd0-66c5cdc4" class="menu-left">
                <a href="UploadFile.aspx" class="add-file-button w-button">
                    <img src="Content/images/new file icon.png" class="margin-icon" style="padding-right: 5px" alt="icon" />
                    Tạo tài liệu mới</a>
                <div
                    class="state-dropdown"
                    style="margin-top: 0px; margin-bottom: 0px; padding-left: 0px">
                    <div id="flip" class="title-content" style="padding-left: 12px">
                        <div class="text-and-icon">
                            <img
                                src="Content/images/Path-30115_1.png"
                                loading="lazy"
                                alt=""
                                class="file-icon" />
                            <div class="text-block-4">Tài liệu của tôi</div>
                        </div>
                        <img
                            src="Content/images/Path-30116.png"
                            loading="lazy"
                            alt=""
                            class="image-9" />
                    </div>
                    <div id="panel" class="state-link w-hidden" style="margin-left: 30px">
                        <%--         <div>
                            <dx:ASPxButton ID="btnAll" runat="server" Text="Tất cả" OnClick="btnAll_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                                <Image SpriteProperties-CssClass="d-flex justify-content-start" Url="Content/images/All.png"></Image>
                            </dx:ASPxButton>
                        </div>--%>

                        <a
                            href="#"
                            class="link-state all-item w-inline-block"
                            data-filter="*" onclick="vbTatca()">
                            <img
                                src="Content/images/All.png"
                                loading="lazy"
                                alt=""
                                class="image-10" />
                            <div class="all-text">Tất cả</div>
                        </a>
                        <%--      <div>
                            <dx:ASPxButton ID="btnNhap" runat="server" Text="Nháp" OnClick="btnNhap_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                                <Image Url="Content/images/Wait.png"></Image>
                            </dx:ASPxButton>
                        </div>--%>

                        <a
                            href="#"
                            class="link-state wait-item w-inline-block"
                            data-filter=".wait-filter" id="vbNhap" onclick="vbNhap()">
                            <img
                                src="Content/images/Wait.png"
                                loading="lazy"
                                alt=""
                                class="image-10" />
                            <div class="all-text">Nháp</div>
                        </a>
                        <%--     <div>
                            <dx:ASPxButton ID="btnChoky" runat="server" Text="Chờ ký" OnClick="btnChoky_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                                <Image Url="Content/images/Done.png"></Image>
                            </dx:ASPxButton>
                        </div>--%>

                        <a
                            href="#"
                            class="link-state done-item w-inline-block"
                            data-filter=".done-filter" onclick="vbChoky()">
                            <img
                                src="Content/images/Done.png"
                                loading="lazy"
                                alt=""
                                class="image-10" />
                            <div class="all-text">Đang chờ</div>
                        </a>
                        <%--       <div>
                            <dx:ASPxButton ID="btnKyht" runat="server" Text="Ký hoàn tất" OnClick="btnKyht_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                                <Image Url="Content/images/Reject.png"></Image>
                            </dx:ASPxButton>
                        </div>--%>

                        <%--  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Content/images/Reject.png"/>--%>
                        <%--<asp:Button ID="btnKyht" runat="server" Text="Ký hoàn tất" OnClick="btnKyht_Click"  CssClass="link-state reject-item w-inline-block"/>--%>
                        <%--     <div>
                            <dx:ASPxButton ID="btnTuchoi" runat="server" Text="Từ chối" OnClick="btnTuchoi_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                                <Image Url="Content/images/Reject.png"></Image>
                            </dx:ASPxButton>
                        </div>--%>

                        <a
                            href="#"
                            class="link-state reject-item w-inline-block"
                            data-filter=".reject-filter" id="vbKyhoantat" onclick="vbKyht()">
                            <img
                                src="Content/images/Reject.png"
                                loading="lazy"
                                alt=""
                                class="image-10" />
                            <div class="all-text">Ký hoàn tất</div>
                        </a>
                        <%-- <div>
                            <dx:ASPxButton ID="btnThuhoi" runat="server" Text="Thu hồi" OnClick="btnThuhoi_Click" CssClass="link-state draft-item w-inline-block bg-white" BackColor="White">
                                <Image Url="Content/images/Voided.png"></Image>
                            </dx:ASPxButton>
                        </div>--%>

                        <a
                            href="#"
                            class="link-state voided-item w-inline-block"
                            data-filter=".voided-filter" onclick="vbTuchoi()">
                            <img
                                src="Content/images/Voided.png"
                                loading="lazy"
                                alt=""
                                class="image-10" />
                            <div class="all-text">Từ chối</div>
                        </a>
                        <%-- <div>
                            <dx:ASPxButton ID="btnXoa" runat="server" Text="Xóa" OnClick="btnXoa_Click" CssClass="link-state draft-item w-inline-block bg-white" BackColor="White">
                                <Image Url="Content/images/Group-15087.png"></Image>
                            </dx:ASPxButton>
                        </div>--%>

                        <a
                            href="#"
                            class="link-state draft-item w-inline-block"
                            data-filter=".draft-filter" onclick="vbThuhoi()">
                            <img
                                src="Content/images/Draft.png"
                                loading="lazy"
                                alt=""
                                class="image-10" />
                            <div class="all-text">Thu hồi</div>
                        </a>
                        <%--<a
                            href="#"
                            class="link-state draft-item w-inline-block"
                            data-filter=".draft-filter" onclick="vbXoa()">
                            <img
                                src="Content/images/Group-15087.png"
                                loading="lazy"
                                alt=""
                                class="image-10" />
                            <div class="all-text">Xóa</div>
                        </a>--%>
                    </div>
                </div>
                <a href="#" class="menu-link w-inline-block" onclick="vbXoa()">
                    <div class="item-menu-container">
                        <img src="Content/images/Group-15087.png" loading="lazy" alt="">
                        <div class="menu-text-link">Đã xóa</div>
                    </div>
                </a>
                <a href="#" class="menu-link w-inline-block">
                    <div class="item-menu-container space-between">
                        <div class="item-left">
                            <img src="Content/images/Group-15088.png" loading="lazy" alt="">
                            <div class="menu-text-link">Thư mục</div>
                        </div>
                        <div class="item-right">
                            <img src="Content/images/Group-15086_1.png" loading="lazy" alt="">
                        </div>
                    </div>
                </a>


                <%--Updated 16/03/2021--%>
                <div class="add-folder-wrapper">
                    <a href="" class="add-folder-dropdown">
                        <img style="margin-right: 8px;" src="Content/images/add-icon.png" alt="" />
                        <div>Thêm thư mục</div>   
                    </a>
                </div>
            </div>
            </div>
            <div class="col-sm-10">
            <asp:Panel ID="pnHaveFile" runat="server">

                <div class="work-area">
                    <div class="heading-container">
                        <div class="heading-text">Tất cả tài liệu</div>
                        <%--  <div id="sendnotifi" class="fade">
                            <div class="alert alert-success alert-dismissible fade" id="notifi" style="width: 500px;">
                                <strong>Thành công!</strong>

                            </div>
                            <button type="button" class="close" onclick="Close()" data-dismiss="alert">&times;</button>
                        </div>--%>
                        <div class="search-and-filter">
                            <div class="search-block">

                                <input type="search" class="search-input-block w-input" name="query" placeholder="Tìm kiếm tài liệu" id="search">
                                <a href="" class="search-icon-button">
                                    <img src="Content/images/search-icon.png" alt=""></a>
                            </div>

                            <div class="divider-search"></div>
                            <div id="filter-button" class="filter-block">
                                <img src="Content/images/Filter Icon.png" loading="lazy" alt="" class="filter-icon">
                                <div class="filter-text">Bộ lọc</div>
                            </div>
                        </div>
                    </div>

                    <div class="filter-dropdown">
                        <div class="state-filter">
                            <div class="state-filter-text">Trạng thái</div>
                            <select class="filter-select" name="filter-select" id="filter-select">
                                <option value="waiting-state" selected="selected">Chờ ký</option>
                                <option value="finish-state">Ký hoàn tất</option>
                                <option value="reject-state">Từ chối</option>
                                <option value="voided-state">Thu hồi</option>
                                <option value="delete-state">Đã xoá</option>
                                <option value="draft-state">Nháp</option>
                            </select>
                        </div>
                        <div class="sender-filter">
                            <div class="state-filter-text">Người gửi</div>
                            <div class="sender-radio">
                                <input id="all" type="radio" name="filter" value="all" />
                                <label for="all" class="radio-label">Tất cả</label>
                                <div class="radio-block">
                                    <input id="sender" type="radio" name="filter" value="sender" />
                                    <label for="sender" class="radio-label">Gửi từ tôi</label>
                                </div>
                                <div class="radio-block">
                                    <input id="recipient" type="radio" name="filter" value="recipient" />
                                    <label for="recipient" class="radio-label">Gửi từ người khác</label>
                                </div>
                            </div>
                        </div>
                        <div class="date-filter">
                            <div class="state-filter-text">Thời gian</div>
                            <select id="day-custom" class="filter-select" name="day-custom">
                                <option value="all-state">Tất cả</option>
                                <option value="one-month-state">1 tháng trước</option>
                                <option value="three-month-state">3 tháng trước</option>
                                <option value="six-month-state">6 tháng trước</option>
                                <option value="custom-state">Tuỳ chỉnh</option>
                            </select>
                            <div class="date-custom">
                                <div class="from-to-block">
                                    <div class="state-filter-text">Từ ngày</div>
                                    <input class="date-input" type="date" name="from" value="" />
                                </div>
                                <div class="date-divider"></div>
                                <div class="from-to-block">
                                    <div class="state-filter-text">Đến ngày</div>
                                    <input class="date-input" type="date" name="to" value="" />
                                </div>
                            </div>
                        </div>
                        <div class="button-filter">
                            <a href="" aria-current="page" class="back-button w-button w--current">Bỏ qua</a>
                            <button type="submit" class="button-4 w-button">Áp dụng</button>
                        </div>
                    </div>

                    <div class="ad-card">
                        <div class="image-card">
                            <img src="Content/images/Create New File.svg" loading="lazy" width="1547" alt="" class="image-15">
                        </div>
                        <div class="image-card">
                            <img src="Content/images/Use Templates.svg" loading="lazy" width="1281" alt="">
                        </div>
                        <div class="image-card">
                            <img src="Content/images/Watch-Tutorial.svg" loading="lazy" width="1183" alt="">
                        </div>
                    </div>

                    <dx:ASPxGridView ID="gridDanhsach" runat="server" KeyFieldName="idFile" Theme="Material" Width="100%"
                        CssClass="text-left" OnCustomUnboundColumnData="gridDanhsach_CustomUnboundColumnData"
                        OnCustomColumnDisplayText="gridDanhsach_CustomColumnDisplayText"
                        ClientInstanceName="griddagui" OnCustomCallback="gridDanhsach_CustomCallback"
                        OnDataBound="gridDanhsach_DataBound" AutoGenerateColumns="false" OnHtmlDataCellPrepared="gridDanhsach_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataColumn Caption="">
                                <DataItemTemplate>
                                    <dx:ASPxCheckBox runat="server" ID="cbXoa" OnInit="cbXoa_Init" CssClass="form-check-input">
                                        <ClientSideEvents CheckedChanged="Chonvbxoa" />
                                    </dx:ASPxCheckBox>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="Vitriluu" Caption="Tiêu đề" Visible="false"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="idFile" Caption="Tiêu đề" Visible="false"></dx:GridViewDataColumn>

                            <%-- <dx:GridViewDataColumn FieldName="Trangthaiky" Caption="Tiêu đề" Visible="false"></dx:GridViewDataColumn>--%>


                            <dx:GridViewDataColumn FieldName="TenVBGoc" Caption="Tiêu đề"></dx:GridViewDataColumn>
                            <dx:GridViewDataDateColumn FieldName="Ngaytao" Caption="Thời gian" PropertiesDateEdit-DisplayFormatString="{0:dd/MM/yyyy HH:mm}"></dx:GridViewDataDateColumn>
                            <dx:GridViewDataColumn FieldName="TrangthaiVB" Caption="Trạng thái" CellStyle-CssClass="aligntext">
                            </dx:GridViewDataColumn>

                            <dx:GridViewDataColumn Caption="Chức năng">
                                <DataItemTemplate>

                                    <dx:ASPxButton ID="btnXem" runat="server" Text="Xem" OnInit="btnXem_Init" RenderMode="Link" ClientEnabled="true" AutoPostBack="false">
                                        <ClientSideEvents Click="Viewfile" />
                                    </dx:ASPxButton>

                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                        </Columns>
                        <SettingsPager PageSize="10" Mode="ShowPager" Position="Bottom" />
                        <Styles Footer-Font-Bold="true" Footer-ForeColor="Black">
                            <Footer Font-Bold="True" ForeColor="Black"></Footer>
                        </Styles>
                        <SettingsBehavior AllowFocusedRow="true" />
                        <Styles>
                            <FocusedRow BackColor="#C0FFC0" ForeColor="Black">
                            </FocusedRow>
                        </Styles>
                        <Settings ShowColumnHeaders="true" ShowFooter="true" />
                        <%-- <ClientSideEvents FocusedRowChanged="function(s,e){OnGridFocusedRowChanged();}" />--%>
                    </dx:ASPxGridView>


           

                     <table class="table-index">

                                <colgroup>
                                    <col width="50" />
                                    <col width="450" />
                                    <col width="200" />
                                    <col width="250" />
                                    <col width="100" />
                                </colgroup>

                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Tiêu đề</th>
                                    <th>Cập nhật</th>
                                    <th>Trạng thái</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        <div class="file-name-index">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx</div>                     
                                        <div class="user-name-index">Từ: Nguyễn Trần Văn Khanh</div>
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div class="card-state wait-state">
                                            <img src="Content/images/Group-14876.svg" loading="lazy" alt="" class="icon-state" />
                                            <div class="text-state wait-text">Chờ ký</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div data-hover="" data-delay="0" class="w-dropdown">
                                            <div class="dropdown-toggle-6 w-dropdown-toggle">
                                                <img src="Content/images/Group-15086_1.png"
                                                    loading="lazy" alt="function">
                                            </div>
                                            <nav class="w-dropdown-list">
                                                <a href="#" class="w-dropdown-link">Ký tài liệu</a>
                                                <a href="#" class="w-dropdown-link add-folder">Thêm vào thư mục</a>
                                                <a id="voided-file" href="#" class="w-dropdown-link">Thu hồi tài liệu</a>
                                                <a href="#" class="w-dropdown-link">Tải xuống</a>
                                                <a id="deleted-file" href="#" class="w-dropdown-link">Xoá</a>
                                            </nav>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        <div class="file-name-index">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx</div>                     
                                        <div class="user-name-index">Từ: Nguyễn Trần Văn Khanh</div>
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div class="card-state wait-state">
                                            <img src="Content/images/Group-14876.svg" loading="lazy" alt="" class="icon-state" />
                                            <div class="text-state wait-text">Chờ người khác</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div data-hover="" data-delay="0" class="w-dropdown">
                                            <div class="dropdown-toggle-6 w-dropdown-toggle">
                                                <img src="Content/images/Group-15086_1.png"
                                                    loading="lazy" alt="function">
                                            </div>
                                            <nav class="w-dropdown-list">
                                                <a href="#" class="w-dropdown-link">Ký tài liệu</a>
                                                <a href="#" class="w-dropdown-link add-folder">Thêm vào thư mục</a>
                                                <a id="voided-file" href="#" class="w-dropdown-link">Thu hồi tài liệu</a>
                                                <a href="#" class="w-dropdown-link">Tải xuống</a>
                                                <a id="deleted-file" href="#" class="w-dropdown-link">Xoá</a>
                                            </nav>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        <div class="file-name-index">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx</div>                     
                                        <div class="user-name-index">Từ: Nguyễn Trần Văn Khanh</div>
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div class="card-state reject-state">
                                            <img src="Content/images/Group-15087_1.png" loading="lazy" alt="" class="icon-state" />
                                            <div class="text-state reject-text">Từ chối</div>
                                        </div>
                                    </td>
                                    <td>
                                          <div data-hover="" data-delay="0" class="w-dropdown">
                                            <div class="dropdown-toggle-6 w-dropdown-toggle">
                                                <img src="Content/images/Group-15086_1.png"
                                                    loading="lazy" alt="function">
                                            </div>
                                            <nav class="w-dropdown-list">
                                                <a href="#" class="w-dropdown-link add-folder">Thêm vào thư mục</a>
                                                <a href="#" class="w-dropdown-link">Nhân bản</a>
                                                <a href="#" class="w-dropdown-link">Tải xuống</a>
                                                <a href="#" class="w-dropdown-link">Xoá</a>
                                            </nav>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        <div class="file-name-index">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx</div>                     
                                        <div class="user-name-index">Từ: Nguyễn Trần Văn Khanh</div>
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div class="card-state done-state">
                                            <img src="Content/images/Group-15088_1.png" loading="lazy" alt="" class="icon-state" />
                                            <div class="text-state done-text">Ký hoàn tất</div>
                                        </div>
                                    </td>
                                    <td>                                    <div data-hover="" data-delay="0" class="w-dropdown">
                                            <div class="dropdown-toggle-6 w-dropdown-toggle">
                                                <img src="Content/images/Group-15086_1.png"
                                                    loading="lazy" alt="function">
                                            </div>
                                            <nav class="w-dropdown-list">
                                                <a href="#" class="w-dropdown-link add-folder">Thêm vào thư mục</a>
                                                <a href="#" class="w-dropdown-link">Nhân bản</a>
                                                <a href="#" class="w-dropdown-link">Tải xuống</a>
                                                <a href="#" class="w-dropdown-link">Xoá</a>
                                            </nav>
                                        </div></td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        <div class="file-name-index">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx</div>                     
                                        <div class="user-name-index">Từ: Nguyễn Trần Văn Khanh</div>
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div class="card-state voided-state">
                                            <img src="Content/images/Group-14877.svg" loading="lazy" alt="" class="icon-state" />
                                            <div class="text-state voided-text">Thu hồi</div>
                                        </div>
                                    </td>
                                    <td>                                    <div data-hover="" data-delay="0" class="w-dropdown">
                                            <div class="dropdown-toggle-6 w-dropdown-toggle">
                                                <img src="Content/images/Group-15086_1.png"
                                                    loading="lazy" alt="function">
                                            </div>
                                            <nav class="w-dropdown-list">
                                                <a href="#" class="w-dropdown-link add-folder">Thêm vào thư mục</a>
                                                <a href="#" class="w-dropdown-link">Nhân bản</a>
                                                <a href="#" class="w-dropdown-link">Tải xuống</a>
                                                <a href="#" class="w-dropdown-link">Xoá</a>
                                            </nav>
                                        </div></td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        <div class="file-name-index">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx</div>                     
                                        <div class="user-name-index">Từ: Nguyễn Trần Văn Khanh</div>
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div class="card-state draft-state">
                                            <img src="Content/images/Group-15090.png" loading="lazy" alt="" class="icon-state" />
                                            <div class="text-state draft-text">Nháp</div>
                                        </div>
                                    </td>
                                    <td>                                    <div data-hover="" data-delay="0" class="w-dropdown">
                                            <div class="dropdown-toggle-6 w-dropdown-toggle">
                                                <img src="Content/images/Group-15086_1.png"
                                                    loading="lazy" alt="function">
                                            </div>
                                            <nav class="w-dropdown-list">
                                                <a href="#" class="w-dropdown-link">Tiếp tục chỉnh sửa</a>
                                                <a href="#" class="w-dropdown-link add-folder">Thêm vào thư mục</a>
                                                <a href="#" class="w-dropdown-link">Nhân bản</a>
                                                <a href="#" class="w-dropdown-link">Tải xuống</a>
                                                <a href="#" class="w-dropdown-link">Xoá</a>
                                            </nav>
                                        </div></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <dx:ASPxCallback ID="cpChoky" ClientInstanceName="cpChoky" OnCallback="cpChoky_Callback" runat="server">
                        <ClientSideEvents CallbackComplete="EndGetVb" />
                    </dx:ASPxCallback>
                    <dx:ASPxCallback ID="cpxoavb" ClientInstanceName="cpxoavb" OnCallback="cpxoavb_Callback" runat="server">
                        <ClientSideEvents CallbackComplete="EndXoavb" />
                    </dx:ASPxCallback>
                    <%--             <dx:ASPxGridView ID="grvDsvb" runat="server" Border-BorderStyle="None" Width="100%"   OnCustomColumnDisplayText="gridDanhsach_CustomColumnDisplayText">
    >>>>>>> remotes/origin/main
                            <Templates>
                                <DataRow>
                                    <table class="table-index">
                                   

                                        <tr>
                                            <td>
                                                <input type="checkbox" name="" id=""></td>
                                            <td>
                                                <div class="file-name-index"><%# Eval("TenVBGoc") %></div>
                                        
                                            </td>
                                            <td>
                                              <div class="file-name-index"><%# Eval("Ngaytao") %></div>
                                        
                                           
                                            </td>
                                             <td>
                                              <div class="file-name-index"><%# Eval("TrangthaiVB") %></div>
                                        
                                           
                                            </td>
                                       
                                            <td><a href="#">
                                                <img src="Content/images/Group-15086_1.png" alt="" /></a></td>
                                        </tr>
                                    </table>
                                </DataRow>
                            </Templates>
                            <Settings ShowColumnHeaders="false" />
                        </dx:ASPxGridView>
                    </div>--%>
            </asp:Panel>
            <asp:Panel ID="pnEmpty" runat="server">
                <div class="work-area">
                    <div class="heading-container">
                        <div class="heading-text">Cùng bắt đầu với ca2.Sign!</div>
                        <%--<div class="search-and-filter">
                            <div class="search-block">

                                <input type="search" class="search-input-block w-input" name="query" placeholder="Tìm kiếm tài liệu" id="search">
                                <a href="" class="search-icon-button">
                                    <img src="Content/images/search-icon.png" alt=""></a>
                            </div>

                            <div class="divider-search"></div>
                            <div id="filter-button" class="filter-block">
                                <img src="Content/images/Filter Icon.png" loading="lazy" alt="" class="filter-icon">
                                <div class="filter-text">Bộ lọc</div>
                            </div>
                        </div>--%>
                    </div>

                    <%--<div class="filter-dropdown">
                        <div class="state-filter">
                            <div class="state-filter-text">Trạng thái</div>
                            <select name="filter-select" id="filter-select">
                                <option value="waiting-state" selected="selected">Chờ ký</option>
                                <option value="finish-state">Ký hoàn tất</option>
                                <option value="reject-state">Từ chối</option>
                                <option value="voided-state">Thu hồi</option>
                                <option value="delete-state">Đã xoá</option>
                                <option value="draft-state">Nháp</option>
                            </select>
                        </div>
                        <div class="sender-filter">
                            <div class="state-filter-text">Người gửi</div>
                            <div class="sender-radio">
                                <input id="all" type="radio" name="filter" value="all" />
                                <label for="all" class="radio-label">Tất cả</label>
                                <div class="radio-block">
                                    <input id="sender" type="radio" name="filter" value="sender" />
                                    <label for="sender" class="radio-label">Gửi từ tôi</label>
                                </div>
                                <div class="radio-block">
                                    <input id="recipient" type="radio" name="filter" value="recipient" />
                                    <label for="recipient" class="radio-label">Gửi từ người khác</label>
                                </div>
                            </div>
                        </div>
                        <div class="date-filter">
                            <div class="state-filter-text">Thời gian</div>
                            <select id="day-custom" class="filter-select">
                                <option value="waiting-state">Tất cả</option>
                                <option value="waiting-state">1 tháng trước</option>
                                <option value="waiting-state">3 tháng trước</option>
                                <option value="waiting-state">6 tháng trước</option>
                                <option value="finish-state">Tuỳ chỉnh</option>
                            </select>
                            <div class="date-custom">
                                <div class="from-to-block">
                                    <div class="state-filter-text">Từ ngày</div>
                                    <input class="date-input" type="date" name="from" value="" />
                                </div>
                                <div class="date-divider"></div>
                                <div class="from-to-block">
                                    <div class="state-filter-text">Đến ngày</div>
                                    <input class="date-input" type="date" name="to" value="" />
                                </div>
                            </div>
                        </div>
                        <div class="button-filter">
                            <a href="" aria-current="page" class="back-button w-button w--current">Bỏ qua</a>
                            <button type="submit" class="button-4 w-button">Áp dụng</button>
                        </div>
                    </div>--%>

                    <div class="ad-card">
                        <div class="image-card">

                            <img src="Content/images/Create New File.svg" loading="lazy" width="1547" alt="" class="image-15">
                        </div>
                        <div class="image-card">
                            <img src="Content/images/Use Templates.svg" loading="lazy" width="1281" alt="">
                        </div>
                        <div class="image-card">
                            <img src="Content/images/Watch-Tutorial.svg" loading="lazy" width="1183" alt="">
                        </div>
                    </div>
                    <div class="empty-text">
                        <div class="empty-content">Danh sách trống!</div>
                        <div class="hint-empty-content">Hãy bắt đầu bằng cách tạo một tài liệu mới</div>
                    </div>
                </div>
            </asp:Panel>
            </div>
        </div>
    </div>

        <dx:ASPxTextBox ID="txturl" ClientInstanceName="txturl" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txthtk" ClientInstanceName="txthtk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txttenvbgoc" ClientInstanceName="txttenvbgoc" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtidFile" ClientInstanceName="txtidFile" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txttkk" ClientInstanceName="txttkk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtptk" ClientInstanceName="txtptk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtttk" ClientInstanceName="txtttk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script src="Scripts/js/e-dropdown.js"></script>
        <script>

            //Updated 16/03/2021

                  function countChar(val) {
                        var len = val.value.length;
                        if (len >= 500) {
                          val.value = val.value.substring(0, 500);
                        } else {
                          $('#charNum').text(len++);
                        }
                  };

            (function addFolderClickHandle() {

                var addFolderButton = document.querySelector(".w-dropdown-link.add-folder");
                var addFolderModal = document.querySelector(".background-modal");

                var closeFolderBtn = document.querySelector(".close-button");

                addFolderButton.addEventListener("click", function () {
                    if (addFolderModal.style.display === "none") {
                        addFolderModal.style.display = "block";
                    } else {
                        addFolderModal.style.display = "none";
                    }

                });

                closeFolderBtn.addEventListener("click", function () {
                    if (addFolderModal.style.display === "block") {
                        addFolderModal.style.display = "none";
                    } else {
                        addFolderModal.style.display = "block";
                    }
                });
            })();

            (function voidedRequestClickHandle() {

                var voidedButton = document.querySelector("#voided-file");
                var voidedModal = document.querySelector(".voided-background-modal.hidden-block");

                var closeVoidedBtn = document.querySelector("#voided-close");

                voidedButton.addEventListener("click", function () {
                    voidedModal.classList.remove("hidden-block");
                });

                closeVoidedBtn.addEventListener("click", function () {
                    voidedModal.classList.add("hidden-block");
                });
            })();

            (function deleteRequestClickHandle() {

                var deleteButton = document.querySelector("#deleted-file");
                var deleteModal = document.querySelector(".delete-background-modal.hidden-block");

                var closeDeleteBtn = document.querySelector("#delete-close");

                deleteButton.addEventListener("click", function () {
                    deleteModal.classList.remove("hidden-block");

                });

                closeDeleteBtn.addEventListener("click", function () {
                    deleteModal.classList.add("hidden-block");
                });
            })();

            function showCustomDay() {

                var dateSelection = document.querySelector("#day-custom");

                var dateCustomBlock = document.querySelector(".date-custom");

                dateSelection.addEventListener('change', function () {
                    var style = this.value == 'custom-state' ? 'flex' : 'none';
                    dateCustomBlock.style.display = style;

                });

            }

            $(document).ready(function () {
                $("#flip").click(function () {
                    $("#panel").slideToggle("slow");
                });
                var name = '<%= Session("Ten") %>';
                var email = '<%= Session("Login") %>';
                sessionStorage.setItem("email", email);
                sessionStorage.setItem("name", name);
            });

            function Close() {
                $("#sendnotifi").addClass("fade");
            }

        </script>
</asp:Content>
