var path_to_assets = '';

function appendCSS( href ) {
	var css = document.createElement( 'link' );
	css.href = href;
	css.rel = 'stylesheet';
	css.type = 'text/css';
	
	document.getElementsByTagName( 'head' )[0].appendChild( css );
}

function appendScript( src ) {
	var js = document.createElement( 'script' );
	js.src = src;
	js.type = 'text/javascript';
	
	document.getElementsByTagName( 'head' )[0].appendChild( js );
}

/**
* This function returns Internet Explorer's major version number,
* or 0 for others. It works by finding the "MSIE " string and
* extracting the version number following the space, up to the decimal
* point, ignoring the minor version number.
* src: https://support.microsoft.com/en-us/kb/167820
*/
function msieversion() {
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf ( 'MSIE ' );
	
	return ( msie > 0 ) ? parseInt (ua.substring (msie+5, ua.indexOf ('.', msie ))) : 9999;
}

/*appendCSS( path_to_assets + 'css/carousel.css' );*/
/*appendCSS( path_to_assets + 'css/style.css' );*/

if ( typeof jQuery === 'undefined' ) {
	// determine if using IE < 9 and append proper jQuery version
	( msieversion() < 9 ) ? appendScript( path_to_assets + '/site-assets/jquery-1.11.3.min.js' ) : appendScript( path_to_assets + '/site-assets/jquery-2.1.4.min.js' );
}

appendScript( path_to_assets + '/site-assets/carousel.js' );
appendScript( path_to_assets + '/site-assets/googleMap.js' );