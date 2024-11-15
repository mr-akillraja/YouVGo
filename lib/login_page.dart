import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:youvgo/home_page.dart'; // Ensure this import is present
import 'effects/neon_card/neon_card.dart';
import 'effects/neon_card/neon_text.dart';
import 'profile_creation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isFirebaseInitialized = false;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _checkAutoLogin(); // Check for stored credentials
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      _isFirebaseInitialized = true;
    });
  }

  // Check if credentials are stored and auto-login
  Future<void> _checkAutoLogin() async {
    String? username = await _secureStorage.read(key: 'username');
    String? password = await _secureStorage.read(key: 'password');

    if (username != null && password != null) {
      bool isLoggedIn = await _loginWithFirestore(username, password);
      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => YouVGoHomePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isFirebaseInitialized) {
      return Center(child: CircularProgressIndicator());
    }

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
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      maxHeight: 450,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GradientText(
                          text: 'YouVGo',
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
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            bool loginSuccessful = await _loginWithFirestore(
                              _usernameController.text,
                              _passwordController.text,
                            );

                            if (loginSuccessful) {
                              // Store credentials securely
                              await _secureStorage.write(
                                  key: 'username',
                                  value: _usernameController.text);
                              await _secureStorage.write(
                                  key: 'password',
                                  value: _passwordController.text);

                              // Navigate to HomePage after successful login
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => YouVGoHomePage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Invalid credentials"),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 50),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile_creation(),
                              ),
                            );
                          },
                          child: Text(
                            'Create an Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
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
      ),
    );
  }

  Future<bool> _loginWithFirestore(String username, String password) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('signup_details')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error logging in with Firestore: $e');
      return false;
    }
  }
}

// Placeholder for ForgotPasswordPage
class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Forgot Password Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
