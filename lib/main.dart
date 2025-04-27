import 'package:final_project/presentation/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  options:
  const FirebaseOptions(
      apiKey: 'AIzaSyAPZqDltIkgvrS0MEFoJRZXzggVpqudE9c',
      appId: '1:215317256822:android:1f70607f028f2006d69d57',
      messagingSenderId: '215317256822',
      projectId: 'finalproject-99a72');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
