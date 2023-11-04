import 'package:expanse_tracker/services/auth-service.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = new AuthService();
    return Drawer(
      child: ListView(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity, // Lebar sesuai dengan drawer
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red), // Warna outline merah
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red, // Warna teks merah
                  ),
                ),
                onPressed: () async {
                  authService.logout();
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
