import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.grey,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background Image
                Container(
                  height: 300,
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
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'mr_aki_41',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'San Francisco, CA',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/1239288/pexels-photo-1239288.jpeg?auto=compress&cs=tinysrgb&w=600'),
                          ),
                          SizedBox(width: 4),
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=600'),
                          ),
                          SizedBox(width: 4),
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/2691608/pexels-photo-2691608.jpeg?auto=compress&cs=tinysrgb&w=600'),
                          ),
                          SizedBox(width: 4),
                          CircleAvatar(
                            radius: 16,
                            child: Text(
                              '+2',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Stats with Semi-Transparent Background
                Positioned(
                  top: 250,
                  left: 20,
                  right: 20,
                  child: Card(
                    color: Colors.grey[900]
                        ?.withOpacity(0.6), // Semi-transparent background
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text('Activities',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '239',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text('Experiences',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '125',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text('Followers',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  // Updated Activity display
                  ActivityCard(
                    title: 'Valley of the king & beyond',
                    location: 'Giza',
                    date: '17/08/2019',
                  ),
                  ActivityCard(
                    title: 'Beaches of Caribbean',
                    location: 'Bahamas',
                    date: '17/08/2019',
                  ),
                  ActivityCard(
                    title: 'Killing the mountain',
                    location: '',
                    date: '17/08/2019',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;

  ActivityCard({
    required this.title,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850]?.withOpacity(0.6), // Semi-transparent background
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.image,
            size: 40, color: Colors.grey), // Placeholder for activity image
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Text(location, style: TextStyle(color: Colors.grey)),
            SizedBox(width: 10),
            Icon(Icons.calendar_today, size: 16, color: Colors.grey),
            SizedBox(width: 4),
            Text(date, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
