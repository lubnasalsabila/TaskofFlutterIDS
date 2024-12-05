import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DetailPictureController extends GetxController {
  var picture = {}.obs;  // RxMap untuk data reaktif
  var isLoading = true.obs;

  Future<void> fetchPictureDetail(String id) async {
    try {
      isLoading(true);
      final response = await Dio().get('https://picsum.photos/id/$id/info');
      print(response.data);  // Debug: Periksa data yang diterima dari API

      // Pastikan bahwa data yang diterima sesuai dengan Map<String, dynamic>
      picture.value = response.data as Map<String, dynamic>;  // Menggunakan tipe yang tepat
    } catch (e) {
      print("Error fetching details: $e");
      picture.value = {};  // Mengatur menjadi kosong jika ada error
    } finally {
      isLoading(false);
    }
  }
}
