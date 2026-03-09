# kigali-city-directory
## Demo Video: [https://youtu.be/7THllkGVNH8](url)
## Overview
The Kigali City Directory is a mobile application developed using Flutter and Firebase.

The application allows users to discover and manage important locations and services within Kigali, including hospitals, police stations, cafés, parks, and tourist attractions.

Users can authenticate securely, create listings, view shared listings, update their own listings, and delete them. All data is stored and synchronized in real time using Cloud Firestore.

## Features
The Kigali City Directory is a mobile application developed using Flutter and Firebase.

The application allows users to discover and manage important locations and services within Kigali, including hospitals, police stations, cafés, parks, and tourist attractions.

Users can authenticate securely, create listings, view shared listings, update their own listings, and delete them. All data is stored and synchronized in real time using Cloud Firestore.

## Technologies Used
Flutter, Firebase Authentication, Cloud Firestore, Dart

## Firebase Setup
To run the project locally, Firebase must be configured.

**Step 1: Create Firebase Project**
Go to Firebase Console
Click Create Project
Name the project (e.g., kigali-city-directory)

**Step 2: Enable Authentication**
Open Authentication
Click Get Started
Enable:
Email / Password Authentication
This allows users to register and login securely.

**Step 3: Enable Firestore Database**
Open Firestore Database
Click Create Database
Start in Test Mode for development
Choose a region
Firestore will store all listings created in the app.

**Step 4: Connect Flutter App**
Install FlutterFire CLI:
dart pub global activate flutterfire_cli
Configure Firebase:

flutterfire configure

This generates the file:

firebase_options.dart

which connects the Flutter app to Firebase.
