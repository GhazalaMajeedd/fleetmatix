from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound, HTTPNotFound
from geoalchemy2.functions import *

from ..models import (
    db,
    Station
    )

from ..forms import ContactForm


@view_config(route_name='home', renderer='home.mako')
def my_view(request):
    one = None
    return {'one': one, 'project': 'fleetmatix'}


@view_config(route_name='contact', renderer="contact.mako")
def contact_form(request):

    f = ContactForm(request.POST)   # empty form initializes if not a POST request

    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            #TODO: Do email sending here.

            request.session.flash("Your message has been sent!")
            return HTTPFound(location=request.route_url('home'))

    return {'contact_form': f}


@view_config(route_name='test_map', renderer='test_map.mako')
def test_map(request):
    one = None
    return {'one': one, 'project': 'fleetmatix'}

@view_config(route_name='station_add', renderer='add_station.mako')
def add_station(request):
    #assert False
    if 'POST' == request.method :
        s = Station()
        s.name = request.POST['station_name']
        p= 'POINT(%s %s)'%(request.POST['lat'],request.POST['lng'])
        s.location = p 
        db.add(s)
        db.flush()
        
        request.session.flash("Station Saved!")
        return HTTPFound(location=request.route_url('admin.StationCRUD_list'))


    return {}
@view_config(route_name='route_add', renderer='add_route.mako')
def add_route(request):
    #assert False
    if 'POST' == request.method :
        s = Station()
        s.name = request.POST['Station Name']
        p= 'POINT(%s %s)'%(request.POST['Latitude'],request.POST['Longitude'])
        s.location = p 
        db.add(s)
        db.flush()
        
        request.session.flash("Station Saved!")
        return HTTPFound(location=request.route_url('admin.StationCRUD_list'))
@view_config(route_name='station_view', renderer='view_station.mako')
def view_station(request):
    station_name = request.matchdict['station_name']
    station = db.query(Station).filter_by(name=station_name).first()
    if not station:
        return  HTTPNotFound('Station not found')

    point_str = db.scalar(station.location.ST_AsText())

    # now point_str contains something like: 'POINT(33.658638 73.029095)'
    # Fetching lat/lng from this string and adding two properties to
    # station object named lat and lng

    lat, lng = point_str[6:-1].split()
    station.lat = float(lat)
    station.lng = float(lng)

    return {'station': station}
