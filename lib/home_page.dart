import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'map_page.dart';
import 'friends_page.dart';
import 'timeline.dart';

class YouVGoHomePage extends StatefulWidget {
  @override
  _YouVGoHomePageState createState() => _YouVGoHomePageState();
}

class _YouVGoHomePageState extends State<YouVGoHomePage> {
  int _selectedIndex = 0;
  int _messageCount = 5;

  // List of pages for bottom navigation
  List<Widget> _pages = [
    HomePage(),
    Map_Page(),
    // AddPage(),
    FriendsPage(),
    ProfilePage_youvgo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Container(
            height: 150, // Adjust height based on notification count
            width: 300,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    'AkilRaja commented on your post!',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '2 hours ago',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.red),
                  title: Text(
                    'Jakkariya liked your post!',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '5 hours ago',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.share, color: Colors.blue),
                  title: Text(
                    'Your post has been shared!',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '1 day ago',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo_2.png',
              height: 50,
            ),
            SizedBox(width: 8),
            Text(
              'YouVGo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              _showNotifications(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.timeline, color: Colors.white),
            onPressed: () {
              // Navigate to TimelinePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimelinePage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: _selectedIndex == 0 ? 35 : 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: _selectedIndex == 1 ? 35 : 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              size: _selectedIndex == 2 ? 40 : 30,
              color: _selectedIndex == 2 ? Colors.yellow : Colors.white70,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: _selectedIndex == 3 ? 35 : 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.account_circle, size: _selectedIndex == 4 ? 35 : 25),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Example HomePage
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        PostCard(
          username: 'AkilRaja',
          location: 'Goa, Beach',
          date: 'On Open Date',
          imagePath: 'assets/goa_beach.jpg',
        ),
        SizedBox(height: 15),
        PostCard(
          username: 'Jakkariya',
          location: 'Tajmahal',
          date: 'Nov 20, 2024',
          imagePath: 'assets/taj_mahal.jpg',
        ),
      ],
    );
  }
}

// Custom widget for post card
class PostCard extends StatelessWidget {
  final String username;
  final String location;
  final String date;
  final String imagePath;

  PostCard({
    required this.username,
    required this.location,
    required this.date,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@' + username.toLowerCase(),
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.location_pin, color: Colors.red),
                Text(location, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.white),
                SizedBox(width: 16),
                Icon(Icons.chat_bubble_outline, color: Colors.white),
                SizedBox(width: 16),
                Icon(Icons.share, color: Colors.white),
                Spacer(),
                Text(
                  date,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
