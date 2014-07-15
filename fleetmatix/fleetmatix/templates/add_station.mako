<%inherit file="base.mako"/>
<%def name="title()">
PyCK Project - Contact Us
</%def>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXMKZ6a4ICAcuCqs8PVa3z3Ar9AF0nthY&sensor=false">
</script>
<script>
var line;

function initialize() {
var mapDiv = document.getElementById('map-canvas');
window.map = new google.maps.Map(mapDiv, {
    center: new google.maps.LatLng(33.6667,73.1667),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  
}

function addNewPoint(e) {
  //var path = line.getPath();
  //alert(e.latLng.k);
  console.log(e.latLng);
  console.log(e.latLng.lat());
  console.log(e.latLng.lng());
  document.myform.lat.value = e.latLng.lat();
  document.myform.lng.value = e.latLng.lng();
  //var map = new google.maps.Map(document.getElementById("map-canvas"));

  var marker = new google.maps.Marker({
      position: e.latLng,
      map: window.map,
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
<h1>Add a Station</h1>

<form action="${request.route_url('station_add')}" method="POST" name="myform">
Station Name: <input type="text" name="station_name"><br>
<input type="hidden" name="lat"><br>
<input type="hidden" name="lng">
<input type="submit" value="Add Station" />
</form>
<br /><br /><br /><br /><br /><br />
</div> 
