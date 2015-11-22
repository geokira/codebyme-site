$(document).ready( function ( ) {
   $("a.feature-image").click(moveRight);
});

var moveRight = function() {
$( "img.feature-image" ).animate({left:"+=100"},"slow");
}