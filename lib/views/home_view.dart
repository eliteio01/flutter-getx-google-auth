import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_google_auth/service/auth_services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

var arguments = Get.arguments;
var name = arguments['name'];
var email = arguments['email'];

class _HomeViewState extends State<HomeView> {
  final SecureStorage = const FlutterSecureStorage();
  final AuthServices authServices = AuthServices();
  String name = '';
  String email = '';
  @override
  void initState() {
    loadUserDate();
    super.initState();
  }

  Future<void> loadUserDate() async {
    final storedName = await SecureStorage.read(key: 'name');
    final storedEmail = await SecureStorage.read(key: 'email');

    setState(() {
      name = storedName!;
      email = storedEmail!;
    });
  }

  Future<void> _logout() async {
    await authServices.signOut();
    await SecureStorage.deleteAll();
    Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome message with the user's name
              Text(
                'Welcome, $name!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Displaying the user's email
              Text(
                'Your email: $email',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Logout button
              ElevatedButton(
                onPressed: () {
                  _logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
