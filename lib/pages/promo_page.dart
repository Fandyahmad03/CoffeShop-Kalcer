import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  final String imageUrl;
  final String caption;

  const PromoPage({super.key, required this.imageUrl, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Promo"),
        backgroundColor: const Color(0xFF6F4E37),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              caption,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F4E37),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Nikmati promo spesial kami dengan diskon hingga 50%! Jangan lewatkan kesempatan ini.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6F4E37),
            ),
            child: const Text("Kembali"),
          ),
        ],
      ),
    );
  }
}
