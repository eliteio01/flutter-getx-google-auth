import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';

  static final pages = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: register, page: () => const SignupView()),
    GetPage(name: home, page: () => const HomeView()),
  ];
}
