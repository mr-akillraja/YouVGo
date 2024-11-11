import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'effects/neon_card/neon_card.dart';
import 'effects/neon_card/neon_text.dart';
import 'effects/border_beam/border_beam.dart';
import 'login_page.dart'; // Import your login page

class CreateAccountPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  // Initialize Firebase within CreateAccountPage itself
  Future<void> _initializeFirebase() async {
    try {
      // Ensure Firebase is initialized before performing any Firebase-related operations
      await Firebase.initializeApp(
          options: FirebaseOptions(
        apiKey: 'AIzaSyAaxwK7FttCBSWTIM9E_SdDgGJiIxFvdPI',
        appId: '1:996922060890:android:33969cf117c699a646e863',
        messagingSenderId: '996922060890',
        projectId: 'youvgo-db4b9',
        storageBucket: 'youvgo-db4b9.firebasestorage.app',
      ));
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }

  // Sign up function to save details in Firestore
  Future<void> _signUp(BuildContext context) async {
    // Initialize Firebase
    await _initializeFirebase();

    try {
      if (_passwordController.text == _rePasswordController.text) {
        await FirebaseFirestore.instance.collection("signup_details").add({
          'username': _usernameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        });

        // Show success message using BorderBeam
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: BorderBeam(
                duration: Duration(seconds: 2),
                colorFrom: Colors.blue,
                colorTo: Colors.purple,
                staticBorderColor: const Color.fromARGB(255, 39, 39, 42),
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(16),
                child: Container(
                  width: 300,
                  height: 100,
                  child: const Center(
                    child: Text(
                      'Account Created Successfully!',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        );

        // Navigate to the login page after a delay
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        });
      } else {
        // If passwords do not match
        print("Passwords do not match");
      }
    } catch (e) {
      print("Error saving user: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: NeonCard(
                intensity: 0.7,
                glowSpread: 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      GradientText(
                        text: 'Create Account',
                        fontSize: 32,
                        gradientColors: [
                          Color.fromARGB(255, 255, 41, 117),
                          Color.fromARGB(255, 9, 221, 222),
                          Colors.blueAccent,
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          filled: true,
                          fillColor: Colors.black45,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.black45,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.black45,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _rePasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Re-enter Password',
                          filled: true,
                          fillColor: Colors.black45,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _signUp(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 50),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
