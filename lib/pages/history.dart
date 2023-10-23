import 'package:expanse_tracker/component/bottom-bar.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final List<Map<String, String>> buttons = [
    {'text': 'Need'},
    {'text': 'Want'},
    {'text': 'Saving'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'History',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0), // Jarak antara judul dan tombol-tombol
              CustomButtons(buttons: buttons),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class CustomButtons extends StatelessWidget {
  final List<Map<String, String>> buttons;

  CustomButtons({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttons.map((button) {
        return Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history/detail');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 100,
                ),
                elevation: 8.0,
                shadowColor: Colors.black,
              ),
              child: Text(
                button['text']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 252, 252),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        );
      }).toList(),
    );
  }
}
