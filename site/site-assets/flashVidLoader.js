$(document).ready(function() {

    var flashVidCheck = $("html").hasClass("eq-ie8")

    if (flashVidCheck) {
        $("#flashVid").css("display", "block");
        var vidPath = $("#flashVid").attr("data-iframeSRC")
        $("#flashVid iframe").attr("src", vidPath);
    }

});