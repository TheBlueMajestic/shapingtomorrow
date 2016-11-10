/**
 * @author Ian Mitchell - mitchellian@bfusa.com
 * @version 2015.07.14.10.24 [yyyy.mm.dd.hh.mm]
 * @requires
 *	carousel.css
 *	jQuery
 *
 * @usage
 * This script will format the carousel panes and create navigation and pagination controls. 
 * Note the lack of space between the opening and closing <li> tags.  This is  important for proper layout rendering.
 *
 *	carousel markup:
	<div class="carousel">
		<ul class="slider">
			<li class="pane">
				<div class="wrapper">
					{ content goes here }
				</div>
			</li><li class="pane">
				<div class="wrapper">
					{ content goes here }
				</div>
			</li>
		</ul>
	</div>
 *
 * @example
 * ex: var carousel = new Carousel();
 *     carousel.init();
 * Create your own CSS to make changes to the style. Use .pane > .wrapper to provide margin/padding
 * DO NOT update carousel.css
 *
 * Feel free to contact me with any questions: mitchellian@bfusa.com
 */

/*
 * Global variable so that other scripts may call refresh()
 * on dynamically created carousels
 */

var CAROUSEL;

/**
 * Instantiate a new carousel
 *
 * @constructor
 */
function Carousel() {
	var ANIMATING = false;
	
	function addNavEventHandlers( $c ) {
		$n = $c.find( '.navigation' ).first();
		$p = $c.find( '.pagination' ).first();
		
		// left navigation arrow
		$n.find( '.prev' ).click( function ( event ) {
			event.preventDefault();
			
			// prevent if currently animating
			if ( !ANIMATING ) prev( $c );
		});
		
		// right navigation arrow
		$n.find( '.next' ).click( function ( event ) {
			event.preventDefault();
			
			// prevent if currently animating
			if ( !ANIMATING ) next( $c );
		});
		
		// pagination links - jump to slide
		$p.find( 'a' ).click( function ( event ) {
			event.preventDefault();
			
			// prevent if currently animating
			if ( !ANIMATING ) showPane( $c, parseInt( $( this ).attr( 'data-pane' ) ) );
		});
	}
	
	function createNavigation( $c, $p ) {
		if ( $p.length > 1 ) {
			$c.prepend( '<div class="navigation"><ul><li><a class="prev" href="#"><span class="glyphicon"></span></a></li><li><a class="next" href="#"><span class="glyphicon"></span></a></li></ul></div>' );
		}
	}
	
	function createPagination( $c, $p ) {
		if ( $p.length > 1 ) {
			var label;
			var list = [];
			
			// creating or updating? - look for existing pagination block
			var updating = $c.find( '.pagination' ).length;
			
			if ( !updating ) list.push( '<div class="pagination"><ul>' );
			
			// add a marker for each pane
			for ( var i = 0; i < $p.length; i++ ) {
				// check if a label was provided
				label = ( $p.eq( i ).attr( 'data-pane-name' ) != undefined ) ? $p.eq( i ).attr( 'data-pane-name' ) : '';
				
				list.push( '<li><a data-pane="' + i + '" href="#">' + label + '</a></li>' );
			}
			
			if ( !updating ) {
				list.push( '</ul></div>' );
				
				// add pagination to carousel container
				( $c.attr( 'data-nav' ) === 'top' ) ? $c.prepend( list.join( '' ) ) : $c.append( list.join( '' ) );
			} else {
				$c.find( '.pagination ul' ).html( '' ).append( list.join( '' ) );
			}
		}
	}
	
	function next( $c ) {
		/*
		 * check if current pane is the the last pane
		 * if yes - wrap around to the .first pane
		 * if no - show the next pane
		 */
		
		var currPane = parseInt( $c.attr( 'data-curr-pane' ) );
		var paneNumber = ( currPane === ( $c.find( '.pane' ).length - 1 ) ) ? 0 : ( currPane + 1 );
		
		showPane( $c, paneNumber );
	}
	
	function prev( $c ) {
		/*
		 * check if current pane is the the .first pane
		 * if yes - wrap around to the last pane
		 * if no - show the previous pane
		 */
		
		var currPane = parseInt( $c.attr( 'data-curr-pane' ) );
		var paneNumber = ( currPane === 0 ) ? ( $c.find( '.pane' ).length - 1 ) : ( currPane - 1 );
		
		showPane( $c, paneNumber );
	}
	
	function setDimensions( $c, $p ) {
		$c.find( '.slider' ).css( { 'width': ( 100 * $p.length ) + '%' } );
		$p.css( { 'width': ( 100 / $p.length ) + '%' } );
	}
	
	function showPane( $c, p ) {
		var currPane = parseInt( $c.attr( 'data-curr-pane' ) );
		
		if ( currPane !== p ) {
			ANIMATING = true;
			
			var width = $c.outerWidth();
			var distance = currPane - p;
			var direction = ( distance > 0 ) ? "+=" + ( Math.abs( distance ) * width ) : "-=" + ( Math.abs( distance ) * width );
			var $p = $c.find( '.pane' );
			
			// move slider
			$c.find( '.slider' ).animate({
				left: direction
			}, 600, function () {
				ANIMATING = false;
				$c.attr( 'data-curr-pane', p );
			});
			
			updatePagination( $c, p );
		}
	}
	
	function updatePagination( $c, p ) {
		try {
			var $p = $c.find( '.pagination' ).first();
			
			try {
				$p.find( '.active' ).removeClass( 'active' );
			} catch( e ) { /* continue gracefully if not found */ }
			
			$p.find( 'li' ).eq( p ).addClass( 'active' );
		} catch( e ) { /* there is no pagination - continue gracefully */ }
	};
	
	this.refresh = function ( carouselSelector ) {
		var $c = $( carouselSelector );
		var $p = $c.find( '.pane' );
			
		$c.attr( 'data-curr-pane', 0 );
		
		setDimensions( $c, $p );
		createPagination( $c, $p);
		updatePagination( $c, 0 );
		createNavigation( $c, $p );
		addNavEventHandlers( $c );
	};
	
	this.init = function () {
		$( '.carousel' ).each( function () {
			var $c = $( this );
			var $p = $c.find( '.pane' );
			
			$c.attr( 'data-curr-pane', 0 );
			
			setDimensions( $c, $p );
			createPagination( $c, $p);
			updatePagination( $c, 0 );
			createNavigation( $c, $p );
			addNavEventHandlers( $c );
		});
	};
}

/**
 * Public member functions - use the prototype mechanism for inheritance and
 * to conserves memory.
 * @public {function}
 * @param
 */

var carouselInterval = setInterval( function () {
	if ( typeof jQuery !== 'undefined' ) {
		CAROUSEL = new Carousel();
		CAROUSEL.init();
		
		clearInterval(carouselInterval);
	}
}, 100);