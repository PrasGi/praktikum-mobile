import 'package:expanse_tracker/pages/home.dart';
import 'package:expanse_tracker/pages/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Buat TextEditingController untuk mengambil input dari field teks
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("LOGIN", style: TextStyle(fontSize: 30.0)),
            // Field teks untuk username
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
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
              onPressed: () {
                // Implementasi logika autentikasi dapat ditambahkan di sini
                // Misalnya, validasi username dan password
                // Contoh:
                if (_usernameController.text == 'user' &&
                    _passwordController.text == 'password') {
                  // Redirect ke halaman utama jika autentikasi berhasil
                  Navigator.pushNamed(context, '/home');
                } else {
                  // Tampilkan pesan kesalahan jika autentikasi gagal
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Invalid username or password.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
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
