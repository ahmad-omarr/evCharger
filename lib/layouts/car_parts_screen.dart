import 'package:evcharger/layouts/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evcharger/helpers/theme.dart';

class CarPartsPage extends StatefulWidget {
  @override
  State<CarPartsPage> createState() => _CarPartsPageState();
}

class _CarPartsPageState extends State<CarPartsPage> {
  final List<String> imageUrls = [
    'https://hips.hearstapps.com/autoweek/assets/s3fs-public/ChevyVoltMotor.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Rollingstock_axle.jpg/360px-Rollingstock_axle.jpg',
    'https://editorial.pxcrush.net/carsales/general/editorial/bmw-gen5-high-voltage.jpg?width=1024&height=683',
    'https://media.istockphoto.com/id/691429614/photo/brake-disk-and-red-caliper-brakes-system.jpg?s=612x612&w=0&k=20&c=n3W9lLXFtaWtDSuKcRJwHfAb9VV-pFL7ulSTsvjCBJg=',
    'https://img.freepik.com/premium-photo/3d-car-frame-body-white-background_751108-1048.jpg',
    'https://m.media-amazon.com/images/I/71VYGvVpWPL.jpg',
    'https://media.istockphoto.com/id/1200294888/photo/steering-wheel-isolated-on-the-white-background.jpg?s=170667a&w=0&k=20&c=yE8IXFW4Tv_3MlyiDoRI6EJFtBXgQkfI1xNYFQd37JE=',
    'https://images.91wheels.com/news/wp-content/uploads/2022/01/main-qimg-7f7bf0318ba712bb5285c5e87a765e6a-copy.jpg?width=640&q=90',
    'https://di-uploads-pod5.dealerinspire.com/thompsonsalescompany/uploads/2022/05/Car-Radiator-New-Out-of-the-Engine.jpg',
  ];
  final List<String> titles = [
    'Engine',
    'Axie',
    '(electric) Battery',
    'Brakes',
    'Body',
    'Alternator',
    'Steering Wheel',
    'Chassis',
    'Radiator',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF21899C),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            alignment: AlignmentDirectional.center,
            child: Stack(
              children: [
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
                Column(
                  children: [
                    Text(
                      'Car Parts',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.8, // Adjust the height as needed
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => partsListTile(
                            title: titles[index],
                            imageUrl: imageUrls[index],
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    content: Container(
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 13),
                                            child: Text(
                                              'Car ${titles[index]}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Image.network(imageUrls[index]),
                                          SizedBox(height: 25),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.to(Payment()); //
                                                  // Close the dialog
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF21899C),
                                                  fixedSize:
                                                      const Size(100, 35),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Buy',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF21899C),
                                                  fixedSize:
                                                      const Size(100, 35),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Close',
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          itemCount: imageUrls.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget partsListTile({
    required String title,
    required String imageUrl,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? darkGreyClr : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            imageUrl,
            fit: BoxFit.contain, // Adjust the image fit as needed
            width: 100,
          ),
          title: Text(
            'Car ' + title,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 18, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
