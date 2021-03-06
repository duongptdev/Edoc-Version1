<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Taoyeucauky.aspx.vb" Inherits="Taoyeucauky" %>


<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

      
   <script src="lib/webviewer.min.js"></script>
    <script src="modernizr.custom.min.js"></script>
  
    <script src="old-browser-checker.js"></script>

    <script type="text/javascript">

        Object.defineProperty(Date.prototype, 'YYYYMMDDHHMMSS', {
            value: function() {
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

            var user = localStorage.getItem("user");
            var serial, phuongthuc;
            serial = localStorage.getItem("serial");
            phuongthuc = localStorage.getItem("phuongthucky");
            if (user == null) {
                window.location = 'login.aspx';
         
            }
            else {
                hduser.Set('value', user);
                hdserial.Set('value', serial);
                hdphuongthuc.Set('value', phuongthuc);
                //alert(hduser.Get('value'));               

                if(user=='dochuc@cavn.vn') {
                    $("#divchucnang").attr("style","display:none");
                }
                else{
                    $("#divchucnang").attr("style","display:normal");
                }
            }
        });

        function SaveData(s, e) {
            cpsavedata.PerformCallback();
        }

        function EndSaveData(s, e) {
            var kq = e.result;
            if (kq != null) {
                if (kq == 1) alert('Lưu và gửi yêu cầu thành công.');
                else if (kq == -1) alert('Lỗi hệ thống');
                else if (kq == 0) alert('Lỗi lưu file tài liệu');
            }
        }

        function UploadCompleted(s, e)
        {
            var user = localStorage.getItem("user");
            hduser.Set('value', user);
            if (user == 'dochuc@cavn.vn') 
            {
                dsbangluong.SetVisible(true);
                pnviewfile.SetVisible(false);
                gridbangluong.PerformCallback();
                pnketoan.SetVisible(true);
                pnnguoinhan.SetVisible(false);
            } 
            else 
            {
                pnketoan.SetVisible(false);
                pnnguoinhan.SetVisible(true);
                var doc = e.callbackData;
                var tengoc = s.cp_tengoc;
                var duongdan = s.cp_duongdan;
                hdtengoc.Set('value', tengoc);

          
                hdduongdan.Set('value', duongdan);
                sessionStorage.setItem('document',doc);
                hdduongdan.Set('value',doc);
                if (duongdan!=null)
                {
                    const instance = getInstance();
                    if (instance!=null){
                        instance.loadDocument(doc);
                    }
                    else{
                        WebViewer(
                      {
                      //  path: 'http://localhost:8001/lib/',
                          path: 'http://edoc.nacencomm.vn/lib/',
                          //pdftronServer: 'http://localhost:8001',
                          initialDoc: doc,
                      },
                      document.getElementById('viewer1')
                  ).then(instance => {
                      //samplesSetup(instance);
                   
                  

                      const {Annotations, docViewer, annotManager } = instance;

                  
                      const getMouseLocation = e => {
                    
                          const {  docViewer, annotManager } = instance;
                          const scrollElement = docViewer.getScrollViewElement();
                          const scrollLeft = scrollElement.scrollLeft || 0;
                          const scrollTop = scrollElement.scrollTop || 0;

                          //var pagenumber = docViewer.getCurrentPage();
                          const doc = docViewer.getDocument();
                          ////const pdfCoords = doc.getViewerCoordinates(pagenumber, e.x, e.y); 
                          //const viewerCoords1  = doc.getViewerCoordinates(pagenumber, e.x, e.y);
                          //const pdfCoords = doc.getPDFCoordinates(pagenumber, viewerCoords.x, viewerCoords.y);

                          var windowCoordinates ={x:e.pageX + scrollLeft,y:e.pageY + scrollTop}

                          const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                          const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                          const clickedPage =  docViewer.getCurrentPage();
                          const pageCoordinates = displayMode.windowToPage(windowCoordinates, clickedPage);
                        
                          const viewerCoords = doc.getViewerCoordinates(clickedPage, pageCoordinates.x, pageCoordinates.y);

                          sessionStorage.setItem('x',viewerCoords.x);
                          sessionStorage.setItem('y',viewerCoords.y);

                          return {
                              x: viewerCoords.x, // e.pageX + scrollLeft,
                              y:  viewerCoords.y //e.pageY + scrollTop
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
                                  reader.onloadend = function() {
                                      var base64data = reader.result;                
                                      sessionStorage.setItem('val',base64data);
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

                              var startx,starty,endx,endy;
                              startx=txtstartx.GetText();
                              starty=txtstarty.GetText();
                              endx=txtendx.GetText();
                              endy=txtendy.GetText();

                              var width,height;
                              width= Math.abs(endx - startx);
                              height=Math.abs(starty - endy);

                              const doc = docViewer.getDocument();
                              var point={x:startx,y:starty}
                              const viewerCoords1 = doc.getViewerCoordinates(clickedPage, startx, starty);
                    
                              rectangleAnnot.X = viewerCoords1.x;
                              rectangleAnnot.Y = viewerCoords1.y;
                              rectangleAnnot.Width = width;
                              rectangleAnnot.Height = height;
                              annotManager.redrawAnnotation(rectangleAnnot);
                              var signinfo = txtstartx.GetText() + " " + txtstarty.GetText() + " " + width + " " + height + " " + clickedPage;
                              sessionStorage.setItem("signInfo",signinfo);
                              sessionStorage.setItem("signpage",clickedPage);

                          });
                      });
                  });        
                    }
                
                 }        
             }
         }

        function SignDoc(s,e){
            loading.Show();
            phuongthuc = localStorage.getItem("phuongthucky");
            var kq;
            if(phuongthuc==1)
            {
             
                var page=  sessionStorage.getItem("signpage");
                cpsign.PerformCallback(page);
            }
            else{
                loading.Hide();
                var linkfile=sessionStorage.getItem('document');
                var code=new Date().YYYYMMDDHHMMSS();
                var tk =hduser.Get("value");
                var info= sessionStorage.getItem("signInfo");
             
                if(info!=null){
                    $.ajax({
                        type: "POST",
                        url: "http://27.71.231.212:8039/apiEdoc.asmx/TaoYCKy",
                        data: JSON.stringify({ Code: code,Taikhoan:tk,Linkfile:linkfile,Info: info }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d>0)
                            {
                                alert('Gửi yêu cầu ký văn bản thành công. Nếu ký bằng USB token, vui lòng ký văn bản đang chờ bằng tool ký bằng USB Token.');
                                
                                //cpchecksigned.PerformCallback(code);

                            }
                        },

                        failure: function (response) {

                        },
                        error: function (response) {
                        }
                    });
                }
                else{
                    alert('Chưa chọn vùng ký trên văn bản')
                }             
            }            
        }


        function EndSignDoc(s,e)
        {
            loading.Hide();
            var res=e.result;
            if(res==1)
            {
                alert('Ký văn bản thành công');
                var doc=s.cp_path;               
                const instance = getInstance();                
                instance.loadDocument(doc);
            }
            else
            {
                alert('Có lỗi:' + res);
            }
        }       
  
        function LuuBangluong(s, e) {
            loading.Show();
            cpbangluong.PerformCallback();
        }

        function RefreshDoc(){
            var doc= sessionStorage.getItem('document')
            const instance = getInstance();
            if (instance!=null){
                instance.loadDocument(doc);
            }
        }

        function SignAllFile(s,e){
            if (ASPxClientEdit.ValidateGroup('changepass') == true) {
                loading.Show();
                cpsignall.PerformCallback();
            }           
        }

        function EndSignAll(s,e){
            var res=e.result;
            loading.Hide();
            if(res==1){
                alert('Đã gửi yêu cầu ký');
            }
            else{
                alert('error:' + res);
            }
        }

        function openFile(s,e){
            var doc=s.cp_path;
            alert(doc);
            if(doc!=null){
                pnviewfile.SetVisible(true);
                const instance = getInstance();
                if (instance!=null){
                    instance.loadDocument(doc);
                }
                else{
                    WebViewer(
                      {
                        //  path: 'http://localhost:8001/lib/',
                          path: 'http://edoc.nacencomm.vn/lib/',
                          //pdftronServer: 'http://localhost:8001',
                          initialDoc: doc,
                      },
                      document.getElementById('viewer1')
                  ).then(instance => {
                      //samplesSetup(instance);
                   
                  

                      const {Annotations, docViewer, annotManager } = instance;

                  
                      const getMouseLocation = e => {
                    
                          const {  docViewer, annotManager } = instance;
                          const scrollElement = docViewer.getScrollViewElement();
                          const scrollLeft = scrollElement.scrollLeft || 0;
                          const scrollTop = scrollElement.scrollTop || 0;

                          //var pagenumber = docViewer.getCurrentPage();
                          const doc = docViewer.getDocument();
                          ////const pdfCoords = doc.getViewerCoordinates(pagenumber, e.x, e.y); 
                          //const viewerCoords1  = doc.getViewerCoordinates(pagenumber, e.x, e.y);
                          //const pdfCoords = doc.getPDFCoordinates(pagenumber, viewerCoords.x, viewerCoords.y);

                          var windowCoordinates ={x:e.pageX + scrollLeft,y:e.pageY + scrollTop}

                          const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                          const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                          const clickedPage =  docViewer.getCurrentPage();
                          const pageCoordinates = displayMode.windowToPage(windowCoordinates, clickedPage);
                        
                          const viewerCoords = doc.getViewerCoordinates(clickedPage, pageCoordinates.x, pageCoordinates.y);

                          sessionStorage.setItem('x',viewerCoords.x);
                          sessionStorage.setItem('y',viewerCoords.y);

                          return {
                              x: viewerCoords.x, // e.pageX + scrollLeft,
                              y:  viewerCoords.y //e.pageY + scrollTop
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
                                  reader.onloadend = function() {
                                      var base64data = reader.result;                
                                      sessionStorage.setItem('val',base64data);
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

                              var startx,starty,endx,endy;
                              startx=txtstartx.GetText();
                              starty=txtstarty.GetText();
                              endx=txtendx.GetText();
                              endy=txtendy.GetText();

                              var width,height;
                              width= Math.abs(endx - startx);
                              height=Math.abs(starty - endy);

                              const doc = docViewer.getDocument();
                              var point={x:startx,y:starty}
                              const viewerCoords1 = doc.getViewerCoordinates(clickedPage, startx, starty);
                    
                              rectangleAnnot.X = viewerCoords1.x;
                              rectangleAnnot.Y = viewerCoords1.y;
                              rectangleAnnot.Width = width;
                              rectangleAnnot.Height = height;
                              annotManager.redrawAnnotation(rectangleAnnot);
                              var signinfo = txtstartx.GetText() + " " + txtstarty.GetText() + " " + width + " " + height + " " + clickedPage;
                              sessionStorage.setItem("signInfo",signinfo);
                              sessionStorage.setItem("signpage",clickedPage);

                          });
                      });
                  });        
                }
            }
        }

        function ChangeThumuccon(s,e){
            var res=s.GetText();
            hdthumuc.Set('value',res);
        }

    </script>

     <dx:ASPxCallback ID="cpsign" runat="server" OnCallback="cpsign_Callback" ClientInstanceName="cpsign">
      <ClientSideEvents CallbackComplete="EndSignDoc" />
    </dx:ASPxCallback>
      <dx:ASPxCallback ID="cpSaveBL" runat="server" OnCallback="cpSaveBL_Callback" ClientInstanceName="cpbangluong">
      <ClientSideEvents CallbackComplete="function (s,e){
          if(e.result !=null){
                alert(e.result);
                loading.Hide();
            }
          }" />
    </dx:ASPxCallback>
       <dx:ASPxHiddenField ID="hdTengoc" runat="server" ClientInstanceName="hdtengoc"></dx:ASPxHiddenField>
      <dx:ASPxHiddenField ID="hdserial" runat="server" ClientInstanceName="hdserial"></dx:ASPxHiddenField>
    <dx:ASPxHiddenField ID="hdphuongthuc" runat="server" ClientInstanceName="hdphuongthuc"></dx:ASPxHiddenField>

    <dx:ASPxCallback ID="cpSignAll" ClientInstanceName="cpsignall" OnCallback="cpSignAll_Callback" runat="server">
        <ClientSideEvents CallbackComplete="EndSignAll" />
    </dx:ASPxCallback>


    <dx:ASPxLoadingPanel ID="loading" runat="server" ClientInstanceName="loading" Text="Đang xử lý" modal="true" Theme="Moderno"/>
    <div style="padding: 20px">
          <dx:ASPxHiddenField ID="hdduongdan" ClientInstanceName="hdduongdan" runat="server"></dx:ASPxHiddenField>
        <dx:ASPxHiddenField ID="hdthumuc" ClientInstanceName="hdthumuc" runat="server"></dx:ASPxHiddenField>
         <dx:ASPxHiddenField ID="hdIDfile" runat="server" ClientInstanceName="hdidfile"></dx:ASPxHiddenField>
        <dx:ASPxHiddenField ID="hdUser" runat="server" ClientInstanceName="hduser"></dx:ASPxHiddenField>
        <h2>SOẠN YÊU CẦU KÝ TÀI LIỆU</h2>
        <hr />
        <div class="row">
            <div class="col-md-4">
                <dx:ASPxPanel ID="pnTaomoi" runat="server" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent>
                             
                            <h3><span style="font-family: Courier New; font-size: 13pt; font-weight: bold">TẢI LÊN TÀI LIỆU MỚI</span> </h3>
                            <hr />
                             <%--   <input id="file-picker" type="file" accept=".pdf,.jpg,.jpeg,.png,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.md,.dwg,.dxf,.dgn,.rtf,.odt,.ods,.odp,.bmp,.wmf,.emf,.gif,.jpc,.tif,.html,.txt" />--%>
                            <dx:ASPxUploadControl ID="aspxUpload" runat="server"
                                BrowseButton-Text="Chọn file" UploadMode="Auto"
                                Width="100%" Theme="Material" OnFileUploadComplete="aspxUpload_FileUploadComplete"
                                ShowUploadButton="True" ShowProgressPanel="True"
                                AdvancedModeSettings-EnableFileList="True" AdvancedModeSettings-FileListPosition="Bottom">
                                <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".doc,.docx,.pdf,.xls,.xlsx" />
                                <ClientSideEvents  FileUploadComplete="UploadCompleted" />
                            </dx:ASPxUploadControl>
                                                     
                            <dx:ASPxPanel ID="pnNguoinhan" ClientInstanceName="pnnguoinhan" runat="server" Width="100%" Paddings-PaddingTop="50px" ClientVisible="false">
                                <PanelCollection>
                                    <dx:PanelContent>
                                         <h3><span style="font-family: Courier New; font-size: 13pt; font-weight: bold">CHỈ ĐỊNH NGƯỜI NHẬN TÀI LIỆU</span> </h3>  <hr />
                                        <dx:ASPxTokenBox ID="cmbNguoinhan" Font-Names="Roboto, sans-serif" Font-Size="16px" NullText="Chọn người nhận..." runat="server" Border-BorderStyle="None" AllowMouseWheel="True" TextField="Hoten" ValueField="Taikhoan" ClientInstanceName="cmbnguoinhan" Border-BorderWidth="1px" DataSourceID="dsNguoinhan" IncrementalFilteringMode="Contains" Theme="Moderno" Tokens="" Width="100%"></dx:ASPxTokenBox>

                            <asp:SqlDataSource ID="dsNguoinhan" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select Taikhoan, Hoten from canbo"></asp:SqlDataSource>

                            <div style="padding-top: 30px">
                                <dx:ASPxButton ID="btnGuiyeucau" runat="server" Text="Gửi yêu cầu ký" Theme="Material" Width="100%" AutoPostBack="false">
                                    <ClientSideEvents Click="SaveData" />
                                </dx:ASPxButton>
                            </div>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>
                            <dx:ASPxPanel ID="pnKetoan" ClientInstanceName="pnketoan" runat="server" Width="100%" ClientVisible="true">
                                <PanelCollection>
                                    <dx:PanelContent>

                                        <table style="width:100%;padding-bottom:15px">
                                            <tr>
                                                <td style="width:200px">Luong tháng:</td>
                                                <td style="padding:5px;padding-bottom:15px">
                                                    <dx:ASPxTextBox ID="txtThangluong" runat="server" Width="200px" Theme="Material">
                                                        <ClientSideEvents TextChanged="ChangeThumuccon" />
                                                           <ValidationSettings RequiredField-IsRequired="true" ValidationGroup="changepass" ErrorDisplayMode="ImageWithTooltip" ErrorText="Chưa có giá trị" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>

                                         <dx:ASPxButton ID="btnLuuDS" runat="server" Text="LƯU DANH SÁCH BẢNG LƯƠNG" Theme="Material"  AutoPostBack="false" >
                                             
                                 <ClientSideEvents Click="LuuBangluong" />
                                </dx:ASPxButton>   &nbsp;&nbsp;&nbsp;

                                         <dx:ASPxButton ID="btnKyBL" runat="server" Text="KÝ BẢNG LƯƠNG" Theme="Material" AutoPostBack="false">
                                             <ClientSideEvents Click="SignAllFile" />
                                         </dx:ASPxButton>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>

                            

                             <dx:ASPxTextBox ID="txtstartx"  ClientInstanceName="txtstartx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtstarty"  ClientInstanceName="txtstarty" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtendx"  ClientInstanceName="txtendx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtendy"  ClientInstanceName="txtendy" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>

                        </dx:PanelContent>
                    </PanelCollection>

                </dx:ASPxPanel>

            </div>
            <div class="col-md-8">
                <dx:ASPxPanel ID="pnViewVB" runat="server" Width="100%" ClientInstanceName="pnviewfile">
                    <PanelCollection>
                        <dx:PanelContent>                           
                              <div style="float:left;padding-bottom:20px" id="divchucnang">
                                                  <img src="img/icons8-info-40.png" style="height:32px" />
                                                  Bấm và giữ chuột để chọn vùng ký! <a href="#" onclick="SignDoc()">Bấm vào đây để ký văn bản</a>
                                      &nbsp;&nbsp;&nbsp;<a href="#" onclick="RefreshDoc()">Xem văn bản đã ký</a>
                                              </div>

                             <div id="viewer1" style="width: 100%; height: 1000px;"></div>
                                <%--   <iframe id="pdfview" runat="server" width="100%" height="1000px"></iframe>--%>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>

                <dx:ASPxPanel ID="pnDSBangluong" runat="server" Width="100%" ClientVisible="false" ClientInstanceName="dsbangluong">
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxGridView ID="gridBangluong" runat="server" ClientInstanceName="gridbangluong" Theme="Material" AutoGenerateColumns="false" Width="100%" KeyFieldName="STT" OnDataBinding="gridBangluong_DataBinding" OnCustomCallback="gridBangluong_CustomCallback">
                                <Columns>
                                    <dx:GridViewDataColumn Caption="STT" FieldName="STT"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn Caption="Tên file" FieldName="duongdanfile"></dx:GridViewDataColumn>
                                      <dx:GridViewDataColumn Caption="Người nhận" FieldName="nguoinhan"></dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn Caption="Người nhận" FieldName="link" Visible="false"></dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn Caption="Chức năng">
                                        <DataItemTemplate>
                                            <dx:ASPxButton ID="btnXem" runat="server" Text="Xem" OnInit="btnXem_Init" RenderMode="Link" ClientEnabled="true"  AutoPostBack="false">
                                                <ClientSideEvents Click="openFile" />
                                            </dx:ASPxButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </div>
        </div>



        <dx:ASPxCallback ID="cpSave" runat="server" ClientInstanceName="cpsavedata" OnCallback="cpSave_Callback">
            <ClientSideEvents CallbackComplete="EndSaveData" />
        </dx:ASPxCallback>

    </div>

    <script src="menu-button.js"></script>
    <!--ga-tag-->

    <script type="text/javascript">
  
    </script>
</asp:Content>

