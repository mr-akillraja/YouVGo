import 'package:flutter/material.dart';

class YouVGoHomePage extends StatefulWidget {
  @override
  _YouVGoHomePageState createState() => _YouVGoHomePageState();
}

class _YouVGoHomePageState extends State<YouVGoHomePage> {
  int _selectedIndex = 0;
  int _messageCount = 5; // Example count for messages
  int _friendRequestCount = 3; // Example count for friend requests

  // List of pages corresponding to each tab
  List<Widget> _pages = [
    HomePage(),
    LocationPage(),
    AddPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  // Notification messages
  bool hasNotifications = true;
  bool hasFriendRequest = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to create a custom notification bubble with count
  Widget _notificationBadge(String message, bool hasNotification, int count) {
    return Positioned(
      top: 0,
      right: 0,
      child: hasNotification
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 216, 42),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$count', // Display the count
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  // Navigate to the Message Page
  void _navigateToMessagePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MessagePage()),
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
          children: [
            Image.asset(
              'assets/Logo_2.png', // Replace with your logo
              height: 50,
            ),
            SizedBox(width: 2),
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
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
              _notificationBadge(
                  'New Likes', hasNotifications, 10), // Example count for likes
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.people, color: Colors.white),
                onPressed: () {},
              ),
              _notificationBadge(
                  'New Friend Requests', hasFriendRequest, _friendRequestCount),
            ],
          ),
          IconButton(
            icon: Icon(Icons.chat, color: Colors.white),
            onPressed: () {
              _navigateToMessagePage(context); // Navigate to message page
            },
          ),
          _notificationBadge('New Messages', hasNotifications,
              _messageCount), // Add notification badge for messages
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Set the background color to black
        selectedItemColor: Colors.white, // Selected item color (white)
        unselectedItemColor:
            Colors.white70, // Unselected item color (light grey)
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // To prevent shifting icons
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
            icon: Icon(Icons.favorite, size: _selectedIndex == 3 ? 35 : 25),
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

// Sample pages for the BottomNavigationBar
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

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Location Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorite Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Messages', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          'Message Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
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
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
