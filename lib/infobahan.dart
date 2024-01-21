import 'package:flutter/material.dart';

class InfoBahanScreen extends StatefulWidget {
  const InfoBahanScreen({Key? key}) : super(key: key);

  @override
  _InfoBahanScreenState createState() => _InfoBahanScreenState();
}

class _InfoBahanScreenState extends State<InfoBahanScreen> {
  List<String> infoBahanList = [
    'Cat Acrylic',
    'Cat Minyak',
    'Pensil Gambar',
    'Batu Arang',
    'Krayon Warna',
    'Pensil Warna Air',
    'Kertas Seni',
    'Palet',
    'Kuas Lukis',
    'Gunting Seni',
    'Tinta',
    'Pensil Teknik',
    'Marker Seni',
    'Lem',
    'Clay',
    'Pensil Sketsa',
    'Gel Pens',
    'Stensil',
    'Tembaga atau Kawat',
  ];

  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    // Menampilkan seluruh daftar bahan saat inisialisasi
    filteredList = List.from(infoBahanList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Bahan Seni'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterList(value);
              },
              decoration: InputDecoration(
                labelText: 'Cari Info Bahan',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredList[index]),
                  // Tambahkan aksi lain jika diperlukan
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterList(String query) {
    setState(() {
      filteredList = infoBahanList
          .where((bahan) => bahan.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
