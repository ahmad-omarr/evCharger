import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage_screen.dart';
import 'login_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  bool showPass = false;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        height: Get.height * 0.87,
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
                                    text: 'SIGN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'UP',
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

                            // Name textField
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: fNameController,
                                      style: GoogleFonts.inter(
                                        fontSize: 18.0,
                                        color: const Color(0xFF151624),
                                      ),
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      cursorColor: const Color(0xFF151624),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'please enter your first name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'first name',
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 12.0,
                                          color: const Color(0xFF151624)
                                              .withOpacity(0.5),
                                        ),
                                        filled: true,
                                        fillColor: fNameController.text.isEmpty
                                            ? const Color.fromRGBO(
                                                248, 247, 251, 1)
                                            : Colors.transparent,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            borderSide: BorderSide(
                                              color:
                                                  fNameController.text.isEmpty
                                                      ? Colors.transparent
                                                      : const Color.fromRGBO(
                                                          44, 185, 176, 1),
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 185, 176, 1),
                                            )),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: fNameController.text.isEmpty
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
                                          child: fNameController.text.isEmpty
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
                                  SizedBox(
                                    width: Get.width * .03,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: lNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'please enter your last name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      style: GoogleFonts.inter(
                                        fontSize: 18.0,
                                        color: const Color(0xFF151624),
                                      ),
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      cursorColor: const Color(0xFF151624),
                                      decoration: InputDecoration(
                                        hintText: 'last name',
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 12.0,
                                          color: const Color(0xFF151624)
                                              .withOpacity(0.5),
                                        ),
                                        filled: true,
                                        fillColor: lNameController.text.isEmpty
                                            ? const Color.fromRGBO(
                                                248, 247, 251, 1)
                                            : Colors.transparent,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            borderSide: BorderSide(
                                              color:
                                                  lNameController.text.isEmpty
                                                      ? Colors.transparent
                                                      : const Color.fromRGBO(
                                                          44, 185, 176, 1),
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 185, 176, 1),
                                            )),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: lNameController.text.isEmpty
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
                                          child: lNameController.text.isEmpty
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),

                            // phone textField

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                height: Get.height / 12,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter your phone number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: phoneController,
                                  style: GoogleFonts.inter(
                                    fontSize: 18.0,
                                    color: const Color(0xFF151624),
                                  ),
                                  maxLines: 1,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: const Color(0xFF151624),
                                  decoration: InputDecoration(
                                    hintText: 'phone number',
                                    hintStyle: GoogleFonts.inter(
                                      fontSize: 16.0,
                                      color: const Color(0xFF151624)
                                          .withOpacity(0.5),
                                    ),
                                    filled: true,
                                    fillColor: phoneController.text.isEmpty
                                        ? const Color.fromRGBO(248, 247, 251, 1)
                                        : Colors.transparent,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                          color: phoneController.text.isEmpty
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
                                      Icons.phone,
                                      color: phoneController.text.isEmpty
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
                                      child: phoneController.text.isEmpty
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

                            //email & password textField
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                height: Get.height / 12,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter your email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  style: GoogleFonts.inter(
                                    fontSize: 18.0,
                                    color: const Color(0xFF151624),
                                  ),
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
                                          ? const Color.fromRGBO(
                                              248, 247, 251, 1)
                                          : Colors.transparent,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                            color: passController.text.isEmpty
                                                ? Colors.transparent
                                                : const Color.fromRGBO(
                                                    44, 185, 176, 1),
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
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
                                    )),
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
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passController.text,
                                    );

                                    if (credential != null) {
                                      await saveDataToFirestore(credential
                                          .user); // Call the saveDataToFirestore function here
                                      setState(() {});
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LogIn(),
                                          ));
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'The password provided is too weak.'),
                                        duration: Duration(seconds: 3),
                                      ));
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'The account already exists for that email.'),
                                        duration: Duration(seconds: 3),
                                      ));
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF21899C),
                                  fixedSize: const Size(250, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: Text(
                                'Sign up',
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
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'LogIn',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LogIn(),
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

  Future<void> saveDataToFirestore(user) async {
    String fName = fNameController.text;
    String lName = lNameController.text;
    String phone = phoneController.text;

    //User? user = FirebaseAuth.instance.currentUser;
    // Add the data to Firestore
    try {
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        "fName": fName,
        "lName": lName,
        "phone": phone,
      });
      print('Data saved to Firestore');
    } catch (error) {
      print('Failed to save data: $error');
    }
  }
}

class UserModel {
  late String fName;
  late String lName;
  late String phone;

  UserModel({
    required this.fName,
    required this.lName,
    required this.phone,
  });

  toJson() {
    return {
      "phone": phone,
      "fName": fName,
      "lName": lName,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    phone = json["phone"];
    fName = json["fName"];
    lName = json["lName"];
  }

  Map<String, dynamic> toMap() {
    return {
      "phone": phone,
      "fName": fName,
      "lName": lName,
    };
  }
}
