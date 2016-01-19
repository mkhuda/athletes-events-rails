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
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .
var monthnum = [];
for (var i = 1; i <= 12; i++) {
    monthnum.push(i);
}

var monthtext=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'];

function date_populate(dayfield, monthfield, yearfield){
    var today=new Date();
    var dayfield=document.getElementById(dayfield);
    var monthfield=document.getElementById(monthfield);
    var yearfield=document.getElementById(yearfield);
    for (var i=0; i<31; i++) {
        dayfield.options[i]=new Option(i+1, i+1);
    }
    dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true) //select today's day
    for (var m=0; m<12; m++){
        monthfield.options[m]=new Option(monthtext[m], monthnum[m]);
    }
        monthfield.options[today.getMonth()]=new Option(monthtext[today.getMonth()], monthnum[today.getMonth()], true, true) //select today's month
    var thisyear=today.getFullYear();
    for (var y=0; y<100; y++){
        yearfield.options[y]=new Option(thisyear, thisyear)
        thisyear-=1
    }
    yearfield.options[0]=new Option(today.getFullYear(), today.getFullYear(), true, true); //select today's year
}

$(document).on("page:load ready", function(){
	date_populate("date", "month", "year");
});
