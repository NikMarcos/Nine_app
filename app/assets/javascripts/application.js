// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
$("<br>").insertBefore($(".container"));
$('.container').on('click', function (el) {
  let destination = $(this).attr('data-link');
  window.location.href = destination;
});

$("#search").on("keyup", function() {
   var value = $(this).val().toLowerCase();
   if (value) {
     $(".content").children().show();
     $(".content").children().not($(`div[class*=${value}]`)).hide();
     $( "br" ).remove( "#inside" );
     $("<br id='inside'>").insertBefore($(`div[class*='${value}'].container`));
   } else {
     $(".content").children().show();
     $("br").remove('#inside');
   }
 });

});
