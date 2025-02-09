import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  bool _isLoading = false; // متغير لتحميل البيانات
  String _errorMessage = '';

  // دالة تسجيل المدرسة وتخزينها في Firestore
  Future<void> _registerSchool() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final String schoolName = _schoolNameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();
    final String location = _locationController.text.trim();

    if (schoolName.isEmpty || email.isEmpty || password.isEmpty || location.isEmpty) {
      setState(() {
        _errorMessage = "يرجى إدخال جميع البيانات المطلوبة.";
        _isLoading = false;
      });
      return;
    }

    if (!email.contains('@')) {
      setState(() {
        _errorMessage = "يرجى إدخال بريد إلكتروني صحيح.";
        _isLoading = false;
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = "كلمة المرور وتأكيدها غير متطابقين.";
        _isLoading = false;
      });
      return;
    }

    try {
      // حفظ البيانات في Firestore
      await FirebaseFirestore.instance.collection('schools').add({
        'schoolName': schoolName,
        'email': email,
        'password': password,
        'location': location,
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        _errorMessage = "تم تسجيل المدرسة بنجاح!";
        _isLoading = false;
      });

      // تفريغ الحقول بعد التسجيل الناجح
      _schoolNameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _locationController.clear();
    } catch (e) {
      setState(() {
        _errorMessage = "حدث خطأ أثناء التسجيل. حاول مرة أخرى.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل مدرسة جديدة")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://i.postimg.cc/DwnKf079/321e9c9d-4d67-4112-a513-d368fc26b0c0.jpg', height: 150),
            const SizedBox(height: 20),

            CustomTextField(controller: _schoolNameController, icon: Icons.school, hintText: "اسم المدرسة"),
            CustomTextField(controller: _locationController, icon: Icons.location_on, hintText: "موقع المدرسة"),
            CustomTextField(controller: _emailController, icon: Icons.email, hintText: "البريد الإلكتروني"),
            CustomTextField(controller: _passwordController, icon: Icons.lock, hintText: "كلمة المرور", obscureText: true),
            CustomTextField(controller: _confirmPasswordController, icon: Icons.lock, hintText: "تأكيد كلمة المرور", obscureText: true),

            const SizedBox(height: 10),

            if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: TextStyle(color: _errorMessage.contains("نجاح") ? Colors.green : Colors.red)),

            const SizedBox(height: 10),

            _isLoading
                ? CircularProgressIndicator() // مؤشر تحميل عند التسجيل
                : ElevatedButton(
                    onPressed: _registerSchool,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: Size(double.infinity, 50)),
                    child: Text('تسجيل', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
          ],
        ),
      ),
    );
  }
}

// ويدجت مخصصة لحقل الإدخال
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool obscureText;

  CustomTextField({required this.controller, required this.icon, required this.hintText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.indigo),
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}