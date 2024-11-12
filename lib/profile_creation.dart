import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Username";
  String tagline = "Catchy tagline goes here!";
  ImageProvider? backgroundPhoto;
  ImageProvider? profilePhoto;

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image for background photo
  Future<void> pickBackgroundPhoto() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        backgroundPhoto = FileImage(File(pickedFile.path));
      });
    }
  }

  // Function to pick an image for profile photo
  Future<void> pickProfilePhoto() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePhoto = FileImage(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background Image
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: backgroundPhoto != null
                        ? DecorationImage(
                            image: backgroundPhoto!, fit: BoxFit.cover)
                        : DecorationImage(
                            image: AssetImage('assets/placeholder_bg.jpg'),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: pickBackgroundPhoto,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Profile Photo
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: profilePhoto ??
                      AssetImage('assets/placeholder_profile.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.black),
                    onPressed: pickProfilePhoto,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                initialValue: username,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),

            // Tagline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                initialValue: tagline,
                decoration: InputDecoration(
                  labelText: "Catchy tagline",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    tagline = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Save profile details
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profile saved!")),
                );
              },
              child: Text("Save Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
