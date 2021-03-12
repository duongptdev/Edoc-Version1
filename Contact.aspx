﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<!DOCTYPE html><!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Jan 19 2021 02:07:46 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ffbff73233c2ff8595a19e4" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8">
    <title>Contacts</title>
    <meta content="Contacts" property="og:title">
    <meta content="Contacts" property="twitter:title">
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
    <div style="opacity:0" class="background-modal">
        <div class="modal-form add-contact-width">
            <div class="heading-modal">
                <div class="title-modal">Thêm liên hệ mới</div>
                <div data-w-id="364e1923-9d43-5395-460f-ad19efcd0897" class="close-button"><img
                        src="Content/images/Path-30115.png" loading="lazy" alt="Close Modal"></div>
            </div>
            <div class="add-contact-form w-form">
                <form id="email-form" name="email-form" data-name="Email Form" method="post">
                    <div class="name-field"><label for="name" class="field-label">Họ và tên*</label><input type="text"
                            class="text-field w-input" maxlength="256" name="name" data-name="Name"
                            placeholder="Nhập họ và tên" id="name" required=""></div>
                    <div class="name-field"><label for="Email" class="field-label">Email*</label><input type="email"
                            class="text-field w-input" maxlength="256" name="Email" data-name="Email"
                            placeholder="Nhập Email" id="Email" required=""></div>
                    <div class="name-field"><label for="Company" class="field-label">Tên Công ty</label><input
                            type="text" class="text-field w-input" maxlength="256" name="Company" data-name="Company"
                            placeholder="Nhập tên công ty" id="Company"></div>
                    <div class="name-field add-margin"><label for="Phone" class="field-label">Số điện
                            thoại</label><input type="tel" class="text-field w-input" maxlength="256" name="Phone"
                            data-name="Phone" placeholder="Nhập số điện thoại" id="Phone"></div>
                    <div class="two-button">
                        <a data-w-id="9f68cfc0-9335-39b2-174e-0dc57e3b6817" href="#" class="ghost-button w-button">Bỏ
                            qua</a><input type="submit" value="Xác nhận" data-wait=""
                            class="form-button button-color add-width w-button">
                    </div>
                </form>
                <div class="w-form-done">
                    <div>Thank you! Your submission has been received!</div>
                </div>
                <div class="w-form-fail">
                    <div>Oops! Something went wrong while submitting the form.</div>
                </div>
            </div>
        </div>
    </div>
    <header id="nav" class="sticky-nav">
        <div class="nav-left">
            <div class="logo-container">
                <a href="index.html" class="nav-logo-link w-inline-block"><img src="Content/images/Logo.png" alt="Logo"
                        class="nav-logo"></a>
            </div>
            <div class="nav-menu">
                <ul role="list" class="nav-grid w-list-unstyled">
                    <li class="list-item">
                        <a href="http://localhost:58988/Index.aspx" id="dashboard" class="nav-link">Quản lí</a>
                    </li>
                    <li>
                        <a id="templates" href="templates.html" class="nav-link">Bản mẫu</a>
                    </li>
                    <li>
                        <a id="contacts" href="http://localhost:58988/Contact.aspx" aria-current="page" class="nav-link w--current">Danh
                            bạ</a>
                    </li>
                    <li>
                        <a id="settings" href="settings.html" class="nav-link">Cài đặt</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="nav-right">
            <div class="nav-notification"><img src="Content/images/Mask-Group-653.png" loading="lazy" alt="Notification"></div>
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
    <div class="w-layout-grid dashboard-grid">
        <div id="w-node-7889c68f6827-595a19e4" class="menu-left">
            <div class="title-menu">danh bạ</div>
            <a href="#" class="menu-link w-inline-block">
                <div class="item-menu-container">
                    <div class="menu-text-link">Tất cả liên hệ</div>
                </div>
            </a>
            <a href="#" class="menu-link w-inline-block">
                <div class="item-menu-container space-between">
                    <div class="item-left">
                        <div class="menu-text-link">Nhóm</div>
                    </div>
                    <div class="item-right"><img src="Content/images/Group-15086_1.png" loading="lazy" alt="function"></div>
                </div>
            </a>
        </div>
        <div class="work-area">
            <div class="heading-container">
                <div class="heading-text">Tất cả liên hệ</div>
                                    <div class="search-and-filter">
                         <div class="search-block">
                             
                            <input type="search" class="search-input-block w-input" name="query" placeholder="Tìm kiếm tài liệu" id="search">
                                <a href="" class="search-icon-button"><img src="Content/images/search-icon.png" alt=""></a>
                        </div>

                        <div class="divider-search"></div>
                <a data-w-id="b7306d4b-9b2b-8819-9a89-2495b3b6303b" href="#" class="contact-button w-button">Thêm liên
                    hệ</a>
                    </div>
            </div>
            <div class="subtitle-heading">05 liên hệ</div>
            <div class="contact-table">
                        <table class="contact-table-ui">

                            <colgroup>
                                <col width="30" />
                                <col width="150" />
                                <col width="100" />
                                <col width="100" />
                                <col width="100" />
                                <col width="100" />
                            </colgroup>

                            <thead style="border-top: 1px solid #B3BAC5;">
                                <tr>
                                    <th></th>
                                    <th>Họ và tên</th>
                                    <th>Địa chỉ Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Nhóm</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        Nguyen Tran Van Khanh
                                    </td>
                                    <td>nguyenvankhanh123@gmail.com</td>
                                    <td>+84 972 373 2115</td>
                                    <td>NACENCOMM</td>
                                    <td>
                                                                            <div data-hover="" data-delay="0" class="w-dropdown">
                                        <div class="dropdown-toggle-6 w-dropdown-toggle">
                                            <img src="Content/images/Group-15086_1.png"
                                                loading="lazy" alt="function">
                                        </div>
                                        <nav class="w-dropdown-list">
                                            <a id="contact-function-link" href="#" class="w-dropdown-link">Chỉnh sửa</a>
                                            <a id="contact-function-link" href="#" class="w-dropdown-link">Thêm vào nhóm</a>
                                            <a href="#" class="w-dropdown-link">Xoá liên hệ</a>
                                        </nav>
                                    </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>
                                        Nguyen Tran Van Khanh
                                    </td>
                                    <td>nguyenvankhanh123@gmail.com</td>
                                    <td>+84 972 373 2115</td>
                                    <td>NACENCOMM</td>
                                    <td>
                                                                            <div data-hover="" data-delay="0" class="w-dropdown">
                                        <div class="dropdown-toggle-6 w-dropdown-toggle">
                                            <img src="Content/images/Group-15086_1.png"
                                                loading="lazy" alt="function">
                                        </div>
                                        <nav class="w-dropdown-list">
                                            <a id="contact-function-link" href="#" class="w-dropdown-link">Chỉnh sửa</a>
                                            <a id="contact-function-link" href="#" class="w-dropdown-link">Thêm vào nhóm</a>
                                            <a href="#" class="w-dropdown-link">Xoá liên hệ</a>
                                        </nav>
                                    </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script src="Scripts/js/webflow.js" type="text/javascript"></script>
    <script src="Scripts/js/e-dropdown.js"></script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>

</html>
