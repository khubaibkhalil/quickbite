import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'CustomBottomNavigationBar.dart';
import 'account_settings_screen.dart';
import 'notification_settings_screen.dart';
import 'privacy_settings_screen.dart';
import 'help_support_screen.dart';

class SettingsScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          // Background image with reduced opacity
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loginbackground.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200.withOpacity(0.5), Colors.blue.shade900.withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Settings content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.settings,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Quick Bite',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSettingsOption(
                    icon: Icons.person,
                    text: 'Account',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSettingsOption(
                    icon: Icons.notifications,
                    text: 'Notifications',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSettingsOption(
                    icon: Icons.lock,
                    text: 'Privacy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacySettingsScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSettingsOption(
                    icon: Icons.help,
                    text: 'Help & Support',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpSupportScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showLogoutConfirmationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 10),
                        Text(
                          'Log Out',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 5, // Adjust the index to highlight the Settings tab
        onTap: (index) {
          handleBottomNavigationTap(context, index);
        },
      ),
    );
  }

  // Build individual settings option
  Widget _buildSettingsOption(
      {required IconData icon, required String text, required Function() onTap}) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
        onTap: onTap,
      ),
    );
  }

  // Show a confirmation dialog for logout
  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Perform the logout action
                await _performLogout(context);
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  // Perform the logout action
  Future<void> _performLogout(BuildContext context) async {
    try {
      await _auth.signOut();
      // Clear user session or perform any other cleanup as needed

      // Navigate to the login screen
      Navigator.pushReplacementNamed(context, '/login');
    } catch (error) {
      print('Error during logout: $error');
      // Handle logout error
      // You may want to show an error message or log the error
    }
  }
}
