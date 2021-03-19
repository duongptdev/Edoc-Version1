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

(function showfilterblock() {
    $(".item-right").click(function () {
        $(".add-folder-wrapper").toggle();
    });
})();

(function postSelectionClickHandle() {

    var addFolderButton = document.querySelector(".w-dropdown-link.add-group");
    var signModal = document.querySelector(".contact-background-modal");

    var closeModalBtn = document.querySelector(".close-button");

    addFolderButton.addEventListener("click", function () {
        if (signModal.style.display === "none") {
            signModal.style.display = "block";
        } else {
            signModal.style.display = "none";
        }

    });

    closeModalBtn.addEventListener("click", function () {
        if (signModal.style.display === "block") {
            signModal.style.display = "none";
        } else {
            signModal.style.display = "block";
        }
    });
})();


