import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
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
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'User Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.orange),
                  title: Text('Username'),
                  subtitle: Text('Ahmed Umer'),
                  trailing: Icon(Icons.edit, color: Colors.orange),
                  onTap: () {
                    // Implement edit functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.orange),
                  title: Text('Email'),
                  subtitle: Text('ahmedumer389@example.com'),
                  trailing: Icon(Icons.edit, color: Colors.orange),
                  onTap: () {
                    // Implement edit functionality here
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
                  leading: Icon(Icons.lock, color: Colors.orange),
                  title: Text('Change Password'),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
                  onTap: () {
                    // Implement change password functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.security, color: Colors.orange),
                  title: Text('Two-Factor Authentication'),
                  trailing: Switch(
                    value: true,
                    onChanged: (bool value) {
                      // Implement toggle functionality here
                    },
                    activeColor: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Preferences',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.language, color: Colors.orange),
                  title: Text('Language'),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
                  onTap: () {
                    // Implement language change functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.palette, color: Colors.orange),
                  title: Text('Theme'),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
                  onTap: () {
                    // Implement theme change functionality here
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
