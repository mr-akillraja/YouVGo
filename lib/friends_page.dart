import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  final List<Map<String, String>> profiles = [
    {'name': 'Akill Raja', 'username': '@moni'},
    {'name': 'Jakkariya', 'username': '@jack'},
    {'name': 'NaveenKumar', 'username': '@nk'},
    {'name': 'Vignes Pk', 'username': '@pk'},
    {'name': 'RathnaKumar', 'username': '@rathna'},
    {'name': 'Jeya Prakash', 'username': '@jp'},
    {'name': 'Mithun', 'username': '@mith'},
    {'name': 'Sugash', 'username': '@sug'},
    {'name': 'Naveen', 'username': '@nav'},
    {'name': 'John', 'username': '@john'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Unknown',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    leading: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.black, size: 18),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profiles[index]['name']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          profiles[index]['username']!,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle "View Profile" action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            minimumSize: Size(0, 30),
                          ),
                          child: Text(
                            'View Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Remove" action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            minimumSize: Size(0, 30),
                          ),
                          child: Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
