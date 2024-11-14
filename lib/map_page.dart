import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map_Page extends StatefulWidget {
  @override
  _ChennaiCheckpointState createState() => _ChennaiCheckpointState();
}

class _ChennaiCheckpointState extends State<Map_Page> {
  late GoogleMapController mapController;

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

  // Marker details including name and ratings
  final List<Map<String, dynamic>> _places = [
    {
      'id': 'marinaBeach',
      'name': 'Marina Beach',
      'position': LatLng(13.0498, 80.2824),
      'rating': 4.5,
    },
    {
      'id': 'kapaleeshwararTemple',
      'name': 'Kapaleeshwarar Temple',
      'position': LatLng(13.0330, 80.2688),
      'rating': 4.7,
    },
    {
      'id': 'sanThomeBasilica',
      'name': 'San Thome Basilica',
      'position': LatLng(13.0312, 80.2791),
      'rating': 4.6,
    },
    {
      'id': 'fortStGeorge',
      'name': 'Fort St. George',
      'position': LatLng(13.0820, 80.2871),
      'rating': 4.3,
    },
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  // Convert LatLng to screen offset
  Future<Offset> _getScreenPosition(LatLng latLng) async {
    ScreenCoordinate screenCoordinate =
        await mapController.getScreenCoordinate(latLng);
    return Offset(screenCoordinate.x.toDouble(), screenCoordinate.y.toDouble());
  }

  // Widget to display place card
  Widget _buildPlaceCard(Map<String, dynamic> place) {
    return FutureBuilder<Offset>(
      future: _getScreenPosition(place['position']),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return SizedBox();
        Offset offset = snapshot.data!;
        return Positioned(
          left: offset.dx - 75, // Centering the card horizontally
          top: offset.dy - 50, // Adjusting to position it above the marker
          child: GestureDetector(
            onTap: () {
              // Add any action on tap if needed
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place['name'],
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('⭐ ${place['rating']}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12.0,
              ),
              onCameraMove: (CameraPosition position) {
                setState(() {}); // Trigger rebuild on camera move
              },
            ),
            // Render place cards dynamically
            ..._places.map((place) => _buildPlaceCard(place)).toList(),
          ],
        ),
      ),
    );
  }
}
