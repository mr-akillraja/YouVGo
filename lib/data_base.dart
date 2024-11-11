// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Firebase with custom configuration
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: 'AIzaSyAgPsxjCnmQSKZkWY5KDUfGUuNRg_s8WLw',
//       appId: '1:959368994432:android:83c53ba208c49d3def1065',
//       messagingSenderId: '959368994432',
//       projectId: 'tripsync-a16d3',
//       storageBucket: 'tripsync-a16d3.firebasestorage.app',
//     ),
//   );

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Initialization',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FirebaseStatusPage(), // Navigate to your home page or another page
//     );
//   }
// }

// class FirebaseStatusPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Firebase Connected')),
//       body: Center(child: Text('Firebase initialized successfully!')),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ProfilePage_youvgo extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage_youvgo> {
//   File? _backgroundImage;

//   Future<void> _pickBackgroundImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _backgroundImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image with shaded overlay
//           _backgroundImage != null
//               ? Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: FileImage(_backgroundImage!),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.black.withOpacity(0.5),
//                           Colors.transparent,
//                         ],
//                         begin: Alignment.topCenter,
//                         end: Alignment.center,
//                       ),
//                     ),
//                   ),
//                 )
//               : Container(
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                   child: Center(
//                     child: Text(
//                       "No Background Image",
//                       style: TextStyle(color: Colors.black54),
//                     ),
//                   ),
//                 ),

//           // Profile content
//           Column(
//             children: [
//               SizedBox(height: 80),

//               // Button to pick background image
//               IconButton(
//                 icon: Icon(Icons.photo, color: Colors.white, size: 30),
//                 onPressed: _pickBackgroundImage,
//               ),
//               SizedBox(height: 20),

//               // Profile picture in a circle
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: NetworkImage(
//                       'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600'), // Add your profile picture URL here
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Name and bio
//               Text(
//                 'Your Name',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Bio goes here...',
//                 style: TextStyle(
//                   color: Colors.white70,
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(height: 30),

//               // Known and Unknown columns
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       // Known Column
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Known',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           // Add your list or grid for known items
//                           Container(
//                             height: 100,
//                             width: 100,
//                             color: Colors.blueAccent,
//                             child: Center(child: Text('Item 1')),
//                           ),
//                         ],
//                       ),
//                       // Unknown Column
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Unknown',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           // Add your list or grid for unknown items
//                           Container(
//                             height: 100,
//                             width: 100,
//                             color: Colors.redAccent,
//                             child: Center(child: Text('Item 2')),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
