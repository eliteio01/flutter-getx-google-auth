import 'package:get/get.dart';
import 'package:getx_google_auth/controller/auth_controller.dart';
import 'package:getx_google_auth/repository/auth_repository.dart';
import 'package:getx_google_auth/service/api_services.dart';

class DependencyInjection {
  static void init() {
    Get.put<ApiServices>(ApiServices(), permanent: true);
    Get.put<AuthRepository>(AuthRepository(apiServices: Get.find()),
        permanent: true);
    Get.put<AuthController>(AuthController(authRepository: Get.find()),
        permanent: true);
  }
}
