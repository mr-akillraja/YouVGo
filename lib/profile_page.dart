import 'package:flutter/material.dart';
import 'activity_detail_page.dart'; // Import the new ActivityDetailPage

class ProfilePage_youvgo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove shadow below the AppBar
      ),
      extendBodyBehindAppBar: true, // Extend body to cover behind the AppBar
      backgroundColor: Colors.black, // Set the scaffold background to black
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black, // Set the container background to black
          child: Column(
            children: [
              Stack(
                children: [
                  // Background Image
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/1367105/pexels-photo-1367105.jpeg?auto=compress&cs=tinysrgb&w=600'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.8), BlendMode.darken),
                      ),
                    ),
                  ),
                  // Profile Details
                  Positioned(
                    top: 30,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'mr_aki_41',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'San Francisco, CA',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/1239288/pexels-photo-1239288.jpeg?auto=compress&cs=tinysrgb&w=600'),
                            ),
                            SizedBox(width: 4),
                            CircleAvatar(
                              radius: 14,
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=600'),
                            ),
                            SizedBox(width: 4),
                            CircleAvatar(
                              radius: 14,
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/2691608/pexels-photo-2691608.jpeg?auto=compress&cs=tinysrgb&w=600'),
                            ),
                            SizedBox(width: 4),
                            CircleAvatar(
                              radius: 14,
                              child: Text(
                                '+2',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Stats with Semi-Transparent Background
                  Positioned(
                    top: 200,
                    left: 20,
                    right: 20,
                    child: Card(
                      color: Colors.grey[900]?.withOpacity(0.6),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '1,250',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Known',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '239',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Unknown',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '125',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Trips done',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              // Activities
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Activities',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    ActivityCard(
                      title: 'Valley of the king & beyond',
                      location: 'Giza',
                      date: '17/08/2019',
                      backgroundImage:
                          'https://images.pexels.com/photos/1367105/pexels-photo-1367105.jpeg?auto=compress&cs=tinysrgb&w=600',
                      onTap: (title, location, date) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityDetailPage(
                              title: title,
                              location: location,
                              date: date,
                              backgroundImage:
                                  'https://images.pexels.com/photos/1367105/pexels-photo-1367105.jpeg?auto=compress&cs=tinysrgb&w=600',
                            ),
                          ),
                        );
                      },
                    ),
                    ActivityCard(
                      title: 'Beaches of Caribbean',
                      location: 'Bahamas',
                      date: '17/08/2019',
                      backgroundImage:
                          'https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?auto=compress&cs=tinysrgb&w=600',
                      onTap: (title, location, date) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityDetailPage(
                              title: title,
                              location: location,
                              date: date,
                              backgroundImage:
                                  'https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?auto=compress&cs=tinysrgb&w=600',
                            ),
                          ),
                        );
                      },
                    ),
                    ActivityCard(
                      title: 'Killing the mountain',
                      location: 'Himalayas',
                      date: '17/08/2019',
                      backgroundImage:
                          'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&w=600',
                      onTap: (title, location, date) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityDetailPage(
                              title: title,
                              location: location,
                              date: date,
                              backgroundImage:
                                  'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&w=600',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String backgroundImage;
  final Function(String, String, String) onTap;

  ActivityCard({
    required this.title,
    required this.location,
    required this.date,
    required this.backgroundImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(0.5), // Semi-transparent grey background
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey, size: 14),
            SizedBox(width: 4),
            Text(location, style: TextStyle(color: Colors.grey)),
            SizedBox(width: 10),
            Icon(Icons.calendar_today, color: Colors.grey, size: 14),
            SizedBox(width: 4),
            Text(date, style: TextStyle(color: Colors.grey)),
          ],
        ),
        onTap: () => onTap(title, location, date),
      ),
    );
  }
}
