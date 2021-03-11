// JavaScript source code
(function showUserMenu() {

    $(".nav-user").click(function () {
        $(".user-dropdown").toggle();
    });
})();

(function showfilterblock() {
    $("#filter-button").click(function () {
        $(".filter-dropdown").toggle();
    });
})();