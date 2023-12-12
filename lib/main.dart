import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/HomePage.dart';
import 'package:instagram_clone/pages/Sign_In_Page.dart';
import 'package:instagram_clone/pages/Sign_Up_Page.dart';
import 'package:instagram_clone/pages/splashPages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPages(),
      routes: {
        SplashPages.id: (context) => const SplashPages(),
        HomaPage.id: (context) => const HomaPage(),
        SignIn.id: (context) => const SignIn(),
        SignUp.id: (context) => const SignUp(),

      },
    );
  }
}

