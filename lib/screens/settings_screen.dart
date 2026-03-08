import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool notifications = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),

      body: Column(
        children: [

          const ListTile(
            title: Text("User"),
            subtitle: Text("user@email.com"),
          ),

          SwitchListTile(
            title: const Text("Location Notifications"),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),

          ElevatedButton(
            onPressed: () {
              context.read<AuthProvider>().logout();
            },
            child: const Text("Logout"),
          )
        ],
      ),
    );
  }
}