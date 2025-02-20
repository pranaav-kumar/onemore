import 'package:flutter/material.dart';

//second branch
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final Color lightBeige = const Color.fromRGBO(247, 240, 234, 1);
  final Color warmBeige = const Color.fromRGBO(225, 213, 201, 1);
  final Color darkGrayBlack = const Color.fromRGBO(34, 35, 37, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: darkGrayBlack,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Login to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: darkGrayBlack.withAlpha((0.7 * 255).toInt()),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: darkGrayBlack),
                  filled: true,
                  fillColor: warmBeige,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: darkGrayBlack),
                  filled: true,
                  fillColor: warmBeige,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: darkGrayBlack),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGrayBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: darkGrayBlack),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSelectionPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkGrayBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpSelectionPage extends StatelessWidget {
  const SignUpSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(userType: "Alumni"),
                  ),
                );
              },
              child: Text("Sign Up as Alumni"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(userType: "Student"),
                  ),
                );
              },
              child: Text("Sign Up as Student"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final String userType;
  const SignUpPage({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up as $userType")),
      body: Center(child: Text("Sign Up Form for $userType")),
    );
  }
}
