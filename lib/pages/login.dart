import 'package:expanse_tracker/pages/home.dart';
import 'package:expanse_tracker/pages/register.dart';
import 'package:expanse_tracker/services/auth-service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Buat TextEditingController untuk mengambil input dari field teks
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthService authService = new AuthService();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("LOGIN", style: TextStyle(fontSize: 30.0)),
            // Field teks untuk username
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 20.0), // Spasi antar elemen
            // Field teks untuk password
            TextFormField(
              controller: _passwordController,
              obscureText: true, // Untuk menyembunyikan teks
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 20.0), // Spasi antar elemen
            // Tombol untuk melakukan login
            ElevatedButton(
              onPressed: () async {
                // Panggil fungsi login dari AuthService
                bool auth = await authService.login(
                    _emailController.text, _passwordController.text);

                if (auth) {
                  Navigator.pushNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Login failed, email or password incorrect"),
                    backgroundColor: Colors.redAccent,
                  ));
                }
              },
              child: Text('Login'),
            ),
            // Teks "Already have an account? Register"
            TextButton(
              onPressed: () {
                // Navigasi ke halaman registrasi
                // Gantilah 'RegisterPage()' dengan halaman registrasi Anda
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
