import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl =
      'http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice';

  Future<Map<String, dynamic>> fetchHomeData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(
          response.body); // Make sure this is the correct data structure
    } else {
      throw Exception('Failed to load data');
    }
  }
}
