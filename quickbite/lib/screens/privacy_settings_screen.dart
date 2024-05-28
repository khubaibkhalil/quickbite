import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
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
                  Icons.lock,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Privacy Settings',
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
                  title: Text('Profile Visibility'),
                  subtitle: Text('Make my profile visible to others'),
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
                  title: Text('Search History'),
                  subtitle: Text('Save my search history'),
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
                  title: Text('Activity Status'),
                  subtitle: Text('Show my activity status'),
                  value: true,
                  onChanged: (bool value) {
                    // Implement toggle functionality here
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Security',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.security, color: Colors.orange),
                  title: Text('Two-Factor Authentication'),
                  subtitle: Text('Enable/Disable 2FA'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.password, color: Colors.orange),
                  title: Text('Change Password'),
                  subtitle: Text('Update your account password'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Data Management',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.delete_forever, color: Colors.orange),
                  title: Text('Clear Search History'),
                  subtitle: Text('Remove all search history data'),
                  onTap: () {
                    // Implement functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.download, color: Colors.orange),
                  title: Text('Download Your Data'),
                  subtitle: Text('Get a copy of your data'),
                  onTap: () {
                    // Implement functionality here
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
