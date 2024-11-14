import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: ChennaiCheckpoint(),
    debugShowCheckedModeBanner: false,
  ));
}

class ChennaiCheckpoint extends StatefulWidget {
  @override
  _ChennaiCheckpointState createState() => _ChennaiCheckpointState();
}

class _ChennaiCheckpointState extends State<ChennaiCheckpoint> {
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

  // Marker details including ratings and descriptions
  final List<Map<String, dynamic>> _places = [
    {
      'id': 'marinaBeach',
      'name': 'Marina Beach',
      'position': LatLng(13.0498, 80.2824),
      'rating': 4.5,
      'description':
          'A popular beach in Chennai known for its long shoreline and lively atmosphere.',
      'image': 'assets/marina_beach.jpeg', // Add image asset for Marina Beach
    },
    {
      'id': 'kapaleeshwararTemple',
      'name': 'Kapaleeshwarar Temple',
      'position': LatLng(13.0330, 80.2688),
      'rating': 4.7,
      'description': 'A historic Hindu temple dedicated to Lord Shiva.',
      'image':
          'assets/kapaleeshwarar_temple.jpeg', // Add image asset for Kapaleeshwarar Temple
    },
    {
      'id': 'sanThomeBasilica',
      'name': 'San Thome Basilica',
      'position': LatLng(13.0312, 80.2791),
      'rating': 4.6,
      'description':
          'A Roman Catholic minor basilica with a history dating back to the 16th century.',
      'image':
          'assets/san_thome_basilica.jpeg', // Add image asset for San Thome Basilica
    },
    {
      'id': 'fortStGeorge',
      'name': 'Fort St. George',
      'position': LatLng(13.0820, 80.2871),
      'rating': 4.3,
      'description':
          'A historic fort built by the British East India Company in 1644.',
      'image':
          'assets/fort_st_george.jpeg', // Add image asset for Fort St. George
    },
  ];

  // Get the LatLng for all the places
  List<LatLng> getMarkerPositions() {
    return _places.map((place) => place['position'] as LatLng).toList();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  // Show detailed information about a place in a dialog
  void _showPlaceDetails(Map<String, dynamic> place) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(place['name']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(place['image'], height: 150, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text('Rating: ⭐ ${place['rating']}'),
              SizedBox(height: 10),
              Text(place['description']),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
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
            ),
            // Custom rectangular box for each place
            ..._places.map((place) {
              return Positioned(
                left: 100.0, // Adjust the x-position for each place
                top: 100.0, // Adjust the y-position for each place
                child: GestureDetector(
                  onTap: () {
                    _showPlaceDetails(place);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 200,
                    height: 120,
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
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text('⭐ ${place['rating']}'),
                        SizedBox(height: 5),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              place['description'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
