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
    center: new google.maps.LatLng(33.6667,73.1667),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
line = new google.maps.Polyline({
    strokeColor: '#ff0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });
line.setMap(window.map);

}
</script>
  
<h1>Viewing Station: ${station.name}</h1>

<div id="map-canvas" style="width:700px;height:400px;float: right"></div>



