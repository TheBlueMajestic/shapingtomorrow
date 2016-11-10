$( document ).ready(function() {   
    
    var calcHeight = $("#discoverImages .images").width() * 0.75
    $("#discoverImages .images").css("height", calcHeight);
    //$("#discoverImages").css("height", calcHeight);
    
    $( window ).resize(function() {
    
        calcHeight = $("#discoverImages .images").width() * 0.75
        $("#discoverImages .images").css("height", calcHeight);
        //$("#discoverImages").css("height", calcHeight);
        
    });
    
});