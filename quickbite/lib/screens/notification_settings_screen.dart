import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.notifications,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Notification Preferences',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: SwitchListTile(
                  activeColor: Colors.orange,
                  title: Text('Email Notifications'),
                  value: true,
                  onChanged: (bool value) {
                    // Implement toggle functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: SwitchListTile(
                  activeColor: Colors.orange,
                  title: Text('Push Notifications'),
                  value: false,
                  onChanged: (bool value) {
                    // Implement toggle functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: SwitchListTile(
                  activeColor: Colors.orange,
                  title: Text('SMS Notifications'),
                  value: true,
                  onChanged: (bool value) {
                    // Implement toggle functionality here
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Sound & Vibration',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: SwitchListTile(
                  activeColor: Colors.orange,
                  title: Text('Notification Sound'),
                  value: true,
                  onChanged: (bool value) {
                    // Implement toggle functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: SwitchListTile(
                  activeColor: Colors.orange,
                  title: Text('Vibrate on Notification'),
                  value: false,
                  onChanged: (bool value) {
                    // Implement toggle functionality here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
