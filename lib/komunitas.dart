import 'package:flutter/material.dart';

class KomunitasScreen extends StatefulWidget {
  const KomunitasScreen({Key? key}) : super(key: key);

  @override
  _KomunitasScreenState createState() => _KomunitasScreenState();
}

class _KomunitasScreenState extends State<KomunitasScreen> {
  TextEditingController _namaKomunitasController = TextEditingController();
  List<String> _daftarKomunitas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komunitas Seniman'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputKomunitas(),
            SizedBox(height: 20),
            _buildDaftarKomunitas(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputKomunitas() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _namaKomunitasController,
            decoration: InputDecoration(
              hintText: 'Masukkan Nama Komunitas',
            ),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: _tambahKomunitas,
          child: Text('Tambah'),
        ),
      ],
    );
  }

  Widget _buildDaftarKomunitas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daftar Komunitas:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _daftarKomunitas.map((komunitas) {
            return Text('- $komunitas');
          }).toList(),
        ),
      ],
    );
  }

  void _tambahKomunitas() {
    String namaKomunitas = _namaKomunitasController.text.trim();
    if (namaKomunitas.isNotEmpty) {
      setState(() {
        _daftarKomunitas.add(namaKomunitas);
        _namaKomunitasController.clear();
      });
    }
  }
}
