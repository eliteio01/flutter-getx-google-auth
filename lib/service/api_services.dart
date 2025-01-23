import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<http.Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(data),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
