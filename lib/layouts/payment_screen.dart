import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evcharger/layouts/homepage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Screens/map_screen.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _formKey = GlobalKey<FormState>();
  String selectedPaymentMethod = '';
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cvv = TextEditingController();
  late String path;
  String cardData = '';

  @override
  void initState() {
    super.initState();
    if (cardNumber.text.isNotEmpty) {
      // Fetch the card data from Firebase if cardNumber is not empty
      fetchCardData();
    }
  }

  void fetchCardData() {
    FirebaseFirestore.instance
        .collection("credits")
        .get()
        .then((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          Map<String, dynamic> data =
              snapshot.docs[0].data() as Map<String, dynamic>;
          cardNumber.text = data['cardNumber'] ?? '';
        });
      } else {
        // Handle case when the collection is empty
        print("No data found in the 'credits' collection.");
      }
    }).catchError((error) {
      // Handle any errors that occur during the query
      print("Error retrieving data from 'credits' collection: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF21899C),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
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
                    bottom: 50.0,
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
                                        text: 'PAY',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'MENT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFFD35934),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16.0),
                                      TextFormField(
                                        maxLength: 16,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        onChanged: (value) {
                                          setState(() {
                                            if (cardNumber.text
                                                .startsWith('4')) {
                                              path = 'assets/Visa.png';
                                            } else if (cardNumber.text
                                                .startsWith('5')) {
                                              path = 'assets/Mastercard.png';
                                            }
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your card number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: cardNumber,
                                        style: GoogleFonts.inter(
                                          fontSize: 16.0,
                                          color: const Color(0xFF151624),
                                        ),
                                        cursorColor: const Color(0xFF151624),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: cardData.isEmpty
                                              ? 'Enter you card number'
                                              : savedCard(),
                                          hintStyle: GoogleFonts.inter(
                                            fontSize: 16.0,
                                            color: const Color(0xFF151624)
                                                .withOpacity(0.5),
                                          ),
                                          filled: true,
                                          fillColor: cardNumber.text.isEmpty
                                              ? const Color.fromRGBO(
                                                  248, 247, 251, 1)
                                              : Colors.transparent,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            borderSide: BorderSide(
                                              color: cardNumber.text.isEmpty
                                                  ? Colors.transparent
                                                  : const Color.fromRGBO(
                                                      44, 185, 176, 1),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 185, 176, 1),
                                            ),
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.payment,
                                            color:
                                                Color.fromRGBO(44, 185, 176, 1),
                                            size: 16,
                                          ),
                                          suffix: !cardNumber.text
                                                          .startsWith('5') &&
                                                      !cardNumber.text
                                                          .startsWith('4') ||
                                                  cardNumber.text.isEmpty
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  width: 24.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    color: const Color.fromRGBO(
                                                        44, 185, 176, 1),
                                                  ),
                                                  child: const Center(),
                                                )
                                              : Image.asset(path, height: 25),
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: expiryDate,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter the expiry date';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Color(0xFF151624),
                                              ),
                                              cursorColor:
                                                  const Color(0xFF151624),
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: 'Expiry Date',
                                                labelStyle: TextStyle(
                                                  color: const Color(0xFF151624)
                                                      .withOpacity(0.5),
                                                ),
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        44, 185, 176, 1),
                                                  ),
                                                ),
                                                prefixIcon: const Icon(
                                                  Icons.calendar_today,
                                                  color: Color.fromRGBO(
                                                      44, 185, 176, 1),
                                                  size: 16,
                                                ),
                                              ),
                                              onTap: () async {
                                                final DateTime? pickedDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.now().add(
                                                      const Duration(
                                                          days: 365 *
                                                              10)), // Limit to 10 years in the future
                                                );

                                                if (pickedDate != null) {
                                                  setState(() {
                                                    expiryDate.text =
                                                        DateFormat('yyyy-MMM')
                                                            .format(pickedDate);
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: cvv,
                                              maxLength: 3,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter the CVV';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              style: GoogleFonts.inter(
                                                fontSize: 16.0,
                                                color: const Color(0xFF151624),
                                              ),
                                              cursorColor:
                                                  const Color(0xFF151624),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                labelText: 'CVV',
                                                labelStyle: TextStyle(
                                                  color: const Color(0xFF151624)
                                                      .withOpacity(0.5),
                                                ),
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        44, 185, 176, 1),
                                                  ),
                                                ),
                                                prefixIcon: const Icon(
                                                  Icons.lock,
                                                  color: Color.fromRGBO(
                                                      44, 185, 176, 1),
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.001,
                                ),

                                //confirm button
                                ElevatedButton(
                                  onPressed: () async {
                                    String cardNum = cardNumber.text;

                                    // Validate cardNumber, expiryDate, and cvv
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        await FirebaseFirestore.instance
                                            .collection('credits')
                                            .doc()
                                            .set({
                                          "cardNumber": cardNum,
                                          "expiry": expiryDate.text,
                                          "CVV": cvv.text,
                                        });
                                        print('Data saved to Firestore');
                                      } catch (error) {
                                        print('Failed to save data: $error');
                                      }

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Payment Successful'),
                                            content: const Text(
                                                'Thank you for your payment.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.to(MyHomePage());
                                                },
                                                child: const Text('Close'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF21899C),
                                    fixedSize: const Size(250, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  String savedCard() {
    FirebaseFirestore.instance
        .collection("credits")
        .get()
        .then((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        cardData = snapshot.docs[0].data().toString();
        // or you can access specific fields like snapshot.docs[0].data()['fieldName']
      } else {
        // Handle case when the collection is empty
        print("No data found in the 'credits' collection.");
      }
    }).catchError((error) {
      // Handle any errors that occur during the query
      print("Error retrieving data from 'credits' collection: $error");
    });

    return cardData;
  }

  Future<void> showMonthYearPicker(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: currentDate,
                  mode: CupertinoDatePickerMode.date,
                  minimumYear: currentDate.year - 1,
                  maximumYear: currentDate.year + 1,
                  onDateTimeChanged: (DateTime? dateTime) {
                    if (dateTime != null) {
                      currentDate = dateTime;
                    }
                  },
                ),
              ),
              Container(
                height: 50.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        expiryDate.text = DateFormat('yyyy-mmm').format(pickedDate);
      });
    }
  }

  AssetImage creditCardLogo() {
    return AssetImage(path);
  }
}
