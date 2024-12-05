import 'package:get/get.dart';
import 'package:mini_project/service/picture/picture_service.dart';

class ListPictureController extends GetxController {
  final PictureService _pictureService = PictureService();

  var pictures = <Map<String, dynamic>>[].obs; // Objek reaktif untuk menyimpan daftar foto
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPictures();
  }

  Future<void> fetchPictures({int limit = 10, int page = 1}) async {
    try {
      isLoading.value = true;
      pictures.value = await _pictureService.fetchPictures(limit: limit, page: page);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
