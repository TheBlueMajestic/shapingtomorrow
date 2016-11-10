$( document ).ready(function() {

    //Scroll Down Button
    $("#scrollDownBtn").click(function(e) {

        e.preventDefault();

        $('html, body').animate({
            scrollTop: $(window).scrollTop() + $(window).height() - 100
        }, 1300);
        
        console.log(
            $(window).height()
        )
    })
});


