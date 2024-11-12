import 'package:flutter/material.dart';

class YouVGoHomePage extends StatefulWidget {
  @override
  _YouVGoHomePageState createState() => _YouVGoHomePageState();
}

class _YouVGoHomePageState extends State<YouVGoHomePage> {
  int _selectedIndex = 0;

  // List of pages for the navigation bar
  final List<Widget> _pages = [
    RecentsPage(),
    FriendsPage(),
    HighlightsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Image.asset(
          'assets/Logo_2.png', // Replace with your logo
          height: 50,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.people, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search destination or people',
                  filled: true,
                  fillColor: Colors.grey[800],
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  hintStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Tab bar (We can keep it or remove if not needed)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TabButton(text: 'Recents', isSelected: _selectedIndex == 0),
                  TabButton(text: 'Friends', isSelected: _selectedIndex == 1),
                  TabButton(
                      text: 'Highlights', isSelected: _selectedIndex == 2),
                ],
              ),
            ),

            // Display the selected page
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
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
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Custom widget for tab buttons
class TabButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  TabButton({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[850] : Colors.grey[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}

// Sample page for Recents
class RecentsPage extends StatelessWidget {
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

// Sample page for Friends
class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Friends Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

// Sample page for Highlights
class HighlightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Highlights Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
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
                  backgroundImage:
                      AssetImage(imagePath), // profile image from assets
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
                    'Travel',
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
