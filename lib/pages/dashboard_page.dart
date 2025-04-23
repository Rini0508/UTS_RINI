import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String username = "user";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      username = args; // Ambil username dari argument
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Membungkus dengan SingleChildScrollView
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "Halo, $username!", // Menampilkan username yang diambil
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,  // Menambahkan shrinkWrap untuk menghindari error scroll
              physics: NeverScrollableScrollPhysics(), // Menghindari scroll yang tidak diinginkan
              children: [
                _buildCard(context, Icons.add, "Counter", "/counter"),
                _buildCard(context, Icons.person, "Profil Saya", "/profile/$username"),
                _buildCard(context, Icons.settings, "Pengaturan", "/dashboard"),
                _buildLogoutCard(context), // Ganti dari Info jadi Logout
              ],
            ),
            Stack(
              children: [
                Container(height: 100, width: double.infinity, color: Colors.grey),
                const Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    "Selamat Datang!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/login');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Berhasil keluar")),
        );
      },
      child: const Card(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 40),
            SizedBox(height: 8),
            Text("Keluar"),
          ],
        ),
      ),
    );
  }
}
