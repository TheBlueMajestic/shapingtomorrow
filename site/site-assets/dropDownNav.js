$(document).ready(function() {

    $(".navItem").hover(function(){
        $(this).find("ul").css("display","block")
    }, function() {
        $(this).find("ul").css("display","none")
    });

}); 