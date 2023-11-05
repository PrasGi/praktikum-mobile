import 'package:expanse_tracker/component/bottom-bar.dart';
import 'package:expanse_tracker/pages/history-detail.dart';
import 'package:expanse_tracker/services/finance-service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Category> buttons = [];

  @override
  void initState() {
    super.initState();
    _fetchCategoryData();
  }

  Future<void> _fetchCategoryData() async {
    // await FinanceService.getFinance(1);
    try {
      Response datas = await FinanceService.getCategory();
      if (datas.statusCode == 200) {
        List<dynamic> categoriesData = datas.data as List;
        List<Category> categories = categoriesData.map((category) {
          return Category(category['id'], category['name'].toString());
        }).toList();
        setState(() {
          buttons = categories;
        });
      } else {
        // Handle error or set default values
        buttons = [
          Category(1, 'Need'),
        ];
      }
    } catch (error) {
      // Handle network or other errors
      buttons = [
        Category(1, 'Need'),
      ];
    }
  }

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
  final List<Category> buttons;

  CustomButtons({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttons.map((button) {
        return Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman detail dengan membawa ID kategori
                // Navigator.pushNamed(context, '/history/detail',
                //     arguments: button.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryDetail(categoryId: button.id),
                  ),
                );
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
                button.name, // Menggunakan property 'name' dari objek Category
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

class Category {
  final int id;
  final String name;

  Category(this.id, this.name);
}
