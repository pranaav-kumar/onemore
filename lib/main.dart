import 'package:flutter/material.dart';

class AppColors {
  static const Color lightBeige = Color.fromRGBO(247, 240, 234, 1);
  static const Color warmBeige = Color.fromRGBO(225, 213, 201, 1);
  static const Color darkGrayBlack = Color.fromRGBO(34, 35, 37, 1);
  static final Color darkGrayBlack70 = Color.fromRGBO(34, 35, 37, 0.7);
}

class StudentProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
        backgroundColor: AppColors.darkGrayBlack,
        automaticallyImplyLeading: false, // Removes debug banner icon
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/profile.jpg',
              ), // Replace with actual image
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGrayBlack,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'XYZ Engineering College',
              style: TextStyle(fontSize: 18, color: AppColors.darkGrayBlack70),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrayBlack,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warmBeige,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'I am currently working as a software engineer at ABC Corp. Passionate about AI and Machine Learning.',
                style: TextStyle(fontSize: 16, color: AppColors.darkGrayBlack),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Info:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrayBlack,
                ),
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.email, color: AppColors.darkGrayBlack),
              title: Text(
                'john.doe@example.com',
                style: TextStyle(color: AppColors.darkGrayBlack),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: AppColors.darkGrayBlack),
              title: Text(
                '+123 456 7890',
                style: TextStyle(color: AppColors.darkGrayBlack),
              ),
            ),
            ListTile(
              leading: Icon(Icons.link, color: AppColors.darkGrayBlack),
              title: Text(
                'LinkedIn: linkedin.com/in/johndoe',
                style: TextStyle(color: AppColors.darkGrayBlack),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Skills:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrayBlack,
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: Text('Flutter'),
                  backgroundColor: AppColors.warmBeige,
                ),
                Chip(label: Text('Dart'), backgroundColor: AppColors.warmBeige),
                Chip(
                  label: Text('Machine Learning'),
                  backgroundColor: AppColors.warmBeige,
                ),
              ],
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Achievements:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrayBlack,
                ),
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.star, color: Colors.amber),
              title: Text(
                'Winner of Hackathon 2024',
                style: TextStyle(color: AppColors.darkGrayBlack),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.amber),
              title: Text(
                'Best Student Award 2023',
                style: TextStyle(color: AppColors.darkGrayBlack),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.amber),
              title: Text(
                'Internship at Google',
                style: TextStyle(color: AppColors.darkGrayBlack),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.lightBeige,
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Enables automatic dark mode switching
      home: StudentProfilePage(),
    ),
  );
}
