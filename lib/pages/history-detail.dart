import 'package:expanse_tracker/component/bottom-bar.dart';
import 'package:flutter/material.dart';

class HistoryDetail extends StatelessWidget {
  const HistoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Bagian atas dengan tiga ListView dalam satu baris
            Container(
              padding: EdgeInsets.all(16.0),
              color: const Color.fromARGB(
                  255, 255, 255, 255), // Ganti warna latar belakang dengan pink
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton('Want', Colors.blue),
                  CustomButton('Need', Colors.blue),
                  CustomButton('Save', Colors.blue),
                ],
              ),
            ),
            Expanded(
              child: CustomListView(),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  CustomButton(this.text, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aksi yang ingin diambil ketika tombol ditekan
      },
      style: ElevatedButton.styleFrom(
        primary: backgroundColor, // Warna latar belakang tombol
        padding: EdgeInsets.symmetric(
            vertical: 16.0, horizontal: 30.0), // Ubah padding horizontal
        elevation: 8.0, // Tinggi tombol yang memberikan efek BoxShadow
        shadowColor: Colors.black, // Warna shadow
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.0, // Ukuran teks tombol
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20.0),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(top: 16.0),
              child:
                  _buildListItem('Want', 'Beli Sepatu Sport', 'Rp 2.900.700'),
            );
          }
          return _buildListItem('Want', 'Deskripsi', 'Total');
        },
      ),
    );
  }

  Widget _buildListItem(String want, String description, String total) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 8.0), // Ubah padding vertikal
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              want,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              total,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
