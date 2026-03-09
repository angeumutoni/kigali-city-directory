import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("City Map"),
      ),
      body: const Center(
        child: Text(
          "Map integration coming soon",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}