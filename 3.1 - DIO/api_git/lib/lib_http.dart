import 'package:dio/dio.dart';
import 'transfer.dart';

class HttpService {
  final dio = Dio();

  Future<List<Repository>> getUserRepositories(String username) async {
    try {
      final response = await dio.get('https://api.github.com/users/$username/repos');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Repository.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load repositories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

}