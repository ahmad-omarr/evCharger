import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Signup_screen.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  bool showPass = false;
  bool editFName = true;
  bool editLName = true;
  bool editEmail = true;
  bool editPassword = true;
  bool editPhone = true;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: Get.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * .73,
                      child: TextFormField(
                        readOnly: editFName,
                        controller: fNameController,
                        style: GoogleFonts.inter(
                          fontSize: 18.0,
                          color: const Color(0xFF151624),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color(0xFF151624),
                        decoration: InputDecoration(
                          hintText: 'first name',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16.0,
                            color: const Color(0xFF151624).withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: !editFName
                              ? Colors.grey[200]?.withOpacity(.5)
                              : Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editFName
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editFName
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          prefixIcon: Icon(
                            Icons.person,
                            color: editFName
                                ? Colors.red
                                : const Color.fromRGBO(44, 185, 176, 1),
                            size: 16,
                          ),
                          suffix: Container(
                            alignment: Alignment.center,
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: editFName
                                  ? Colors.red
                                  : const Color.fromRGBO(44, 185, 176, 1),
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
                      width: Get.width * 0.01,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {});
                          editFName = !editFName;
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
              ),

              // last name
              Padding(
                padding: EdgeInsets.only(
                  bottom: Get.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * .73,
                      child: TextFormField(
                        controller: lNameController,
                        style: GoogleFonts.inter(
                          fontSize: 18.0,
                          color: const Color(0xFF151624),
                        ),
                        maxLines: 1,
                        readOnly: editLName,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color(0xFF151624),
                        decoration: InputDecoration(
                          hintText: 'last name',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16.0,
                            color: const Color(0xFF151624).withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: !editLName
                              ? Colors.grey[200]
                              : Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editLName
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editLName
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          prefixIcon: Icon(
                            Icons.person,
                            color: editLName
                                ? Colors.red
                                : const Color.fromRGBO(44, 185, 176, 1),
                            size: 16,
                          ),
                          suffix: Container(
                            alignment: Alignment.center,
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: editLName
                                  ? Colors.red
                                  : const Color.fromRGBO(44, 185, 176, 1),
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
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {});
                          editLName = !editLName;
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
              ),

              // phone number
              Padding(
                padding: EdgeInsets.only(
                  bottom: Get.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * .73,
                      child: TextFormField(
                        controller: phoneController,
                        readOnly: editPhone,
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
                            color: const Color(0xFF151624).withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: !editPhone
                              ? Colors.grey[200]
                              : Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editPhone
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editPhone
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: editPhone
                                ? Colors.red
                                : const Color.fromRGBO(44, 185, 176, 1),
                            size: 16,
                          ),
                          suffix: Container(
                            alignment: Alignment.center,
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: editPhone
                                  ? Colors.red
                                  : const Color.fromRGBO(44, 185, 176, 1),
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
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {});
                          editPhone = !editPhone;
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
              ),

              //email textField
              Padding(
                padding: EdgeInsets.only(
                  bottom: Get.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * .73,
                      child: TextFormField(
                        readOnly: editEmail,
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
                            color: const Color(0xFF151624).withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: !editEmail
                              ? Colors.grey[200]
                              : Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editEmail
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: editEmail
                                    ? Colors.red
                                    : const Color.fromRGBO(44, 185, 176, 1),
                              )),
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: editEmail
                                ? Colors.red
                                : const Color.fromRGBO(44, 185, 176, 1),
                            size: 16,
                          ),
                          suffix: Container(
                            alignment: Alignment.center,
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: editEmail
                                  ? Colors.red
                                  : const Color.fromRGBO(44, 185, 176, 1),
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
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {});
                          editEmail = !editEmail;
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
              ),

              // password
              Padding(
                padding: EdgeInsets.only(
                  bottom: Get.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * .73,
                      child: TextFormField(
                          readOnly: editPassword,
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
                              color: const Color(0xFF151624).withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: !editPassword
                                ? Colors.grey[200]
                                : Colors.transparent,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: editPassword
                                      ? Colors.red
                                      : const Color.fromRGBO(44, 185, 176, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: editPassword
                                      ? Colors.red
                                      : const Color.fromRGBO(44, 185, 176, 1),
                                )),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: editPassword
                                  ? Colors.red
                                  : const Color.fromRGBO(44, 185, 176, 1),
                              size: 16,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  showPass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: editPassword
                                      ? Colors.red
                                      : const Color.fromRGBO(44, 185, 176, 1)),
                              onPressed: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                            ),
                          )),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {});
                          editPassword = !editPassword;
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // confirm button
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _updateUserProfile();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF21899C),
                      fixedSize: const Size(325, 65),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void userData({
    required fName,
    required lName,
    required phone,
  }) {
    // Create a UserModel object using the provided parameters
    UserModel user = UserModel(fName: fName, lName: lName, phone: phone);

    // Store the user data in Firestore
    FirebaseFirestore.instance
        .collection("Users")
        .doc()
        .set(user.toMap())
        .then((value) {
      // The data was successfully saved
      fName = fNameController.text;
      lName = lNameController.text;
      phone = phoneController.text;
    }).catchError((error) {
      // An error occurred while saving the data
      print("error");
    });
  }

  Future<void> saveDataToFirestore() async {
    String fName = fNameController.text;
    String lName = lNameController.text;
    String phone = phoneController.text;

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

  void _updateUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> updatedData = {};

    // Check each field and add the non-empty ones to the updatedData map
    if (emailController.text.isNotEmpty) {
      await user?.updateEmail(user.uid);
    }

    if (passController.text.isNotEmpty) {
      await user?.updatePassword(user.uid);
    }

    if (fNameController.text.isNotEmpty) {
      updatedData['fName'] = fNameController.text;
    }

    if (lNameController.text.isNotEmpty) {
      updatedData['lName'] = lNameController.text;
    }

    if (phoneController.text.isNotEmpty) {
      updatedData['phone'] = phoneController.text;
    }

    try {
      if (updatedData.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .update(updatedData);
      }
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (error) {
      // An error occurred while updating the profile
      print('$error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $error')),
      );
    }
  }
}
