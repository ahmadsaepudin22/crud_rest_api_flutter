import 'package:flutter/material.dart';
import 'pelajariteknik.dart';
import 'package:uts_pm2_ahmad/pages/galerikarya.dart';
import 'senilukis.dart';
import 'infobahan.dart';
import 'komunitas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paint Pedia',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 245, 245, 81)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaintPedia'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 62, 167, 62),
              ),
              child: Center(
                child: Text(
                  'PaintPedia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            _buildDrawerItem('Pelajari Teknik', Icons.brush, context,
                PelajariTeknikScreen()),
            _buildDrawerItem('Galeri Karya', Icons.image, context, ListAlat()),
            _buildDrawerItem('Seni Lukis Untuk Pemula', Icons.school, context,
                SeniLukisScreen()),
            _buildDrawerItem(
                'Info Bahan Seni', Icons.palette, context, InfoBahanScreen()),
            _buildDrawerItem(
                'Komunitas Seniman', Icons.group, context, KomunitasScreen()),
          ],
        ),
      ),
      body: Center(
        child: const Text(
            'Halaman Utama, Silahkan Gunakan Drawer untuk Melihat Konten'),
      ),
    );
  }

  ListTile _buildDrawerItem(
      String title, IconData icon, BuildContext context, Widget screen) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }
}
