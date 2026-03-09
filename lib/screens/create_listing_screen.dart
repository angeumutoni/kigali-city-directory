import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateListingScreen extends StatefulWidget {
  const CreateListingScreen({super.key});

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();

  String category = "Hospital";

  bool isLoading = false;

  final categories = [
    "Hospital",
    "Police",
    "Café",
    "Restaurant",
    "Tourist Attraction"
  ];

  Future addListing() async {
    setState(() {
      isLoading = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance.collection("listings").add({
        "name": nameController.text.trim(),
        "description": descriptionController.text.trim(),
        "address": addressController.text.trim(),
        "contact": contactController.text.trim(),
        "category": category,
        "createdBy": user!.uid,
        "createdAt": Timestamp.now(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Listing created successfully")),
      );

      nameController.clear();
      descriptionController.clear();
      addressController.clear();
      contactController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Listing"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Place Name",
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField(
                value: category,
                items: categories.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    category = val!;
                  });
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: "Address",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: contactController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Contact Number",
                ),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Create Listing"),
                      onPressed: addListing,
                    )
            ],
          ),
        ),
      ),
    );
  }
}