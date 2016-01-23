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
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
});

var loadTrails = function(){
  $.each([10035772, 10029035, 10207801, 10033941, 10034022], function(index, trail_id){
      $.ajax({
        type: 'GET',
        url: getTrails(trail_id)
      })
      .done(function(response){
        trailData(response['trails'][0])
      })
      .fail(function(error){
        console.log(error)
      })
  })
};

var getTrails = function(trail_id){
  return 'https://demo9253916.mockable.io/api/alltrails/trails/' + trail_id
};

var trailData = function(trail_obj){
  $.ajax({
    type: 'POST',
    url: '/trails',
    data: trail_obj,
    dataType: 'JSON'
  })
  .done(function(response){
    console.log(response)
  })
  .fail(function(error){
    console.log(error)
  })
};

loadTrails();










