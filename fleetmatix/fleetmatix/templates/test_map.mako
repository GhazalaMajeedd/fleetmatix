<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Waypoints in directions</title>
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
	<script>
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var iiui = new google.maps.LatLng(33.658638, 73.029095);
  var mapOptions = {
    zoom: 14,
    center: iiui
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);
}
google.maps.event.addDomListener(window, 'load', initialize);

</script>
    </head>
<body>
<div id="map-canvas" style="float:left;width:70%;height:100%;"></div>
</div>

</body>

</html>