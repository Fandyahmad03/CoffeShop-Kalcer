import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String name; // Added name parameter

  const ProfilePage({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile of $name"),
        backgroundColor: const Color(0xFF4E342E),
      ),
      body: ListView(
        children: [
          // Header Profile
          Container(
            color: const Color(0xFF6F4E37),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Color(0xFF6F4E37)),
                ),
                const SizedBox(height: 10),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name, // Display the user's name
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Menu Items
          ListTile(
            leading: const Icon(Icons.notifications, color: Color(0xFF6F4E37)),
            title: const Text("Notifikasi"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle notifikasi
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history, color: Color(0xFF6F4E37)),
            title: const Text("Riwayat Pesanan"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle riwayat pesanan
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_phone, color: Color(0xFF6F4E37)),
            title: const Text("Hubungi Kami"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Hubungi Kami"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Email: warkopkalcer@gmail.com"),
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
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle pengaturan
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF6F4E37)),
            title: const Text("Keluar"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle logout
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
