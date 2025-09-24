import 'package:flutter/material.dart';
import 'login_page.dart';
import 'user_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isFilled = false;

  void _checkFields() {
    setState(() {
      _isFilled =
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      UserData.register(email, password, "");

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Dialog(
          backgroundColor: const Color(0xFFF3E9E2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF6F4E37),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Icon(Icons.check, color: Colors.white, size: 48),
                ),
                const SizedBox(height: 20),
                Text(
                  "Register Berhasil!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F4E37),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Silakan login untuk masuk.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF6F4E37), fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop(); // Tutup dialog
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E9E2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Logo bulat dengan shadow
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/logo.jpeg"),
                ),
              ),
              // Card register
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Daftar Akun ",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF6F4E37),
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            filled: true,
                            fillColor: Colors.brown[50],
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Email wajib diisi'
                              : null,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            filled: true,
                            fillColor: Colors.brown[50],
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Password wajib diisi'
                              : null,
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6F4E37),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 3,
                            ),
                            onPressed: _isFilled ? _register : null,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Sudah punya akun? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login di sini",
                                style: TextStyle(
                                  color: const Color(0xFF6F4E37),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
