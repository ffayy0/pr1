import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  final String schoolName;

  const SchoolScreen({Key? key, required this.schoolName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: const Text('إدارة المدرسة'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // تسجيل الخروج
              Navigator.pop(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // شعار المدرسة
            Image.network(
              'https://i.postimg.cc/DwnKf079/321e9c9d-4d67-4112-a513-d368fc26b0c0.jpg', // رابط الصورة
              height: 150,
            ),
            const SizedBox(height: 20),

            

            // زر "إدارة الطلاب"
            ElevatedButton(
              onPressed: () {
                // التوجيه إلى شاشة  الاداريين 
                Navigator.pushNamed(context, '/manageStudents');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'الاداريين',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // زر "إضافة اداري جديد"
            ElevatedButton(
              onPressed: () {
                // التوجيه إلى شاشة إضافة موظف
                Navigator.pushNamed(context, '/addEmployee');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'إضافة إداري جديد ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // زر "تغيير موقع المدرسة"
            ElevatedButton(
              onPressed: () {
                // التوجيه إلى شاشة تغيير الموقع
                Navigator.pushNamed(context, '/changeLocation');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'تغيير موقع المدرسة',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}