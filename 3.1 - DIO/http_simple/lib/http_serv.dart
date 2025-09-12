import 'package:dio/dio.dart';
import 'package:http_simple/num_rep.dart';

class HttpService {
  final Dio dio = Dio();
  final String baseUrl = 'https://fourn6-mobile-prof.onrender.com';

  Future<NumberResponse> doubleNumber(int number) async {
    try{
      final response = await dio.get(baseUrl + '/exos/long/double/' + number.toString());

      if (response.data is int) {
        return NumberResponse(result: response.data);
      } else {
        return NumberResponse.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Failed: ' + e.toString());
    }
  }
}