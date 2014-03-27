<%inherit file="base.mako"/>
<%def name="title()">
PyCK Project - Contact Us
</%def>
<!DOCTYPE html>
<html>
<head>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXMKZ6a4ICAcuCqs8PVa3z3Ar9AF0nthY&sensor=false">
</script>
<script>
var line;
function initialize() {
var mapDiv = document.getElementById('map-canvas');
var map = new google.maps.Map(mapDiv, {
    center: new google.maps.LatLng(33.6667,73.1667),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
line = new google.maps.Polyline({
    strokeColor: '#ff0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });
line.setMap(map);

  google.maps.event.addListener(map, 'click', addNewPoint);
}

function addNewPoint(e) {
  //var path = line.getPath();
  //alert(e.latLng.k);
  //console.log(e.latLng);
  var marker = new google.maps.Marker({
      position: e.latLng,
      map: map,
      title: 'Hello World!'
  });

}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
  </head>

<body>
<div id="map-canvas" style="width:700px;height:400px;float: right"></div>

</body>
</html>

<div>
<h1>Contact Us</h1>

<form action="${request.route_url('station_add')}" method="POST">
    
Station Name: <input type="text" name="Station Name"><br>
<input type="hidden" name="Latitude"><br>
<input type="hidden" name="Longitude">
<input type="submit" value="Add Station" />
</form>
<br /><br /><br /><br /><br /><br />
</div> 
