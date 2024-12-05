import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/core.dart';

class DetailPictureView extends StatelessWidget {
  final DetailPictureController controller = Get.put(DetailPictureController());

  DetailPictureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ambil ID dari argumen
    final String photoId = Get.arguments as String;

    // Panggil fetchPictureDetail saat widget pertama kali dibuat
    controller.fetchPictureDetail(photoId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Photo'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingWidget(); // Menggunakan LoadingWidget
        }

        final picture = controller.picture;

        if (picture.isEmpty) {
          return const Center(child: Text('Failed to load picture detail.'));
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Memperlebar gambar agar memenuhi lebar layar
              Image.network(
                picture['download_url'],
                width: double.infinity, // Gambar memenuhi lebar layar
                height: 300, // Tetap mempertahankan tinggi gambar
                fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran box
              ),
              const SizedBox(height: 16),
              // Nama penulis berada di ujung kanan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Menempatkan tulisan di kanan
                  children: [
                    Text(
                      'by: ${picture['author']}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      }),
    );
  }
}
