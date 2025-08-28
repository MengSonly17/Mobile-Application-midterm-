import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          
          // Change Password
          ListTile(
            leading: const Icon(Icons.lock_outline, color: Colors.teal),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to change password screen
            },
          ),
          
          // Update Profile
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.teal),
            title: const Text("Update Profile"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to profile update
            },
          ),
          
          const Divider(height: 30),
          const Text("Preferences", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          
          // Notifications
          SwitchListTile(
            secondary: const Icon(Icons.notifications, color: Colors.teal),
            title: const Text("Enable Notifications"),
            value: true,
            onChanged: (value) {
              // Handle toggle
            },
          ),
          
          // Dark Mode
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode, color: Colors.teal),
            title: const Text("Dark Mode"),
            value: false,
            onChanged: (value) {
              // Handle toggle
            },
          ),
          
          const Divider(height: 30),
          const Text("About", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.teal),
            title: const Text("App Version"),
            subtitle: const Text("v1.0.0"),
          ),
          
          ListTile(
            leading: const Icon(Icons.support_agent, color: Colors.teal),
            title: const Text("Support"),
            onTap: () {
              // Open support page or email
            },
          ),
          
          const SizedBox(height: 30),
          
          // Logout Button
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/login"); // or "/register"
          },
          child: const Text(
            "Logout",
            style: TextStyle(fontSize: 16),
          ),
        )

        ],
      ),
    );
  }
}
