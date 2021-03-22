<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Templates.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html><!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Mar 02 2021 02:22:13 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ffbfdafc34e63d5d963f8d6" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8">
    <title>Templates</title>
    <meta content="Templates" property="og:title">
    <meta content="Templates" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
    <script
        type="text/javascript">WebFont.load({ google: { families: ["Merriweather:300,300italic,400,400italic,700,700italic,900,900italic", "Great Vibes:400"] } });</script>
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script
        type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
    <style>
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
</head>

<body>

        <div class="delete-background-modal hidden-block">
        <div class="voided-form">
            <div class="heading-modal">
                <div class="contact-text"></div>
                <div id="delete-close" class="close-button">
                    <img src="Content/images/Icons-Close-16px.svg" loading="lazy" alt="Close Modal">
                </div>
            </div>
            <div class="template-form-body">
                <div class="content-template-form">
                    <div class="title-template-form">Liên hệ với chúng tôi</div>
                    <div class="subtitle-template-form">Vui lòng để lại thông tin liên hệ để được hỗ trợ nhanh nhất</div>
                </div>
                <div class="create-template-form w-form">
                <form id="email-form" name="email-form" data-name="Email Form" method="post">
                    <div class="name-field"><label for="name" class="field-label">Họ và tên*</label><input type="text"
                            class="text-field w-input" maxlength="256" name="name" data-name="Name"
                            placeholder="Nhập họ và tên" id="name" required=""></div>
                    <div class="name-field"><label for="Phone" class="field-label">Số điện
                            thoại*</label><input type="tel" class="text-field w-input" maxlength="256" name="Phone"
                            data-name="Phone" placeholder="Nhập số điện thoại" id="Phone"  required=""></div>
                                        <div class="name-field"><label for="Email" class="field-label">Email</label><input type="email"
                            class="text-field w-input" maxlength="256" name="Email" data-name="Email"
                            placeholder="Nhập Email" id="Email"></div>
                    <div class="two-button">
                        <a data-w-id="9f68cfc0-9335-39b2-174e-0dc57e3b6817" href="#" class="ghost-button w-button">Quay lại</a><input type="submit" value="Gửi" data-wait=""
                            class="form-button button-color add-width w-button">
                    </div>
                </form>
            </div>
            </div>
        </div>
    </div>

    <header id="nav" class="sticky-nav">
        <div class="nav-left">
            <div class="logo-container">
                <a href="index.html" class="nav-logo-link w-inline-block"><img src="Content/images/Logo.png" alt=""
                        class="nav-logo"></a>
            </div>
            <div class="nav-menu">
                <ul role="list" class="nav-grid w-list-unstyled">
                    <li class="list-item">
                        <a href="Index.aspx" id="dashboard" class="nav-link">Quản lí</a>
                    </li>
                    <li>
                        <a id="templates" href="http://localhost:58988/Templates.aspx" aria-current="page" class="nav-link w--current">Bản
                            mẫu</a>
                    </li>
                    <li>
                        <a id="contacts" href="http://localhost:58988/Contact.aspx" class="nav-link">Danh bạ</a>
                    </li>
                    <li>
                        <a id="settings" href="http://localhost:58988/SettingAccount.aspx" class="nav-link">Cài đặt</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="nav-right">
                            <a href="#" class="nav-notification" onclick="showNotificationblock()">
                <img src="Content/images/Mask-Group-653.png" loading="lazy" alt="Notification">
                  </a>
                <div class="show-notification">
                      <div class="news-card">
                        <div class="news-label">
                          <div class="news-label-text">Thông báo</div>
                          <a href="#" class="read-all-button w-inline-block">
                            <div>Đọc tất cả</div>
                          </a>
                        </div>
                        <div class="news-divider"></div>
                        <a href="#" class="news-item w-inline-block"><img style="padding-top: 6px;" src="Content/images/Sign-Request.svg" loading="lazy" alt="" class="new-item-icon">
                          <div class="news-text-block">
                            <div class="content-item"><span class="medium-text">nguyentranvankhanh123@gmail.com</span> <span class="change-color">yêu cầu ký</span> “Hợp<br>đồng dịch vụ VMI-NACENCOMM 13.7.20”</div>
                            <div class="date-item">5 phút trước</div>
                          </div>
                        </a>
                        <div class="news-divider"></div>
                        <a href="#" class="news-item w-inline-block"><img style="padding-top: 6px;" src="Content/images/Reject-Request.svg" loading="lazy" alt="" class="new-item-icon">
                          <div class="news-text-block">
                            <div class="content-item read-state"><span class="medium-text">nguyentranvankhanh123@gmail.com</span> <span class="change-color">yêu cầu ký</span> “Hợp<br>đồng dịch vụ VMI-NACENCOMM 13.7.20”</div>
                            <div class="date-item">5 phút trước</div>
                          </div>
                        </a>
                        <div class="news-divider"></div>
                        <a href="#" class="news-item w-inline-block"><img style="padding-top: 6px;" src="Content/images/Setting-Request.svg" loading="lazy" alt="" class="new-item-icon">
                          <div class="news-text-block">
                            <div class="content-item read-state"><span class="medium-text">nguyentranvankhanh123@gmail.com</span> <span class="change-color">yêu cầu ký</span> “Hợp<br>đồng dịch vụ VMI-NACENCOMM 13.7.20”</div>
                            <div class="date-item">5 phút trước</div>
                          </div>
                        </a>
                        <div class="news-divider"></div>
                        <a href="#" class="news-item w-inline-block"><img style="padding-top: 6px;" src="Content/images/Sign-Successful.svg" loading="lazy" alt="" class="new-item-icon">
                          <div class="news-text-block">
                            <div class="content-item read-state"><span class="medium-text">nguyentranvankhanh123@gmail.com</span> <span class="change-color">yêu cầu ký</span> “Hợp<br>đồng dịch vụ VMI-NACENCOMM 13.7.20”</div>
                            <div class="date-item">5 phút trước</div>
                          </div>
                        </a>
                      </div>
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
                        <a href="#" class="option-button remove-padding w-inline-block"><img src="Content/images/Log-Out.svg"
                                loading="lazy" alt="" class="icon-option">
                            <div class="option-text">Đăng xuất</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="container-fluid">
        <div class="row row-margin">
            <div class="col-sm-2">
            <div class="menu-left">
                <a href="#" class="add-file-button w-button"><img src="Content/images/new-file-icon.png" class="margin-icon" alt="icon">Tạo mẫu mới</a>
                <div class="state-dropdown">
                    <div class="title-dropdown">
                        <div class="title-content">
                            <div class="text-and-icon"><img src="Content/images/Path-30115_1.png" loading="lazy" alt=""
                                    class="file-icon">
                                <div class="text-block-4">Tất cả mẫu</div>
                            </div><img src="Content/images/Path-30116.png" loading="lazy" alt="" class="image-9">
                        </div>
                    </div>
                </div>
                <a href="#" class="menu-link w-inline-block">
                    <div class="item-menu-container"><img src="Content/images/Star.png" loading="lazy" alt="">
                        <div class="menu-text-link">Yêu thích</div>
                    </div>
                </a>
                <a href="#" class="menu-link w-inline-block"></a>
            </div>
            </div>
            <div class="col-sm-10">
            <div class="work-area">
                <div class="heading-container">
                    <div class="heading-text">Tất cả mẫu</div>
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
                            <select class="filter-select" id="day-custom" name="day-custom">
                                <option value="all-state">Tất cả</option>
                                <option value="one-month-state">1 tháng trước</option>
                                <option value="three-month-state">3 tháng trước</option>
                                <option value="six-month-state">6 tháng trước</option>
                                <option value="custom-state">Tuỳ chỉnh</option>
                            </select>
                        </div>
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
                        <div class="button-filter">
                            <a href="" aria-current="page" class="back-button w-button w--current">Bỏ qua</a>
                            <button type="submit" class="button-4 w-button">Áp dụng</button>
                        </div>
                    </div>

                <div class="templates-content">
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
                                    <th>Ngày tạo</th>
                                    <th>Cập nhật</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><img src="Content/images/star-icon.svg" loading="lazy" alt=""></td>
                                    <td>
                                        <div class="file-name-index">Mẫu: Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ...</div>                     
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div class="day-created-index">07/12/2020</div>
                                        <div class="user-name-index">03:32:35 PM</div>
                                    </td>
                                    <td>
                                        <div id="w-node-_7682c5da-44dc-1f4c-6d19-479d1c913ab8-d963f8d6"
                                            class="card-button flex-display">
                                            <a href="http://localhost:58988/MultiUploadFile.aspx" class="uses-button w-button">Sử dụng</a>
                                            <a href="http://localhost:58988/YourTemplate.aspx"><img src="Content/images/eye-icon.png" loading="lazy" alt="" class="show-icon"></a>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                </div>
            </div>
            </div>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script src="Scripts/js/webflow.js" type="text/javascript"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/js/e-dropdown.js"></script>
    <script>

        function showNotificationblock() {
           $(".show-notification").toggle();
        }

            (function deleteRequestClickHandle() {

                var deleteButton = document.querySelector(".add-file-button.w-button");
                var deleteModal = document.querySelector(".delete-background-modal.hidden-block");

                var closeDeleteBtn = document.querySelector("#delete-close");

                deleteButton.addEventListener("click", function () {
                    deleteModal.classList.remove("hidden-block");

                });

                closeDeleteBtn.addEventListener("click", function () {
                    deleteModal.classList.add("hidden-block");
                });
            })();

            (function showCustomDay() {

                var dateSelection = document.querySelector("#day-custom");
                var dateCustomBlock = document.querySelector(".date-custom");

                dateSelection.addEventListener('change', function () {
                    var style = this.value == 'custom-state' ? 'flex' : 'none';
                    dateCustomBlock.style.display = style;

                });

            })();
    </script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>

</html>

