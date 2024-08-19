import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SETTINGS', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Notification Settings'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // TODO: Implement notification settings
              },
            ),
          ),
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // TODO: Implement dark mode
              },
            ),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              // TODO: Navigate to About screen
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              // TODO: Navigate to Privacy Policy screen
            },
          ),
        ],
      ),
    );
  }
}
