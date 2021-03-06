"""
Project routes
"""


def application_routes(config):
    config.add_static_view('static', 'static', cache_max_age=3600)

    config.add_route('home', '/')
    config.add_route('contact', '/contact')

    config.add_route('pyckauth_login', '/login')
    config.add_route('pyckauth_logout', '/logout')
    config.add_route('pyckauth_manager', '/auth')
    config.add_route('pyckauth_users', '/auth/users')
    config.add_route('pyckauth_permissions', '/auth/permissions')
    config.add_route('pyckauth_routes', '/auth/routes')
    config.add_route('station_add', '/station/add')
    config.add_route('route_add', '/route/add')
    config.add_route('route_addpoly', '/route/addpoly')
    config.add_route('station_view', '/station/view/{station_name}')
    config.add_route('view_stations', '/stations')  

    config.add_route('test_map', '/map')
