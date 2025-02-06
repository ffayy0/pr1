import 'package:flutter/material.dart';
//import 'package:flutter_application_1/page/home_screen.dart';
import 'package:mutabie1/home_screen.dart';
 // استيراد الصفحة الجديدة HomeScreen

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()), // الانتقال إلى HomeScreen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://i.postimg.cc/DwnKf079/321e9c9d-4d67-4112-a513-d368fc26b0c0.jpg', // رابط اللوجو
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}