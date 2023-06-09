import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Signup_screen.dart';
import 'homepage_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool showPass = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    final auth = FirebaseAuth.instanceFor(
        app: Firebase.app(), persistence: Persistence.NONE);

    return Scaffold(
      backgroundColor: const Color(0xFF21899C),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              //background design
              Positioned(
                left: -26,
                top: 51.0,
                child: SvgPicture.string(
                  '<svg viewBox="-26.0 51.0 91.92 91.92" ><path transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, -26.0, 96.96)" d="M 48.75 0 L 65 32.5 L 48.75 65 L 16.24999809265137 65 L 0 32.5 L 16.25000381469727 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, -10.83, 105.24)" d="M 0 0 L 27.625 11.05000019073486 L 55.25 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, 16.51, 93.51)" d="M 0 37.04999923706055 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 91.92,
                  height: 91.92,
                ),
              ),
              Positioned(
                right: 43.0,
                top: -103,
                child: SvgPicture.string(
                  '<svg viewBox="63.0 -103.0 268.27 268.27" ><path transform="matrix(0.5, -0.866025, 0.866025, 0.5, 63.0, 67.08)" d="M 147.2896423339844 0 L 196.3861999511719 98.19309997558594 L 147.2896423339844 196.3861999511719 L 49.09654235839844 196.3861999511719 L 0 98.19309234619141 L 49.09656143188477 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.5, -0.866025, 0.866025, 0.5, 113.73, 79.36)" d="M 0 0 L 83.46413421630859 33.38565444946289 L 166.9282684326172 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.5, -0.866025, 0.866025, 0.5, 184.38, 23.77)" d="M 0 111.9401321411133 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 268.27,
                  height: 268.27,
                ),
              ),
              Positioned(
                right: -19,
                top: 31.0,
                child: SvgPicture.string(
                  '<svg viewBox="329.0 31.0 65.0 65.0" ><path transform="translate(329.0, 31.0)" d="M 48.75 0 L 65 32.5 L 48.75 65 L 16.24999809265137 65 L 0 32.5 L 16.25000381469727 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(333.88, 47.58)" d="M 0 0 L 27.625 11.05000019073486 L 55.25 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(361.5, 58.63)" d="M 0 37.04999923706055 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 65.0,
                  height: 65.0,
                ),
              ),

              //card and footer ui
              Positioned(
                bottom: 20.0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Get.width * 0.9,
                        height: Get.height * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //logo & text
                            Image.asset(
                              'assets/EV-charging.png',
                              height: Get.height / 4,
                              width: Get.height / 4,
                              color: const Color(0xFFD35934),
                            ),
                            Text.rich(
                              TextSpan(
                                style: GoogleFonts.inter(
                                  fontSize: 30,
                                  color: const Color(0xFF21899C),
                                  letterSpacing: 2.000000061035156,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'LOG',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'IN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFD35934),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),

                            //email & password textField
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                height: Get.height / 12,
                                child: TextFormField(
                                  controller: emailController,
                                  style: GoogleFonts.inter(
                                    fontSize: 18.0,
                                    color: const Color(0xFF151624),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter your email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: const Color(0xFF151624),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    hintStyle: GoogleFonts.inter(
                                      fontSize: 16.0,
                                      color: const Color(0xFF151624)
                                          .withOpacity(0.5),
                                    ),
                                    filled: true,
                                    fillColor: emailController.text.isEmpty
                                        ? const Color.fromRGBO(248, 247, 251, 1)
                                        : Colors.transparent,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                          color: emailController.text.isEmpty
                                              ? Colors.transparent
                                              : const Color.fromRGBO(
                                                  44, 185, 176, 1),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(44, 185, 176, 1),
                                        )),
                                    prefixIcon: Icon(
                                      Icons.mail_outline_rounded,
                                      color: emailController.text.isEmpty
                                          ? const Color(0xFF151624)
                                              .withOpacity(0.5)
                                          : const Color.fromRGBO(
                                              44, 185, 176, 1),
                                      size: 16,
                                    ),
                                    suffix: Container(
                                      alignment: Alignment.center,
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: const Color.fromRGBO(
                                            44, 185, 176, 1),
                                      ),
                                      child: emailController.text.isEmpty
                                          ? const Center()
                                          : const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                height: Get.height / 12,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter your password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: passController,
                                  style: GoogleFonts.inter(
                                    fontSize: 16.0,
                                    color: const Color(0xFF151624),
                                  ),
                                  cursorColor: const Color(0xFF151624),
                                  obscureText: !showPass,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    hintStyle: GoogleFonts.inter(
                                      fontSize: 16.0,
                                      color: const Color(0xFF151624)
                                          .withOpacity(0.5),
                                    ),
                                    filled: true,
                                    fillColor: passController.text.isEmpty
                                        ? const Color.fromRGBO(248, 247, 251, 1)
                                        : Colors.transparent,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                          color: passController.text.isEmpty
                                              ? Colors.transparent
                                              : const Color.fromRGBO(
                                                  44, 185, 176, 1),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(44, 185, 176, 1),
                                        )),
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: passController.text.isEmpty
                                          ? const Color(0xFF151624)
                                              .withOpacity(0.5)
                                          : const Color.fromRGBO(
                                              44, 185, 176, 1),
                                      size: 16,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        showPass
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color.fromRGBO(
                                            44, 185, 176, 1),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showPass = !showPass;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),

                            //sign in button

                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    // Signing in with email and password using FirebaseAuth
                                    final credential = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                    Navigator.push(
                                        // Navigating to the home page after successful sign-in
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ));
                                  } on FirebaseAuthException catch (e) {
                                    // Handling specific exceptions related to sign-in errors
                                    if (e.code == 'user-not-found') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'No user found for that email.'),
                                        duration: Duration(seconds: 3),
                                      ));
                                    } else if (e.code == 'wrong-password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Wrong password provided for that user.'),
                                        duration: Duration(seconds: 3),
                                      ));
                                    }
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF21899C),
                                  fixedSize: const Size(250, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.inter(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          RichText(
                              text: TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: 13.0,
                              color: Colors.white,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Don’t have an account? ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up here',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Signup(),
                                        ));
                                  },
                                style: const TextStyle(
                                  color: Color(0xFFFE9879),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
