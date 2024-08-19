import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text('PRIVACY POLICY', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Text(
            'Privacy Policy',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Last updated: August 16, 2024',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          Text(
            'Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our Brutalist Quotes application.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Information Collection and Use',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'We do not collect any personal information. All quotes are stored locally on your device.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          // Add more sections as needed
        ],
      ),
    );
  }
}
