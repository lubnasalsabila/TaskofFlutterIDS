import 'package:dio/dio.dart';

class PictureService {
  final Dio _dio = Dio();

  /// Fetch list of pictures with pagination
  Future<List<Map<String, dynamic>>> fetchPictures({int limit = 10, int page = 1}) async {
    try {
      final response = await _dio.get(
        'https://picsum.photos/v2/list',
        queryParameters: {
          'limit': limit,
          'page': page,
        },
      );
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw Exception('Failed to load pictures: $e');
    }
  }

  /// Fetch detail of a picture by ID
  Future<Map<String, dynamic>> fetchPictureDetail(String id) async {
    try {
      final response = await _dio.get('https://picsum.photos/id/$id/info');
      return Map<String, dynamic>.from(response.data);
    } catch (e) {
      throw Exception('Failed to load picture detail: $e');
    }
  }
}
