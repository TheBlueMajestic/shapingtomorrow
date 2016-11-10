jQuery(function ($) {
	$(".fancybox").fancybox({
		margin: 30,
		autoSize: false
	});
	
	 $.each($(".reveal"), function(index) {
		$.each($(this).find('p'), function(){
			var text = ($(this).text()).replace(/\s+/g,'');
			console.log($(this), text.length);
			if(text.length == 0)
				$(this).remove();
		});
	 });
});