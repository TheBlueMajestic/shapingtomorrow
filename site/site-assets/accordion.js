$(document).ready(function() {

    //Initialize openItem var
    var openedItem;
    var openedItemNum;

    //Get the height of each answer and store it
    $.each($(".accord"), function(index) {
        $.each($(this).find('.reveal'), function(){
		$.each($(this).find('p'), function(){
			var text = ($(this).text()).replace(/\s+/g,'');
			if(text.length == 0)
				$(this).remove();
		});
		var getHeight = $(this)[0].scrollHeight;
       	 	$(this).attr("data-height", getHeight).css('display','none');
	});
    })

    //Accordion Button
    $(".accord .trigger").click(function(e) {

        e.preventDefault();

        //Clicked Item
        $$ = $(this);

        //Close Open Accordion
        $(".accord").eq(openedItemNum).find(".reveal").animate({
            height: "0px"
        }, 300, function() {

            //reset Item
            $(this).css("display", "none");
            openedItemNum = "x"; //Reset open item number    
        });


        //Open Item Height
        if ($(".accord").index($$.parent()) != openedItemNum) {
        
            var getHeight = $$.next().attr("data-height");
            getHeight = getHeight + "px";

            //Prep Animation animation
            $$.parent().find(".reveal").css({ "height": "0px", "overflow": "hidden", "display": "block" });

            //Open Accordion
            $$.parent().find(".reveal").animate({
                height: getHeight
            }, 300, function() {
                openedItemNum = $(".accord").index($$.parent());
            });
        }




        //opened item
        //openedItem = $(".accord").eq(openedItemNum)

        //Closer
        /*
        $(openedItem).find(".reveal").animate({  
        height: "0px"
        }, 300, function(){

                    //reset Item
        $(this).css("display", "none");
        openedItemNum = "x"; //Reset open item number    
        });   
        */

        //Opener - check to see if tis is the open item
        //console.log($(".accord").index($$))
        //console.log(openedItemNum)
        /*
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
        */
    })//end button click
});