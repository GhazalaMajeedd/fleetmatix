<%inherit file="base.mako"/>
<%def name="title()">
PyCK Project - Station View
</%def>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXMKZ6a4ICAcuCqs8PVa3z3Ar9AF0nthY&sensor=false">
</script>
<script>
function initialize() {
var mapDiv = document.getElementById('map-canvas');
window.map = new google.maps.Map(mapDiv, {
    center: new google.maps.LatLng(${station.lat}, ${station.lng}),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  var myLatlng = new google.maps.LatLng(${station.lat}, ${station.lng});
  var marker = new google.maps.Marker({
      position: myLatlng,
      map: window.map,
      title: '${station.name}'
  });


}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
  
<h1>Viewing Station: ${station.name}</h1>

<div id="map-canvas" style="width:700px;height:400px;float: right"></div>



