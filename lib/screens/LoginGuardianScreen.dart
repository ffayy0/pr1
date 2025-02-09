import 'package:flutter/material.dart';

class LoginGuardianScreen extends StatefulWidget {
  const LoginGuardianScreen({Key? key}) : super(key: key);

  @override
  _LoginGuardianScreenState createState() => _LoginGuardianScreenState();
}

class _LoginGuardianScreenState extends State<LoginGuardianScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // قاعدة بيانات وهمية للمستخدمين (ID أو البريد + كلمة المرور)
  final Map<String, String> users = {
    "admin": "admin123",
    "user1": "password1",
    "testUser": "test123"
  };

  // دالة تسجيل الدخول
  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (users.containsKey(email) && users[email] == password) {
      // تسجيل دخول ناجح
      setState(() {
        _errorMessage = "تم تسجيل الدخول بنجاح!";
      });

      // يمكن توجيه المستخدم إلى الصفحة الرئيسية هنا
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // تسجيل دخول فاشل
      setState(() {
        _errorMessage = "اسم المستخدم أو كلمة المرور غير صحيحة.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // شعار التطبيق
            Image.network(
              'https://i.postimg.cc/DwnKf079/321e9c9d-4d67-4112-a513-d368fc26b0c0.jpg',
              height: 180,
            ),
            const SizedBox(height: 30),

            // حقل ID أو البريد الإلكتروني
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person, color: Colors.indigo),
                hintText: 'ID or email', // هنا يمكن تعديل النص بناءً على الاستخدام المطلوب
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // حقل كلمة المرور
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: Colors.indigo),
                hintText: 'كلمة المرور',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // عرض رسالة الخطأ
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: _errorMessage == "تم تسجيل الدخول بنجاح!" ? Colors.green : Colors.red),
              ),

            const SizedBox(height: 10),

            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: _login, // استدعاء دالة تسجيل الدخول عند الضغط
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'تسجيل دخول', // هنا تم تعديل النص إلى "تسجيل دخول" دون تغيير لأنه ينطبق على الجميع
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
