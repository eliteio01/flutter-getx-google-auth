import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_google_auth/routes/api_routes.dart';
import 'package:getx_google_auth/service/api_services.dart';

class AuthRepository extends GetxController {
  final ApiServices apiServices;

  AuthRepository({required this.apiServices});

  Future<Map<String, dynamic>?> loginWithGoogle(idToken) async {
    try {
      final response = await apiServices
          .postRequest(ApiRoutes.googleSignIn, {'idToken': idToken});
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data['user'] != null) {
          return data;
        }
      }
    } catch (e) {
      print('error occurred during login: $e');
      rethrow;
    }
  }
}
