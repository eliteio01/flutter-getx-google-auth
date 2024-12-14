import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_google_auth/widgets/auth/auth_elevated_btn_icon.dart';
import 'package:getx_google_auth/widgets/auth/auth_gradient_btn.dart';
import 'package:getx_google_auth/widgets/auth/auth_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  TextInputType keyboardType = TextInputType.text;
  void passwordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(1),
                    const Color(0xFF322ED4),
                  ],
                  radius: 0.8,
                  center: Alignment.topRight,
                ),
              ),
            ),
            Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Elite tech',
                          style: GoogleFonts.montserratAlternates(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Positioned(
                top: 219,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                )),
            Positioned(
              top: 235,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get started free.',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Free forever. No credit card needed',
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Full name',
                          obscureText: false,
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Email Address',
                          obscureText: false,
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Password',
                          obscureText: obscureText,
                          controller: passwordController,
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? FontAwesome.eye
                                  : FontAwesome.eye_slash,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              passwordVisibility();
                            },
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 20),
                        GradientButton(
                          gradientColors: const [
                            Color(0xFF3632D5),
                            Color(0xFFCD5ABA)
                          ],
                          buttonText: 'Sign up',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Or sign up with',
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey,
                                  ),
                                )),
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomElevatedButtonIcon(
                              label: 'Google',
                              icon: Brand(
                                Brands.google,
                                size: 25,
                              ),
                              onPressed: () {
                                // Handle button press
                              },
                              brandColorText: Colors.black,
                            ),
                            CustomElevatedButtonIcon(
                              label: 'Facebook',
                              icon: Brand(
                                Brands.facebook_circled,
                                size: 25,
                              ),
                              onPressed: () {
                                // Handle button press
                              },
                              brandColorText: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
