import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
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
                  Icons.help_outline,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Help & Support',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.orange),
                  title: Text('FAQ'),
                  subtitle: Text('Frequently Asked Questions'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.contact_support, color: Colors.orange),
                  title: Text('Contact Us'),
                  subtitle: Text('Get in touch with our support team'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.bug_report, color: Colors.orange),
                  title: Text('Report a Bug'),
                  subtitle: Text('Let us know if you find any bugs'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.feedback, color: Colors.orange),
                  title: Text('Send Feedback'),
                  subtitle: Text('Give us your feedback'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Guides',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.book, color: Colors.orange),
                  title: Text('User Guide'),
                  subtitle: Text('Learn how to use the app'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.security, color: Colors.orange),
                  title: Text('Privacy Policy'),
                  subtitle: Text('Read our privacy policy'),
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.rule, color: Colors.orange),
                  title: Text('Terms of Service'),
                  subtitle: Text('Read our terms of service'),
                  onTap: () {
                    // Implement navigation or functionality here
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
