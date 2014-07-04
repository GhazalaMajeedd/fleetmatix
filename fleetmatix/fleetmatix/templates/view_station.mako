<%inherit file="base.mako"/>
<%def name="title()">
PyCK Project - Station View
</%def>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXMKZ6a4ICAcuCqs8PVa3z3Ar9AF0nthY&sensor=false">
</script>
<script>
function initialize() {
   var markers = [];
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(33.6667, 73.1667),
      new google.maps.LatLng(33.7167, 73.0667));
  map.fitBounds(defaultBounds);
          // Create the search box and link it to the UI element.
  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  // [START region_getplaces]
  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // For each place, get the icon, place name, and location.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };
              // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });
  // [END region_getplaces]

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);*

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
    google.maps.event.addListener(marker, 'dragend', function(){
            
 });     
    }
</script>
  </head>

<body>
<div id="map-canvas" style="width:700px;height:400px;float: right"></div>

</body>
</html>

<div>
<h1>View Station</h1>
<form action="${request.route_url('station_view')}" method="POST">
    
Station Name: <input type="text" name="Station Name"><br>
<input type="hidden" name="Latitude"><br>
<input type="hidden" name="Longitude">
<input id="pac-input" class="controls" type="text" placeholder="Search Box">
</form>
<br /><br /><br /><br /><br /><br />
</div> 