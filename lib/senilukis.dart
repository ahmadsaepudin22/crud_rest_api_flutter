import 'package:flutter/material.dart';

class SeniLukisScreen extends StatelessWidget {
  const SeniLukisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seni Lukis'),
      ),
      body: ListView(
        children: [
          _buildBukuCard(
            'Aliran Seni Lukis Indonesia',
            'W Setya R',
            'https://pmpk.kemdikbud.go.id/bukudigital/upload/modules/images/1632143251_614887933c537.jpg',
          ),
          _buildBukuCard(
            'Sejarah Seni Rupa',
            'Farid Abdullah',
            'https://i1.rgstatic.net/publication/343628894_Sejarah_Seni_Rupa_Barat/links/5f352281a6fdcccc43c5be11/largepreview.png',
          ),
          // Tambahkan card buku lainnya sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildBukuCard(String judul, String penulis, String imageUrl) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(judul),
            subtitle: Text(penulis),
          ),
        ],
      ),
    );
  }
}
