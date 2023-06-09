import 'package:evcharger/layouts/car_parts_screen.dart';
import 'package:evcharger/layouts/profile_screen.dart';
import 'package:flutter/material.dart';

import '../Screens/add_appointment_screen.dart';
import '../Screens/appointments_screen.dart';
import '../Screens/map_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MapScreen(),
    AppointmentScreen(),
    CarPartsPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      //Display the current page based on the selected index
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFD35934),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        // Set the current selected index for the bottom navigation bar
        onTap: (int index) {
          setState(() {
            _currentIndex =
                index; // Update the selected index when a bottom navigation bar item is tapped
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair_outlined),
            label: 'Car Parts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
