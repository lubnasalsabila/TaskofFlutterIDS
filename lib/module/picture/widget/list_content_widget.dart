import 'package:flutter/material.dart';

class ListContentWidget extends StatelessWidget {
  final Map<String, dynamic> picture;
  final VoidCallback onTap;

  const ListContentWidget({
    Key? key,
    required this.picture,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Image.network(
            picture['download_url'], // Gunakan URL dari API
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text('by: ${picture['author']}'), // Nama pengarang
        ),
      ),
    );
  }
}
