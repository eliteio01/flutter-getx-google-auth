import 'package:get/get.dart';
import 'package:getx_google_auth/controller/auth_controller.dart';
import 'package:getx_google_auth/repository/auth_repository.dart';
import 'package:getx_google_auth/service/api_services.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiServices());
    Get.lazyPut(() => AuthRepository(apiServices: Get.find()));
    Get.lazyPut<AuthController>(
        () => AuthController(authRepository: Get.find()));
  }
}
