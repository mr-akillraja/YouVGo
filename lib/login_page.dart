import 'package:flutter/material.dart';
import 'effects/neon_card/neon_card.dart';
import 'effects/neon_card/neon_text.dart';
import 'sign_up_page.dart'; // Ensure this is imported correctly

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: NeonCard(
                intensity: 0.7, // Increased intensity for more glow
                glowSpread: 0.6, // Decreased glow spread for sharper effect
                child: Padding(
                  padding: const EdgeInsets.all(
                      24.0), // Reduced padding to make it smaller
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 400, // Max width for better control
                      maxHeight: 450, // Max height to avoid it being too tall
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Neon Gradient Title using GradientText - "TripSync"
                        GradientText(
                          text: 'TripSync',
                          fontSize: 32, // Adjusted font size
                          gradientColors: [
                            Color.fromARGB(255, 255, 41, 117), // Pink
                            Color.fromARGB(255, 9, 221, 222), // Cyan
                            Colors.blueAccent,
                          ],
                        ),
                        SizedBox(height: 20), // Reduced height between elements

                        // Username Field with Gradient Text and Neon Card
                        TextField(
                          controller: _usernameController,
                          style: TextStyle(
                              color: Colors.white), // White text color
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  6), // Smaller border radius
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16), // Reduced height between elements

                        // Password Field with Gradient Text and Neon Card
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white), // White text color
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  6), // Smaller border radius
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16), // Reduced height between elements

                        // Login Button with updated 'backgroundColor' instead of 'primary'
                        ElevatedButton(
                          onPressed: () {
                            // Handle login logic and navigate to home screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(), // Navigate to HomePage
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blueAccent, // Corrected parameter name
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  6), // Smaller border radius
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 50),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 16), // Reduced height between elements

                        // Forgot Password Link
                        GestureDetector(
                          onTap: () {
                            // Handle forgot password logic (e.g., navigate to reset page)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ForgotPasswordPage(), // Navigate to Forgot Password Page
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
                        SizedBox(height: 10), // Reduced height between elements

                        // Create Account Link
                        GestureDetector(
                          onTap: () {
                            // Navigate to Create Account Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateAccountPage(), // Correct navigation
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
}

// Placeholder for HomePage after login
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
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

// CreateAccountPage (Sign Up Page)
