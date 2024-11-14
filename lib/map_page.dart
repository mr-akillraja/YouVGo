import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Map_Page extends StatefulWidget {
  @override
  _ChennaiCheckpointState createState() => _ChennaiCheckpointState();
}

class _ChennaiCheckpointState extends State<Map_Page> {
  GoogleMapController? mapController;
  LocationData? _currentLocation;
  Location _locationService = Location();
  Set<Marker> _markers = Set();
  double currentZoomLevel = 12.0; // Default zoom level

  // Initial Location set to Chennai
  final LatLng _center = const LatLng(13.0827, 80.2707);

  // Map Style (Grayscale)
  final String _mapStyle = '''
  [
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#383838"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    }
  ]
  ''';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController?.setMapStyle(_mapStyle);
  }

  // Update the zoom level dynamically
  void _onCameraMove(CameraPosition position) {
    setState(() {
      currentZoomLevel = position.zoom;
    });
  }

  // Fetch current location and set the marker
  void _getCurrentLocation() async {
    try {
      _currentLocation = await _locationService.getLocation();
      _locationService.onLocationChanged.listen((LocationData currentLocation) {
        setState(() {
          _currentLocation = currentLocation;
          _markers.add(
            Marker(
              markerId: MarkerId('current_location'),
              position: LatLng(
                  _currentLocation!.latitude!, _currentLocation!.longitude!),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure),
            ),
          );
        });
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Get the current location when the map is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove, // Listen for zoom changes
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: currentZoomLevel,
          ),
          markers: _markers, // Display the current location marker
        ),
      ),
    );
  }
}
