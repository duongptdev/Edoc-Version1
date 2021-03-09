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
    <script>
        function Viewfile(s, e) {
            var idfile = s.cp_idfile;
            var tkk = s.cp_tkk;
            var ttk = s.cp_ttk;
            var htk = s.cp_htk;
            var checkdl = s.cp_checkdl;
            var urlfile = s.cp_urlFile;
            var tenvb = s.cp_tenvb;
            var info = s.cp_info;
            var email = s.cp_email;
            var name = s.cp_name;
            var trangthaivb = s.cp_trangthaivb;
            var trangthaiky = s.cp_trangthaiky;
            sessionStorage.setItem("signInfo", info);
            sessionStorage.setItem("tenvb", tenvb);
            sessionStorage.setItem("trangthaiky", trangthaiky);
            sessionStorage.setItem("checkdl", checkdl);
            sessionStorage.setItem("email", email);
            sessionStorage.setItem("name", name);
            sessionStorage.setItem("trangthaivb", trangthaivb);

            var ptk ='<%= Session("ptKy") %>';

            localStorage.setItem("idFile", idfile);
            localStorage.setItem("Taikhoanky", tkk);
            localStorage.setItem("Phuongthucky", ptk);
            localStorage.setItem("trinhtuky", ttk);
            localStorage.setItem("urlFile", urlfile);
            if (ptk == 1) {
                 window.location.href = "ElectronicSigning.aspx";
                cpgetinfo.PerformCallback();
               
            }  else {
                 window.location.href = "DigitalSigning.aspx";
                cpgetinfo.PerformCallback();
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
    </style>




    <div class="w-layout-grid dashboard-grid">
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
                    <div>
                        <dx:ASPxButton ID="btnAll" runat="server" Text="Tất cả" OnClick="btnAll_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                            <Image SpriteProperties-CssClass="d-flex justify-content-start" Url="Content/images/All.png"></Image>
                        </dx:ASPxButton>
                    </div>

                    <%-- <a
                        href="#"
                        class="link-state all-item w-inline-block"
                        data-filter="*">
                        <img
                            src="Content/images/All.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Tất cả</div>
                    </a>--%>
                    <div>
                        <dx:ASPxButton ID="btnNhap" runat="server" Text="Nháp" OnClick="btnNhap_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                            <Image Url="Content/images/Wait.png"></Image>
                        </dx:ASPxButton>
                    </div>

                    <%--  <a
                        href="#"
                        class="link-state wait-item w-inline-block"
                        data-filter=".wait-filter" id="vbNhap" onclick="vbNhap()">
                        <img
                            src="Content/images/Wait.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Nháp</div>
                    </a>--%>
                    <div>
                        <dx:ASPxButton ID="btnChoky" runat="server" Text="Chờ ký" OnClick="btnChoky_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                            <Image Url="Content/images/Done.png"></Image>
                        </dx:ASPxButton>
                    </div>

                    <%--  <a
                        href="#"
                        class="link-state done-item w-inline-block"
                        data-filter=".done-filter" onclick="vbChoky()">
                        <img
                            src="Content/images/Done.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Chờ ký</div>
                    </a>--%>
                    <div>
                        <dx:ASPxButton ID="btnKyht" runat="server" Text="Ký hoàn tất" OnClick="btnKyht_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                            <Image Url="Content/images/Reject.png"></Image>
                        </dx:ASPxButton>
                    </div>

                    <%--  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Content/images/Reject.png"/>--%>
                    <%--<asp:Button ID="btnKyht" runat="server" Text="Ký hoàn tất" OnClick="btnKyht_Click"  CssClass="link-state reject-item w-inline-block"/>--%>
                    <div>
                        <dx:ASPxButton ID="btnTuchoi" runat="server" Text="Từ chối" OnClick="btnTuchoi_Click" CssClass="bg-white link-state draft-item w-inline-block" BackColor="White">
                            <Image Url="Content/images/Reject.png"></Image>
                        </dx:ASPxButton>
                    </div>

                    <%-- <a
                        href="#"
                        class="link-state reject-item w-inline-block"
                        data-filter=".reject-filter" id="vbKyhoantat" onclick="vbKyhoantat()">
                        <img
                            src="Content/images/Reject.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Ký hoàn tất</div>
                    </a>--%>
                    <div>
                        <dx:ASPxButton ID="btnThuhoi" runat="server" Text="Thu hồi" OnClick="btnThuhoi_Click" CssClass="link-state draft-item w-inline-block bg-white" BackColor="White">
                            <Image Url="Content/images/Voided.png"></Image>
                        </dx:ASPxButton>
                    </div>

                    <%--  <a
                        href="#"
                        class="link-state voided-item w-inline-block"
                        data-filter=".voided-filter" onclick="vbTuchoi()">
                        <img
                            src="Content/images/Voided.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Từ chối</div>
                    </a>--%>
                    <div>
                        <dx:ASPxButton ID="btnXoa" runat="server" Text="Xóa" OnClick="btnXoa_Click" CssClass="link-state draft-item w-inline-block bg-white" BackColor="White">
                            <Image Url="Content/images/Group-15087.png"></Image>
                        </dx:ASPxButton>
                    </div>

                    <%-- <a
                        href="#"
                        class="link-state draft-item w-inline-block"
                        data-filter=".draft-filter" onclick="vbThuhoi()">
                        <img
                            src="Content/images/Draft.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Thu hồi</div>
                    </a>--%>
                </div>
            </div>
            <a href="#" class="menu-link w-inline-block" onclick="vbXoa">
                <div class="item-menu-container">
                    <img src="Content/images/Group-15087.png" loading="lazy" alt="">
                    <div class="menu-text-link">Xóa</div>
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
        </div>

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

                </div>

                <div class="ad-block">
                    <div class="image-card">
                        <img src="Content/images/Clock.png" loading="lazy" alt="">
                    </div>
                    <div class="image-card">
                        <img src="Content/images/Use-Templates.svg" loading="lazy" alt="">
                    </div>
                    <div class="image-card">
                        <img src="Content/images/Watch-Tutorial.svg" loading="lazy" alt="">
                    </div>
                </div>

                <dx:ASPxGridView ID="gridDanhsach" runat="server" KeyFieldName="idFile" Theme="Material" Width="100%"
                    CssClass="text-left" OnCustomUnboundColumnData="gridDanhsach_CustomUnboundColumnData"
                    OnCustomColumnDisplayText="gridDanhsach_CustomColumnDisplayText"
                    ClientInstanceName="griddagui" OnDataBound="gridDanhsach_DataBound" AutoGenerateColumns="false" OnHtmlDataCellPrepared="gridDanhsach_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataColumn Caption="">
                            <DataItemTemplate>
                                <dx:ASPxCheckBox runat="server" CssClass="form-check-input"></dx:ASPxCheckBox>
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


            </div>

        </asp:Panel>
        <asp:Panel ID="pnEmpty" runat="server">
            <div class="work-area">
                <div class="heading-container">
                    <div class="heading-text">Cùng bắt đầu với ca2.Sign!</div>
                </div>
                <div class="ad-card">
                    <div class="image-card">
                        <img src="Content/images/Create New File.svg" loading="lazy" width="1547" alt="" class="image-15">
                    </div>
                    <div class="image-card">
                        <img src="Content/images/Use Templates.svg" loading="lazy" width="1281" alt="">
                    </div>
                    <div class="image-card">
                        <img src="Content/images/Watch Tutorial.svg" loading="lazy" width="1183" alt="">
                    </div>
                </div>
                <div class="empty-text">
                    <div class="empty-content">Danh sách trống!</div>
                    <div class="hint-empty-content">Hãy bắt đầu bằng cách tạo một tài liệu mới</div>
                </div>
            </div>
        </asp:Panel>



        <dx:ASPxTextBox ID="txturl" ClientInstanceName="txturl" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txthtk" ClientInstanceName="txthtk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txttenvbgoc" ClientInstanceName="txttenvbgoc" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtidFile" ClientInstanceName="txtidFile" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txttkk" ClientInstanceName="txttkk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtptk" ClientInstanceName="txtptk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtttk" ClientInstanceName="txtttk" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#flip").click(function () {
                    $("#panel").slideToggle("slow");
               
           
                });
            


            });

            function Close() {
                $("#sendnotifi").addClass("fade");
            }
        //OnGridFocusedRowChanged
        //function OnGridFocusedRowChanged() {

        //    griddagui.GetRowValues(griddagui.GetFocusedRowIndex(), 'Vitriluu;Hinhthucky;TenVBGoc;idFile;Taikhoanky;Phuongthucky;trinhtuky', OnGetRowValues);

        //}
        ////// Value array contains "EmployeeID" and "Notes" field values returned from the server
        //function OnGetRowValues(values) {

        //    txturl.SetText(values[0]);
        //    txthtk.SetText(values[1]);
        //    txttenvbgoc.SetText(values[2]);
        //    txtidFile.SetText(values[3]);
        //    txttkk.SetText(values[4]);
        //    txtptk.SetText(values[5]);
        //    txtttk.SetText(values[6]);
        //    localStorage.setItem("urlFile", txturl.GetText());
        //    localStorage.setItem("htkFile", txthtk.GetText());
        //    localStorage.setItem("tenvbgoc", txttenvbgoc.GetText());
        //    localStorage.setItem("idFile", txtidFile.GetText());
        //    localStorage.setItem("Taikhoanky", txttkk.GetText());
        //    localStorage.setItem("Phuongthucky", txtptk.GetText());
        //    localStorage.setItem("trinhtuky", txtttk.GetText());

        //    alert('a');
        //    var htk = txthtk.GetText();
        //    if (htk == 0) {
        //        window.location.href = "DigitalSigning.aspx";
        //        cpgetinfo.PerformCallback();
        //    } else if (htk == 1) {
        //        window.location.href = "ElectronicSigning.aspx";

        //    } else {
        //        alert("Lỗi");
        //    }
        //}
       <%-- function Getinfo(e, s) {
           
                var code = '<%= Session("Code") %>';
                var tkk = '<%= Session("Tkk") %>';
                var info = '<%= Session("Info") %>';
            localStorage.setItem("urlky", e.result);
            localStorage.setItem("codeky", code);
            localStorage.setItem("tkkky", tkk);
            localStorage.setItem("infoky", info);

        };--%>
</script>
</asp:Content>
