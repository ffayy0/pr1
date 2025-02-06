import 'package:flutter/material.dart';
//import 'package:flutter_application_1/page/welcome.dart';
import 'package:mutabie1/welcome.dart';
///import '';
//import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // تشغيل شاشة Welcome أولًا
    );
  }
}