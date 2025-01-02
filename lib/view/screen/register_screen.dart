import 'package:etec_flutter_firebase_cli/view/screen/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _errorMessage;
  bool _isLoading = false; // Loading state

  Future<void> _register() async {
    setState(() {
      _errorMessage = null; // Clear any previous error messages
      _isLoading = true; // Start loading
    });

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = "Please enter both email and password.";
        _isLoading = false; // Stop loading
      });
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Handle successful registration
      print("Registered successfully: ${userCredential.user?.email}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage =
            e.message ?? "No error found!!!"; // Display error message
        _isLoading = false; // Stop loading
      });
      print("Error during registration: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              if (_isLoading) // Show loading indicator
                const CircularProgressIndicator()
              else
                GestureDetector(
                  onTap: _register,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
