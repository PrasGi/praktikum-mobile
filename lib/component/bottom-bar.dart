import 'package:expanse_tracker/component/add-item-form.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.history, title: 'History'),
      ],
      onTap: (int index) {
        // Gunakan Navigator untuk berpindah ke rute yang sesuai
        switch (index) {
          case 0:
            Navigator.pushNamed(
                context, '/home'); // Ganti '/home' dengan rute yang sesuai
            break;
          case 1:
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddItemForm(); // Tampilkan pop-up form
              },
            );
            break;
          case 2:
            Navigator.pushNamed(context,
                '/history'); // Ganti '/history' dengan rute yang sesuai
            break;
          default:
            break;
        }
      },
      style: TabStyle.fixedCircle,
    );
  }
}
