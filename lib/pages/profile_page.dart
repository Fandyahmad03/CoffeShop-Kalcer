import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String name;

  const ProfilePage({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background lebih cerah
      appBar: AppBar(
        title: Text("Profil Saya"),
        backgroundColor: Colors.white,
        elevation: 1,
        scrolledUnderElevation: 1,
      ),
      body: ListView(
        children: [
          // Header Profile
          Container(
            color: const Color(0xFF6F4E37),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Color(0xFF6F4E37)),
                ),
                const SizedBox(height: 16),
                // MENAMPILKAN NAMA (TULISAN BESAR)
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          
          const SizedBox(height: 10), // Memberi sedikit jarak

          // Menu Items
          ListTile(
            leading: const Icon(Icons.notifications, color: Color(0xFF6F4E37)),
            title: const Text("Notifikasi"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle notifikasi
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history, color: Color(0xFF6F4E37)),
            title: const Text("Riwayat Pesanan"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle riwayat pesanan
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_phone, color: Color(0xFF6F4E37)),
            title: const Text("Hubungi Kami"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Hubungi Kami"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Email: CoffeShop kalcer@gmail.com"),
                      SizedBox(height: 8),
                      Text("Telepon: +62 812-3456-7890"),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Tutup"),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF6F4E37)),
            title: const Text("Pengaturan"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle pengaturan
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red), // Ikon logout diberi warna merah
            title: const Text("Keluar", style: TextStyle(color: Colors.red)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
            onTap: () {
              
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}