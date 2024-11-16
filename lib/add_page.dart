import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add Post', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          'Add Post Page',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
