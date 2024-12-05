import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/core.dart'; // Mengimpor LoadingWidget

class ListPictureView extends StatelessWidget {
  final ListPictureController controller = Get.put(ListPictureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Photo'),  // Mengubah ke bahasa Indonesia
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingWidget();  // Mengganti dengan LoadingWidget
        }

        return ListView.builder(
          itemCount: controller.pictures.length,
          itemBuilder: (context, index) {
            final picture = controller.pictures[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL, arguments: picture['id']);
              },
              child: Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corner
                ),
                elevation: 5, // Gaya bayangan card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar yang memenuhi Card
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        picture['download_url'],
                        height: 200,  // Mengatur tinggi gambar agar menyesuaikan
                        width: double.infinity, // Membuat gambar memenuhi lebar card
                        fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Nama penulis gambar di ujung kanan
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end, // Menempatkan tulisan di kanan
                        children: [
                          Text(
                            'by: ${picture['author']}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
