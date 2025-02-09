import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mutabie1/screens/welcome_screen.dart';
import 'package:mutabie1/screens/logout_screen.dart'; // استيراد شاشة تسجيل الخروج


void main() async {
  // تهيئة Widgets وFirebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // تهيئة Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mutabie App', // اسم التطبيق
      initialRoute: '/', // المسار المبدئي للتطبيق
      routes: {
        '/': (context) => const WelcomeScreen(), // شاشة الترحيب
        '/logout': (context) => LogoutScreen(), // شاشة تسجيل الخروج
      },
    );
  }
}