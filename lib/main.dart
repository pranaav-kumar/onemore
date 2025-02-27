import 'package:flutter/material.dart';

//two more change

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

  static const Color lightBeige = Color.fromRGBO(247, 240, 234, 1);
  static const Color warmBeige = Color.fromRGBO(225, 213, 201, 1);
  static const Color darkGrayBlack = Color.fromRGBO(34, 35, 37, 1);
  static final Color darkGrayBlack70 = Color.fromRGBO(34, 35, 37, 0.7);

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
      backgroundColor: const Color.fromRGBO(247, 240, 234, 1),
      appBar: AppBar(
        title: Text("Sign Up", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromRGBO(225, 213, 201, 1),
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
                    builder:
                        (context) => SignUpForm(
                          userType: "Alumni",
                          fields: [
                            "Name",
                            "Mail ID",
                            "College Passed Out Year",
                            "Domain of Work",
                            "Organisation Name",
                            "Username",
                            "Password",
                          ],
                        ),
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
                    builder:
                        (context) => SignUpForm(
                          userType: "Student",
                          fields: [
                            "Name",
                            "Mail ID",
                            "Department",
                            "Username",
                            "Password",
                          ],
                        ),
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

class SignUpForm extends StatefulWidget {
  final String userType;
  final List<String> fields;

  const SignUpForm({super.key, required this.userType, required this.fields});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final Map<String, TextEditingController> _controllers = {};
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    for (var field in widget.fields) {
      _controllers[field] = TextEditingController();
    }
  }

  void _checkFields() {
    setState(() {
      _isComplete = _controllers.values.every(
        (controller) => controller.text.isNotEmpty,
      );
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Sign Up Successful"),
            content: Text("You have successfully signed up!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children:
              widget.fields.map((field) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: _controllers[field],
                      decoration: InputDecoration(labelText: field),
                      onChanged: (_) => _checkFields(),
                    ),
                  );
                }).toList()
                ..add(
                  _isComplete
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ElevatedButton(
                          onPressed: _showSuccessDialog,
                          child: Text("Next"),
                        ),
                      )
                      : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(),
                      ),
                ),
        ),
      ),
    );
  }
}
