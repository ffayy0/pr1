import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // المحتوى الرئيسي
            Container(
              color: Colors.white,
              child: const Center(
                child: Text(
                  'المحتوى هنا',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),

            // زر تسجيل الخروج في الأعلى
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // الانتقال إلى الصفحة الرئيسية
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home', // استبدلها بمسار الصفحة الرئيسية
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}