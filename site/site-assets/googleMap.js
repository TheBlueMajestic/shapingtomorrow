function GoogleMaps() {
	/**
	 * @global
	 */
	
	// layers and markers
	var BIKE, BSA, COUNTIES, MAP, PARKS, SCHOOLS, START, TRAFFIC, UNIVERSITIES, ZIP_CODES;
	
	var CENTER, INFO_WINDOW;
	
	// directions
	var DIRECTIONS, DIRECTIONS_SERVICE, $PANEL;
	
	function addEventHandlers() {
		google.maps.event.addListener( MAP, 'click', function ( e ) {
			if ( $PANEL.is( ':visible' ) ) {
				START.setPosition( e.latLng );
				START.setMap( MAP );
				calcRoute( e.latLng );
			}
		} );
	
		google.maps.event.addListener( START, 'dragend', function ( e ) {
			if ( $PANEL.is( ':visible' ) ) {
				START.setPosition( e.latLng );
				calcRoute( e.latLng );
			}
		} );
		
		google.maps.event.addListener( COUNTIES, 'click', function ( e ) {
			e.infoWindowHtml = '<div class="googft-info-window"><b>County:</b> ' + e.row["Geographic Name"].value + '</div>';
		} );
		
		google.maps.event.addListener( SCHOOLS, 'click', function ( e ) {
			e.infoWindowHtml = '<div class="googft-info-window">' + 
				'<b>School:</b> ' + e.row["School"].value + '<br/>' +
				'<b>District No:</b> ' + e.row["District No"].value + '<br/>' +
				'<b>District:</b> ' + e.row["District"].value + '<br/>' +
				'<b>Grade Levels:</b> ' + e.row["Grade Levels"].value + '<br/>' +
				'<b>Location:</b> ' + e.row["Location"].value + '<br/>' +
				'<b>Phone:</b> ' + e.row["Phone1"].value + 
			'</div>';
		} );
		
		google.maps.event.addListener( ZIP_CODES, 'click', function ( e ) {
			INFO_WINDOW.setContent( '<div class="googft-info-window">Searching Listings</div>'  );
			INFO_WINDOW.setPosition( e.latLng );
			INFO_WINDOW.open( MAP );
			
			MAP.setCenter( e.latLng );
			
			getListings( e );
		} );
		
		$( 'label' ).click( function ( event ) {
			event.preventDefault();
			toggle( $( this ) );
		} );
		
		$( window ).resize( resizeFN );
	}
	
	function calcRoute( position ) {
		/**
		 * https://developers.google.com/maps/documentation/javascript/directions
		 */
		
		// clear previous directions
		DIRECTIONS.panel.innerHTML = '';
		DIRECTIONS.setMap( null );
		
		// create DirectionsRequest object literal
		var request = {
			origin: position,
			destination: BSA.getPosition(),
			travelMode: google.maps.TravelMode.DRIVING
		};
		
		// Initiating a directions request
		DIRECTIONS_SERVICE.route( request, function ( response, status ) {
			switch ( status ) {
			case google.maps.DirectionsStatus.INVALID_REQUEST:
				DIRECTIONS.panel.innerHTML = 'The request provided was invalid.  Please try again.';
				break;
			case google.maps.DirectionsStatus.NOT_FOUND:
				DIRECTIONS.panel.innerHTML = 'NOT FOUND: The starting location, destination, or waypoints could not be geocoded.  Please try a different location.';
				break;
			case google.maps.DirectionsStatus.OK:
				// update starting address marker title
				START.setTitle( response.routes[0].legs[0].start_address );
				
				// set the renderer to use the result from the DirectionsService
				DIRECTIONS.setDirections( response );
				
				// display route on the map
				DIRECTIONS.setMap( MAP );
				break;
			case google.maps.DirectionsStatus.OVER_QUERY_LIMIT:
				DIRECTIONS.panel.innerHTML = 'REQUEST LIMIT REACHED: This site has gone over the requests limit in too short a period of time.  Please wait a few minutes and try again.';
				break;
			case google.maps.DirectionsStatus.REQUEST_DENIED:
				DIRECTIONS.panel.innerHTML = 'REQUEST DENIED: This site is not allowed to use the directions service.';
				break;
			case google.maps.DirectionsStatus.UNKNOWN_ERROR:
				DIRECTIONS.panel.innerHTML = 'UNKNOWN ERROR: A directions request could not be processed due to a server error. The request may succeed if you try again.';
				break;
			case google.maps.DirectionsStatus.ZERO_RESULTS:
				DIRECTIONS.panel.innerHTML = 'ZERO RESULTS: No route could be found between the starting location and destination.  Please try a different location.';
				break;
			}
		} );
	}
	
	function debounce( func, wait, immediate ) {
		/*
		 * http://davidwalsh.name/javascript-debounce-function
		 * usage: 
		 *		var myEfficientFn = debounce( function () {
		 *			// code to execute when the window is resized
		 *		}, 250 );
		 *
		 *		$( window ).resize( myEfficientFn );
		 */
		
		try {
			var timeout;
			
			return function () {
				var context = this, args = arguments;
				var later = function () {
					timeout = null;
					if ( !immediate ) func.apply( context, args );
				};
				var callNow = immediate && !timeout;
				
				clearTimeout( timeout );
				timeout = setTimeout( later, wait );
				
				if ( callNow ) func.apply( context, args );
			};
		} catch ( e ) {
			( e.message ) ? console.log( e.message ) : console.log( e );
		}
	}
	
	function getListings ( e ) {
		/**
		 * http://developer.trulia.com/docs/read/TruliaStats/getZipCodeStats
		 * @param
		 *		apikey (required)
		 *		zipCode(requied)
		 *		startDate (optional) YYYY-MM-DD
		 *		endDate (optional) YYYY-MM-DD
		 *		statType (optional) Valid types: {"all", "traffic", "listings"}
		 */
		
		// get today's date
		var date = new Date();
		var numDays = 60;
		
		// start [numDays] back
		var startDate = new Date( date.getFullYear(), date.getMonth(), ( date.getDate() - numDays ) );
		var startYear = startDate.getFullYear();
		// add leading 0 for single-digit values
		var startMonth = ( ( startDate.getMonth() + 1 ) < 10 ) ? '0' + ( startDate.getMonth() + 1 ) : ( startDate.getMonth() + 1 );
		var startDate = ( startDate.getDate() < 10 ) ? '0' + startDate.getDate() : startDate.getDate();
		
		$.ajax( {
			url: 'http://query.yahooapis.com/v1/public/yql',
			data: {
				'q': 'SELECT response.TruliaStats FROM xml WHERE url="http://api.trulia.com/webservices.php?' +
					'library=TruliaStats' +
					'&function=getZipCodeStats' +
					'&zipCode=' + e.row["ZIP"].value +
					'&startDate=' + startYear + '-' + startMonth + '-' + startDate +
					'&statType=listings' +
					'&apikey=6drte4hqfuk6be2w2d9cbe45"',
				'format': 'json'
			},
			dataType: 'jsonp',
			error: function ( jqXHR, textStatus, errorThrown ) {
				INFO_WINDOW.setContent( '<div class="googft-info-window">' + errorThrown + '</div>'  );
				INFO_WINDOW.open( MAP ); // pan map to fit info-window
			},
			success: function ( data, textStatus, jqXHR ) {
				INFO_WINDOW.setContent( '<div class="googft-info-window">' + parseListings( e.row["PONAME"].value, data, numDays ) + '</div>'  );
				CAROUSEL.refresh( '.googft-info-window .carousel' );
				INFO_WINDOW.open( MAP ); // pan map to fit info-window
			}
		} );
	}
	
	function hideDirectionsPanel() {
		$PANEL.fadeOut( 300, function () {
			// clear route on the map
			DIRECTIONS.setMap( null );
			
			// remove marker from map
			START.setMap( null );
		} );
	}
	
	function parseListings( city, data, numDays ) {
		var location = data.query.results.TruliaWebServices.response.TruliaStats.location;
		var subCategory, weekEndingDate;
		
		// check if there are any listings
		try {
			var listingStat = data.query.results.TruliaWebServices.response.TruliaStats.listingStats.listingStat;
		} catch ( e ) {
			return 'There are no listings in the <b>' + city + ' (' + location.zipCode + ')</b> area within the last ' + numDays + ' days.';
		}
		
		var content = '<p style="text-align: center">Listings in the <b>' + city + ' (' + location.zipCode + ')</b> area within the last ' + numDays + ' days.</p>';
		
		content += '<div class="carousel">' +
						'<ul class="slider">';
		
		// reverse iteration to start with most current listings
		for ( var i = ( listingStat.length - 1 ); i > 0; i--) {
			weekEndingDate = new Date( listingStat[i].weekEndingDate ).toDateString();
			subCategory = listingStat[i].listingPrice.subcategory;
			
			content += '<li class="pane" style="vertical-align: top">' +
							'<div class="wrapper" style="margin-bottom: 16px; padding: 0 4px">' +
							'<p style="text-align: center">Week Ending: <b>' + weekEndingDate + '</b></p>';
			
			// create column headers
			content += '<table style="margin: 0 auto; width: 70%">' +
							'<tr>' +
								'<th style="padding: 2px; text-align: left">Properties</th>' +
								'<th style="padding: 2px; text-align: center">Listings</th>' +
								'<th style="padding: 2px; text-align: right">Median Price ($K)</th>' +
							'</tr>';
			
			if ( subCategory.length === undefined ) {
				content += '<tr>' +
								'<td style="padding: 2px">' + subCategory.type.replace(/Properties/i, '') + '</td>' +
								'<td style="padding: 2px; text-align: center">' + subCategory.numberOfProperties + '</td>' +
								'<td style="padding: 2px; text-align: right">' + toUSD( subCategory.medianListingPrice ) + '</td>' +
							'</tr>';
			} else {
				for ( var n = 0; n < subCategory.length; n++ ) {
					content += '<tr>' +
									'<td style="padding: 2px">' + subCategory[n].type.replace(/Properties/i, '') + '</td>' +
									'<td style="padding: 2px; text-align: center">' + subCategory[n].numberOfProperties + '</td>' +
									'<td style="padding: 2px; text-align: right">' + toUSD( subCategory[n].medianListingPrice ) + '</td>' +
								'</tr>';
				}
			}
			
			content += '</table>' +
					'</div>' +
				'</li>';
		}
		
		content += '</ul>' +
				'</div>';
		
		return content;
	}
	
	function showDirectionsPanel() {
		DIRECTIONS.panel.innerHTML = '<p>Click anywhere on the map to estimate your drive to the Bridgestone Americas Corporate Headquarters.</p>' +
									'<p>Update your route by dragging the marker to a new location.</p>';
		
		$PANEL.slideDown( 300 );
	}
	
	function toggle( $label ) {
		var $input = $label.siblings( 'input' ).first();
		
		// determine which layer to toggle
		switch ( $label.attr( 'for' ) ) {
		case 'Calculate_Drive_Time':
			if ( $input.is( ':checked' ) ) {
				MAP.setCenter( CENTER );
				
				hideDirectionsPanel();
				
				$input.prop( 'checked', false );
				toggleOff( $label );
			} else {
				turnOffLayer( '#Counties' );
				turnOffLayer( '#Median_Home_Price' );
				
				showDirectionsPanel();
				
				$input.prop( 'checked', true );
				toggleOn( $label );
			}
			break;
		case 'Counties':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				toggleOff( $label, COUNTIES );
			} else {
				// cannot show Median Home Price and Counties at the same time
				turnOffLayer( '#Median_Home_Price' );
				
				/* 
				 * As of this development ( March 2015 ), fusion table layers
				 * do not support z-index.  Counties layer needs to be 
				 * positioned on the bottom ( first layer ) in order to enable
				 * click events on the markers.
				 */
				var showParks = ( PARKS.getMap() != null ) ? true : false;
				var showSchools = ( SCHOOLS.getMap() != null ) ? true : false;
				var showUniversities = ( UNIVERSITIES.getMap() != null ) ? true : false;
				
				// turn off all visible layers with markers
				if ( showParks ) PARKS.setMap( null );
				if ( showSchools ) SCHOOLS.setMap( null );
				if ( showUniversities ) UNIVERSITIES.setMap( null );
				
				// turn on Counties layer
				$input.prop( 'checked', true );
				toggleOn( $label, COUNTIES );
				
				// stack remaining layers on top of Counties
				if ( showParks ) PARKS.setMap( MAP );
				if ( showSchools ) SCHOOLS.setMap( MAP );
				if ( showUniversities ) UNIVERSITIES.setMap( MAP );
			}
			break;
		case 'Directions':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				$( '#DirectionsPanel .wrapper' ).slideDown( 300 );
			} else {
				$input.prop( 'checked', true );
				$( '#DirectionsPanel .wrapper' ).slideUp( 300 );
			}
			break;
		case 'Greenways':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				toggleOff( $label, BIKE );
			} else {
				// cannot show Greenways and Traffic at the same time
				turnOffLayer( '#Traffic' );
				
				$input.prop( 'checked', true );
				toggleOn( $label, BIKE );
			}
			break;
		case 'Median_Home_Price':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				toggleOff( $label, ZIP_CODES );
			} else {
				// cannot show Median Home Price and Counties at the same time
				turnOffLayer( '#Counties' );
				
				$input.prop( 'checked', true );
				toggleOn( $label, ZIP_CODES );
			}
			break;
		case 'Schools':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				toggleOff( $label, SCHOOLS );
			} else {
				$input.prop( 'checked', true );
				toggleOn( $label, SCHOOLS );
			}
			break;
		case 'State_Parks':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				toggleOff( $label, PARKS );
			} else {
				$input.prop( 'checked', true );
				toggleOn( $label, PARKS );
			}
			break;
		case 'Traffic':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				toggleOff( $label, TRAFFIC );
			} else {
				// cannot show Greenways and Traffic at the same time
				turnOffLayer( '#Greenways' );
				
				$input.prop( 'checked', true );
				toggleOn( $label, TRAFFIC );
			}
			break;
		case 'Universities':
			if ( $input.is( ':checked' ) ) {
				$input.prop( 'checked', false );
				toggleOff( $label, UNIVERSITIES );
			} else {
				$input.prop( 'checked', true );
				toggleOn( $label, UNIVERSITIES );
			}
			break;
		}
	}
	
	function toggleOn( $label, layer ) {
		// msieversion() defined in appendAssets.js
		if ( msieversion() < 10 ) {
			$label.find( '.toggleSwitch-switch' ).css( {
				
				
			} ).animate( {
				'margin-right' : "33px"
			}, 200 );
		}
		
		if ( layer ) layer.setMap( MAP );
	}
	
	function toggleOff( $label, layer ) {
		// msieversion() defined in appendAssets.js
		if ( msieversion() < 10 ) {
			$label.find( '.toggleSwitch-switch' ).css( {
			
				
			} ).animate( {
				'margin-right' : "0px"
			}, 200 );
		}
		
		if ( layer ) layer.setMap( null );
	}
	
	function toUSD( number ) {
		/**
		 * split(): convert the string into an array of individual digits
		 * reverse(): reverse the array
		 * join(): turn the array back into a single string again
		 * replace(/regexp/): add a comma to the end of every group of three 
		 *		numbers, unless it is the last group of three numbers
		 *		(to avoid trailing commas)
		 * split(): convert the newly comma’d string to an array again
		 * join(): put the numbers back in the proper order
		 */
		 
		return '$' + number.split('').reverse().join('')
			.replace(/(\d{3}(?!$))/g, '$1,')
			.split('').reverse().join('');
	}
	
	function turnOffLayer( inputID ) {
		var $input = $( inputID );
		
		// check that layer is on
		if ( $input.is( ':checked' ) ) toggle( $input.siblings( 'label' ).first() )
	}
	
	function turnOnLayer( inputID ) {
		var $input = $( inputID );
		
		// check that layer is off
		if ( !$input.is( ':checked' ) ) toggle( $input.siblings( 'label' ).first() )
	}
	
	var resizeFN = debounce( function () {
		try {
			google.maps.event.trigger( MAP, 'resize' );
			MAP.setCenter( CENTER );
		} catch( e ) { /* continue gracefully */ }
	}, 100  );
	
	this.init = function () {
		/*
		 * Google Maps JavaScript API v3.20 Reference
		 * https://developers.google.com/maps/documentation/javascript/reference
		 */
		
		// center the map to the lat/lng of the new Corporate Headquarters
		CENTER = new google.maps.LatLng( 36.159026, -86.775850 );
		
		$PANEL = $( '#DirectionsPanel' );
		
		DIRECTIONS_SERVICE = new google.maps.DirectionsService();
		
		DIRECTIONS = new google.maps.DirectionsRenderer( {
			panel: $PANEL.find( '.wrapper' ).get( 0 ),
			suppressMarkers: true
		} );
		
		INFO_WINDOW = new google.maps.InfoWindow( {
			maxWidth: '400'
		} );
		
		// Create map
		MAP = new google.maps.Map( document.getElementById( 'MapCanvas' ), {
			center: CENTER,
			disableDefaultUI: true,
			scrollwheel: false,
			zoomControl: true,
			zoom: 10
		} );
	
		// Create BSA Corporate Headquarters marker
		BSA = new google.maps.Marker( {
			animation: google.maps.Animation.DROP,
			map: MAP,
			position: CENTER,
			icon: {
				scaledSize: new google.maps.Size( 48, 64, 'px', 'px' ),
				url: '/site-images/icon_marker_bridgestone.png'
			},
			title: 'Bridgestone Americas Headquarters'
		} );
	
		// Create starting address marker for driving directions
		START = new google.maps.Marker( {
			animation: google.maps.Animation.DROP,
			draggable: true,
			icon: {
				scaledSize: new google.maps.Size( 48, 64, 'px', 'px' ),
				url: '/site-images/icon_marker_car.png'
			}
		} );
		
		// Google API provided bike & traffic layers
		BIKE = new google.maps.BicyclingLayer();
		TRAFFIC = new google.maps.TrafficLayer();
	
		/*
		 * Tennessee Counties
		 * @source: https://www.google.com/fusiontables/data?docid=1fWfM5sv8K0Dvkq--Yzwwj2zClVRefqh6gnGiyg
		 *
		 * https://www.gnrc.org/
		 */
		
		COUNTIES = new google.maps.FusionTablesLayer( {
			heatmap: { 
				enabled: false
			},
			query: {
				select: 'col4',
				from: '1fWfM5sv8K0Dvkq--Yzwwj2zClVRefqh6gnGiyg',
				where: 'col2 in ( \x27Cheatham\x27, \x27Davidson\x27, \x27Rutherford\x27, \x27Sumner\x27, \x27Williamson\x27, \x27Wilson\x27 )'
			},
			styles: [{
				polygonOptions: {
					fillColor: '#D65A2A',
					fillOpacity: 0.15,
					strokeColor: '#676767',
					strokeOpacity: 0.4,
					strokeWeight: 1
				},
				where: 'col2 in ( \x27Cheatham\x27, \x27Rutherford\x27, \x27Sumner\x27 )'
			},{
				polygonOptions: {
					fillColor: '#BFE6F2',
					fillOpacity: 0.15,
					strokeColor: '#676767',
					strokeOpacity: 0.4,
					strokeWeight: 1
				},
				where: 'col2 in ( \x27Davidson\x27 )'
			},{
				polygonOptions: {
					fillColor: '#038CC1',
					fillOpacity: 0.15,
					strokeColor: '#676767',
					strokeOpacity: 0.4,
					strokeWeight: 1
				},
				where: 'col2 in ( \x27Williamson\x27, \x27Wilson\x27 )'
			}]
		} );
		
		/*
		 * Tennessee State Parks
		 * @source: http://tnstateparks.com/about/find-a-park
		 */
	
		PARKS = new google.maps.FusionTablesLayer( {
			heatmap: { 
				enabled: false
			},
			query: {
				select: 'col11',
				from: '1rxRZ_wMznn3wH7r4hr3KsnzG9Qc4u33oOX0rdQaK',
				where: 'col6 \x3d \x27TN\x27'
			},
			options: {
				styleId: 2,
				templateId: 2
			}
		} );
		
		/*
		 * Tennessee Schools
		 * @source: http://www.k-12.state.tn.us/SDE/Searches/SearchSchool.asp
		 * search by county > use "Download Data" link
		 */
		
		SCHOOLS = new google.maps.FusionTablesLayer( {
			heatmap: { 
				enabled: false
			},
			query: {
				select: 'col9',
				from: '1dRU5dyZ-1eT2hgg9br0G-PrTWmJoXWUK58_oxzli'
			},
			options: {
				styleId: 2,
				templateId: 2
			}
		} );
		
		/*
		 * Tennessee Colleges and Universities
		 * @source: http://nces.ed.gov/collegenavigator/?s=TN&ct=1+2+3&ic=1+2+3
		 * search by state > use "Export Results" link
		 */
		
		UNIVERSITIES = new google.maps.FusionTablesLayer( {
			heatmap: { 
				enabled: false
			},
			query: {
				select: 'col1',
				from: '17hGyyysh1eQ256WVTGZ673htgEEHa4k5sdDprAbS'
			},
			options: {
				styleId: 2,
				templateId: 2
			}
		} );
		
		/*
		 * Tennessee Zip Codes
		 * @source: https://www.google.com/fusiontables/data?docid=1Lae-86jeUDLmA6-8APDDqazlTOy1GsTXh28DAkw
		 *
		 * http://www.trulia.com/home_prices/Tennessee/
		 */
		 
		ZIP_CODES = new google.maps.FusionTablesLayer( {
			heatmap: { 
				enabled: false
			},
			query: {
				select: 'col2, col3, col6',
				from: '1Lae-86jeUDLmA6-8APDDqazlTOy1GsTXh28DAkw',
				where: 'col6 \x3d \x27TN\x27'
			},
			styles: [{
				polygonOptions: {
					fillColor: '#BFE6F2',
					fillOpacity: 0.15,
					strokeColor: '#676767',
					strokeOpacity: 0.4,
					strokeWeight: 1
				}
			}],
			suppressInfoWindows: true
		} );
		
		addEventHandlers();
		
		// show Counties layer by default
		turnOnLayer( '#Counties' );
	}
}

// check that jQuery has loaded
var jQueryInterval = setInterval( function () {
	if ( typeof jQuery !== 'undefined' ) {
		$( document ).ready( function () {
			var googleMaps = new GoogleMaps();
			googleMaps.init();
		} );
		
		clearInterval( jQueryInterval );
	}
}, 100 );