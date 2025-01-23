import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_google_auth/repository/auth_repository.dart';

import '../utils/snackbar/fail_snackbar.dart';
import '../utils/snackbar/success_snackbar.dart';
import '../views/home_view.dart';

class AuthController extends GetxController {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final AuthRepository authRepository;

  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  AuthController({required this.authRepository});

  Future<void> loginWithGoogle(String idToken) async {
    try {
      isLoading.value = true;
      final data = await authRepository.loginWithGoogle(idToken);
      print(data);
      if (data != null) {
        await secureStorage.write(key: 'authToken', value: data['token']);
        await secureStorage.write(key: 'name', value: data['user']['name']);
        await secureStorage.write(key: 'email', value: data['user']['email']);
        await secureStorage.write(key: 'isAuth', value: 'true');
        // Update UI state
        isLoggedIn.value = true;
        String? token = await secureStorage.read(key: 'authToken');
        if (token != null) {
          Get.offAll(() => const HomeView());
        }
        showSuccessSnackBar('logged in', 'welcome to a new world!');
      }
    } catch (e) {
      print(e);
      showFailedSnackBar('Login error', 'an error occurred during login');
    } finally {
      isLoading.value = false;
    }
  }
}
