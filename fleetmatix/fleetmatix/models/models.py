from sqlalchemy import (
    Column,
    Integer,
    Unicode,
    )

from . import db, Base
from geoalchemy2 import Geometry, Geography


# Create your models here.
class Station(Base):
    __tablename__ = 'stations'

    id = Column(Integer, primary_key=True)
    name = Column(Unicode)
    location = Column(Geography(geometry_type='POINT', srid=4326))
