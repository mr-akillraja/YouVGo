import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'home_page.dart';

class Profile_creation extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile_creation> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _friendTagController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();

  bool _agreeToTerms = false;
  final CollectionReference _profileCollection =
      FirebaseFirestore.instance.collection('profile_data');
  File? _profileImage;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = _storage.ref().child('profile_pictures/$fileName');
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  void _submitProfile() async {
    if (_agreeToTerms &&
        _passwordController.text == _retypePasswordController.text) {
      String? imageUrl;
      if (_profileImage != null) {
        imageUrl = await _uploadImage(_profileImage!);
      }

      try {
        await _profileCollection.add({
          'username': _usernameController.text,
          'name': _nameController.text,
          'location': _locationController.text,
          'destination': _destinationController.text,
          'bio': _bioController.text,
          'experience': _experienceController.text,
          'friendTag': _friendTagController.text,
          'email': _emailController.text,
          'agreeToTerms': _agreeToTerms,
          'profilePicture': imageUrl,
        });

        _clearTextFields();
        _showSuccessDialog();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving profile: $e')),
        );
      }
    } else if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please agree to the terms and conditions')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  void _clearTextFields() {
    _usernameController.clear();
    _nameController.clear();
    _locationController.clear();
    _destinationController.clear();
    _bioController.clear();
    _experienceController.clear();
    _friendTagController.clear();
    _emailController.clear();
    _passwordController.clear();
    _retypePasswordController.clear();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/Logo_2.png', width: 100, height: 100),
              SizedBox(height: 20),
              Text('YouVGo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Let\'s Explore',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => YouVGoHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Image.asset('assets/Logo_2.png', width: 50),
                SizedBox(width: 10),
                Text(
                  'YouVGO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: _profileImage == null
                    ? Icon(Icons.upload, size: 50, color: Colors.white)
                    : ClipOval(
                        child: Image.file(_profileImage!,
                            width: 80, height: 80, fit: BoxFit.cover),
                      ),
              ),
            ),
            SizedBox(height: 10),
            Text('Upload Your Picture',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 20),
            _buildTextField('Email Address:', _emailController, Icons.email),
            _buildTextField('Password:', _passwordController, Icons.lock,
                obscureText: true),
            _buildTextField(
                'Retype Password:', _retypePasswordController, Icons.lock,
                obscureText: true),
            _buildTextField('Username:', _usernameController, Icons.person),
            _buildTextField('Name:', _nameController, Icons.account_circle),
            _buildTextField(
                'Your Location:', _locationController, Icons.location_on),
            _buildTextField('Desired Destination:', _destinationController,
                Icons.location_searching),
            _buildTextArea('Add your Bio:', _bioController, Icons.text_fields),
            _buildTextArea('Travel Experience (Any):', _experienceController,
                Icons.camera_alt),
            _buildTextField('Tag your Traveler Friend:', _friendTagController,
                Icons.person_add),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Expanded(
                  child: Text(
                    'I agree to accept all the terms and the conditions',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Learn more',
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('Privacy Policy',
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Terms and Conditions',
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Here youVGo',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 20),
            Text('All rights reserved',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          hintText: 'Enter $label',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildTextArea(
      String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: 3,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          hintText: 'Enter $label',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
