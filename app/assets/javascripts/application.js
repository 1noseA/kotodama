// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require toastr
//= require social-share-button
//= require data-confirm-modal
//= require_tree .

//画像プレビュー
$(document).on('turbolinks:load', function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#prev_img').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#post_img").change(function(){
      readURL(this);
  });
});

$(document).on('turbolinks:load', function(){
    $('.random-slide').slick({
      // 左右ボタンで画像の切り替えをできるかどうか
      accessibility: true,
      // trueで自動再生
      autoplay:true,
      // 自動再生で切り替えをする時間
      autoplaySpeed: 3000,
      // 自動再生や左右の矢印でスライドするスピード
      speed: 300,
      // 自動再生時にスライドのエリアにマウスオンで一時停止するかどうか
      pauseOnHover: true,
      // 自動再生時にドットにマウスオンで一時停止するかどうか
      pauseOnDotsHover: true,
      // 画像下のドット（ページ送り）を表示
      dots:true,
    });
  });