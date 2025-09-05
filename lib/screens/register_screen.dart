import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

  class UserData {
    static String fullName = 'MengSonly';
    static String email = 'mengsonly@gmail.com';
    static String password = 'Sonly_123#';
    static String confirmpassword = 'Sonly_123#';
  }

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Real-time error messages
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;



  @override
  void initState() {
    super.initState();

    // Listen to changes and validate in real-time
    _nameController.addListener(() {
      setState(() {
        _nameError = _validateName(_nameController.text);
      });
    });

    _emailController.addListener(() {
      setState(() {
        _emailError = _validateEmail(_emailController.text);
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _passwordError = _validatePassword(_passwordController.text);
        _confirmPasswordError = _validateConfirmPassword(_confirmPasswordController.text);
      });
    });

    _confirmPasswordController.addListener(() {
      setState(() {
        _confirmPasswordError = _validateConfirmPassword(_confirmPasswordController.text);
      });
    });
  }

  String? _validateName(String value) {
    if (value.isEmpty) return "Full name is required";
    return null;
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) return "Email is required";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return "Enter a valid email";
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) return "Password is required";
    if (value.length < 6) return "Minimum 6 characters required";
    if (!RegExp(r'[A-Z]').hasMatch(value)) return "Must contain at least 1 uppercase letter";
    if (!RegExp(r'\d').hasMatch(value)) return "Must contain at least 1 number";
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) return "Must contain at least 1 special character (!@#\$&*~)";
    return null;
  }

  String? _validateConfirmPassword(String value) {
    if (value != _passwordController.text) return "Passwords do not match";
    return null;
  }

  bool _isFormValid() {
    return _validateName(_nameController.text) == null &&
        _validateEmail(_emailController.text) == null &&
        _validatePassword(_passwordController.text) == null &&
        _validateConfirmPassword(_confirmPasswordController.text) == null;
  }

  void _register() {
    if (_isFormValid()) {
      // Store values in static variables
      UserData.fullName = _nameController.text;
      UserData.email = _emailController.text;
      UserData.password = _passwordController.text;
      UserData.confirmpassword = _confirmPasswordController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registered Successfully!")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/register.png", height: 200)),
              const SizedBox(height: 20),
              const Text("Let's Get Started", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text("Create an account to get all features", style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 30),

              // Full Name
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "enter your full name",
                  prefixIcon: const Icon(Icons.person_outline),
                  errorText: _nameError,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 15),

              // Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "enter your email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  errorText: _emailError,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 15),

              // Password
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  errorText: _passwordError,
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 15),

              // Confirm Password
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: "confirm password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  errorText: _confirmPasswordError,
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFormValid() ? Colors.teal : Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isFormValid() ? _register : null,
                  child: const Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
                              // Divider
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("You can Connect with"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),

                // Google Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    icon: Image.asset(
                      "assets/images/google.png", // 👈 Google images
                      height: 24,
                    ),
                    label: const Text(
                      "Sign Up with Google",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 20),

                // Sign Up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
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
