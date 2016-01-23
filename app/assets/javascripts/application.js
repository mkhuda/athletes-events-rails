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
//= require jquery
//= require tether
//= require bootstrap-sprockets
//= require jquery_ujs
//= require bootstrap-datepicker
//= require trumbowyg/trumbowyg
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .

var ready;
ready = function() {
	$('textarea').trumbowyg({
		fullscreenable: false,
		closable: false,
		btns: ['viewHTML',
      '|', 'formatting',
      '|', 'btnGrp-design',
      '|', 'link',
      '|', 'btnGrp-justify',
      '|', 'btnGrp-lists',
      '|', 'horizontalRule']
		});
	console.log("Welcome to PBISSI");
	$('input.picker').datepicker({
		format: "yyyy-mm-dd"
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);