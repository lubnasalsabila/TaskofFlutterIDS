import 'package:flutter/material.dart';

class DetailContentWidget extends StatelessWidget {
  final Map<String, dynamic> picture;  // Tipe data Map<String, dynamic>

  const DetailContentWidget({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.network(
            picture['download_url'],  // Pastikan kunci ini ada di data
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Text(
            picture['author'],  // Pastikan kunci ini ada di data
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
          const SizedBox(height: 8),
          Text('ID: ${picture['id']}'),  // Pastikan kunci ini ada di data
        ],
      ),
    );
  }
}
