$( document ).ready(function() {

        //Initialize openItem var
        var openedItem;
        var openedItemNum;
        
        //Get the height of each answer and store it
        $.each($(".accord"), function(index) {
            var getHeight = $(this).find(".reveal").height();
            $(this).attr("data-height", getHeight);
            $(this).find(".reveal").css("display", "none");
        })
    
        //Scroll Down Button
        $(".accord").click(function(e) {

            e.preventDefault();
            
            //Clicked Item
            $$ = $(this);
            
            //opened item
            openedItem = $(".accord").eq(openedItemNum)
            
            //Closer
            $(openedItem).find(".reveal").animate({  
                    height: "0px"
                }, 300, function(){

                    //reset Item
                    $(this).css("display", "none");
                    openedItemNum = "x"; //Reset open item number    
             });   
      

            //Opener - check to see if tis is the open item
             console.log($(".accord").index($$))
            console.log(openedItemNum)
            if ($(".accord").index($$) != openedItemNum) {
                
                var getHeight = $(this).attr("data-height");
                getHeight = getHeight + "px";

                //setup animation
                $(this).find(".reveal").css({ "height": "0px", "overflow": "hidden", "display": "block" });

                //open item
                $(this).find(".reveal").animate({  
                
                    height: getHeight
                    
                    }, 300, function(){

                    openedItemNum = $(".accord").index($$);
                        
                });
            }//end if
        
        })//end button click
});