import 'package:flutter/material.dart';
import 'post_data.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'My Timeline',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: globalPosts.isEmpty
          ? Center(
              child: Text(
                'No posts yet!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: globalPosts.length,
              itemBuilder: (context, index) {
                final post = globalPosts[index];
                return PostCard(
                  username: post.username,
                  location: post.location,
                  date: post.date,
                  imagePath: post.imagePath,
                );
              },
            ),
    );
  }
}

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
