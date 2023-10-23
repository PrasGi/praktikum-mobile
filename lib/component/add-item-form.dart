import 'package:flutter/material.dart';

class AddItemForm extends StatefulWidget {
  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  String selectedCategory =
      'Choose Category'; // Nilai default untuk dropdown kategori
  double nominal = 0.0;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Field Dropdown untuk Kategori
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: <String>[
              'Choose Category',
              'Need',
              'Want',
              'Save',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 10), // Spasi antara dropdown dan nominal

          // Field TextFormField
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              // Validasi input nominal jika diperlukan
              // Contoh: Anda dapat memastikan nilai numerik yang valid
              name = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Nominal'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              // Validasi input nominal jika diperlukan
              // Contoh: Anda dapat memastikan nilai numerik yang valid
              nominal = double.tryParse(value) ?? 0.0;
            },
          ),

          SizedBox(height: 20), // Spasi antara field dan tombol

          ElevatedButton(
            onPressed: () {
              // Lakukan tindakan saat tombol "Simpan" pada form diklik
              // Misalnya, validasi dan simpan data
              // Setelah selesai, tutup dialog
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
