import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with custom configuration
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAgPsxjCnmQSKZkWY5KDUfGUuNRg_s8WLw',
      appId: '1:959368994432:android:83c53ba208c49d3def1065',
      messagingSenderId: '959368994432',
      projectId: 'tripsync-a16d3',
      storageBucket: 'tripsync-a16d3.firebasestorage.app',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Initialization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseStatusPage(), // Navigate to your home page or another page
    );
  }
}

class FirebaseStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Connected')),
      body: Center(child: Text('Firebase initialized successfully!')),
    );
  }
}
