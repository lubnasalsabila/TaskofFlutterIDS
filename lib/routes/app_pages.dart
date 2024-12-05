import 'package:get/get.dart';
import 'package:mini_project/core.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.PHOTOS, // Gunakan Routes.PHOTOS
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: Routes.DETAIL, // Gunakan Routes.DETAIL
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    ),
  ];
}
