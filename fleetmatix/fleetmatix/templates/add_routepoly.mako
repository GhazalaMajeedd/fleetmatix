<%inherit file="base.mako"/>
<%def name="title()">
PyCK Project - Contact Us
</%def>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXMKZ6a4ICAcuCqs8PVa3z3Ar9AF0nthY&sensor=false">
</script>
<script>
var poly, map;
function initialize() {
    var myLatlng = new google.maps.LatLng(33.6667,73.1667);
    var mapOptions = {
        zoom: 12,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById('map_canvas'), 
        mapOptions);

    google.maps.event.addListener(map, 'click', function(event){
        addMarker(event.latLng);
    });
    }

    function addMarker(latLng){       
        //clear the previous marker.
    if(marker != null){
        marker.setMap(null);
    }

    marker = new google.maps.Marker({
        position: latLng,
        map: map,
        draggable:true
    });
        

        //when marker has completed the drag event 
    google.maps.event.addListener(map, 'click', addLatLng);     
    }
    function addLatLng(event) {

  var path = poly.getPath();

  // Because path is an MVCArray, we can simply append a new coordinate
  // and it will automatically appear.
  path.push(event.latLng);

  // Add a new marker at the new plotted point on the polyline.
  var marker = new google.maps.Marker({
    position: event.latLng,
    title: '#' + path.getLength(),
    map: map
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
<h1>Add a Route</h1>

<form action="${request.route_url('route_addpoly')}" method="POST">
    
Route Name: <input type="text" name="Route Name"><br>
<input type="hidden" name="Latitude"><br>
<input type="hidden" name="Longitude">
<input type="submit" value="Add Route" />
</form>
<br /><br /><br /><br /><br /><br />
</div> 
