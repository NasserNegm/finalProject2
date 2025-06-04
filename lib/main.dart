// import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/presentation/mode/theme_provider.dart';
import 'package:final_project/presentation/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // EasyLocalization.ensureInitialized();
  options:
  const FirebaseOptions(
      apiKey: 'AIzaSyAPZqDltIkgvrS0MEFoJRZXzggVpqudE9c',
      appId: '1:215317256822:android:1f70607f028f2006d69d57',
      messagingSenderId: '215317256822',
      projectId: 'finalproject-99a72');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String locale = prefs.getString('locale') ?? 'en';

  runApp(
    // EasyLocalization(
    // supportedLocales: const [Locale('en'), Locale('ar')],
    // path: 'assets/translations',
    // fallbackLocale: const Locale('en'),
    // startLocale: Locale(locale),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()..loadTheme()),
      ],
      child: const MyApp(),
    ),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, ThemeProvider, child) {
      return MaterialApp(
        title: "Instagram App",
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        // themeMode: themeProvider.themeMode,
        home: const LoginScreen(),
      );
    });
  }
}
