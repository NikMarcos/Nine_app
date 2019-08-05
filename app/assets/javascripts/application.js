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

  if (gon.splited_article) {
    $('.sub').hide();
    const download_image_block = document.getElementById('download_image_block');
    const common_block = document.getElementById('common_block');
    const form_block = document.getElementById('form_block');
    let splitArticle = gon.splited_article.body.split('.');
    for(let i = 0; i < splitArticle.length; i++) {
      let textSpan = document.createElement('span');
      textSpan.setAttribute('id', i);
      const correctArticlePart = document.createTextNode(`${splitArticle[i]}.`);
      textSpan.appendChild(correctArticlePart);
      common_block.appendChild(textSpan);
    };
    let imagesClicks2 = 0;
    let imageClicks = 1;
    $('span').on("click", function(){
      $('.sub').show();
      let imageBlock = document.createElement('div');
      imageBlock.setAttribute('class', 'imagePlace');
      imageBlock.setAttribute('align', 'center');
      const textImageBlock = document.createTextNode(imageClicks);
      imageBlock.appendChild(textImageBlock);
      $(imageBlock).insertAfter($(`#${this.id}`));

      // let form = $("<form>")
      //   .attr("enctype", "multipart/form-data")
      //   .attr("action", "")
      //   .attr("method", "post")
      //   .appendTo("download_image_block");

      // let input = $("</input>")
      //   .attr("type", "file")
      //   .appendTo("form");

      const textDownloadBlock = document.createTextNode("Выберите изображение для блока " + imageClicks);
      let input1 = document.createElement('input');
      input1.setAttribute('type', 'file');
      input1.setAttribute('name', `image_article[pic[${imagesClicks2}]]`);
      input1.setAttribute('id', this.id);
      input1.setAttribute('class', "set_image_input");
      $(textDownloadBlock).insertBefore($('.sub'));
      $(input1).insertBefore($('.sub'));
      imageClicks++;
      imagesClicks2++;
    });
  }




});
