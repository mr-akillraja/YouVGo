import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'post_data.dart'; // Import the global posts list

class Map_Page extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<Map_Page> {
  GoogleMapController? mapController;
  final Set<Marker> _markers = {};
  String _mapStyle = '';

  final List<Map<String, dynamic>> _landmarks = [
    {
      'name': 'Marina Beach',
      'location': LatLng(13.0515, 80.2828),
      'rating': 4.5,
      'image': 'assets/marina_beach.jpeg',
    },
    {
      'name': 'Fort St. George',
      'location': LatLng(13.0878, 80.2785),
      'rating': 4.2,
      'image': 'assets/fort_st_george.jpeg',
    },
    {
      'name': 'Kapaleeshwarar Temple',
      'location': LatLng(13.0219, 80.2318),
      'rating': 4.8,
      'image': 'assets/kapaleeshwarar_temple.jpeg',
    },
    {
      'name': 'Valluvar Kottam',
      'location': LatLng(13.0230, 80.2153),
      'rating': 4.1,
      'image': 'assets/valluvar_kottam.jpg',
    },
  ];

  final LatLng _center = const LatLng(13.0827, 80.2707);

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _addLandmarkMarkers();
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_styles.json');
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController?.setMapStyle(_mapStyle);
  }

  void _addLandmarkMarkers() {
    for (var landmark in _landmarks) {
      _markers.add(
        Marker(
          markerId: MarkerId(landmark['name'] ?? 'Unknown Landmark'),
          position: landmark['location'] ?? _center,
          infoWindow: InfoWindow(
            title: landmark['name'] ?? 'No Name',
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    }
  }

  void _showRequestDialog(
      BuildContext context, String destination, String imagePath) {
    DateTime selectedDate = DateTime.now();
    String selectedTransport = '';
    String selectedGender = '';
    String postStatus = 'Active';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.red),
                  Text(
                    destination,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Date picker
                  ListTile(
                    leading: Icon(Icons.date_range, color: Colors.white),
                    title: Text(
                      'Select Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                  // Transportation mode
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      selectedTransport = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Transportation (optional)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  // Gender selection
                  DropdownButtonFormField<String>(
                    value: selectedGender.isEmpty ? null : selectedGender,
                    items: ['Male', 'Female', 'Other']
                        .map((label) => DropdownMenuItem(
                              child: Text(label,
                                  style: TextStyle(color: Colors.white)),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                    dropdownColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Select Gender',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      postStatus = 'Expired';
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: postStatus == 'Active'
                      ? () {
                          // Add post to global timeline
                          globalPosts.add(
                            Post(
                              username: 'AkilRaja',
                              location: destination,
                              date:
                                  DateFormat('yyyy-MM-dd').format(selectedDate),
                              imagePath: imagePath,
                            ),
                          );

                          Navigator.pop(context);
                          _showPostConfirmationDialog(
                              context, destination, selectedDate);
                        }
                      : null,
                  child: Text('Youvgo', style: TextStyle(color: Colors.black)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showPostConfirmationDialog(
      BuildContext context, String destination, DateTime date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Post Added to Timeline!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.red),
                  Text(destination, style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.date_range, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    DateFormat('yyyy-MM-dd').format(date),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLandmarkCards() {
    return ListView.builder(
      itemCount: _landmarks.length,
      itemBuilder: (context, index) {
        final landmark = _landmarks[index];
        return Card(
          color: Colors.grey[850],
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () {
                mapController?.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    landmark['location'] ?? _center,
                    15,
                  ),
                );
              },
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
            title: Text(
              landmark['name'] ?? 'Unknown Landmark',
              style: TextStyle(color: Colors.white),
            ),
            trailing: TextButton(
              onPressed: () => _showRequestDialog(
                context,
                landmark['name'] ?? 'Unknown Landmark',
                landmark['image'] ?? '',
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color(0xFF7FFF00),
              ),
              child: Text('Youvgo'),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12,
              ),
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
          Expanded(
            flex: 2,
            child: _buildLandmarkCards(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}
