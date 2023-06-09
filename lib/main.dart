import 'package:evcharger/Screens/appointments_screen.dart';
import 'package:evcharger/helpers/theme_services.dart';
import 'package:evcharger/layouts/car_parts_screen.dart';
import 'package:evcharger/layouts/login_screen.dart';
import 'package:evcharger/layouts/payment_screen.dart';
import 'package:evcharger/layouts/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Screens/map_screen.dart';
import 'database/sqflite_db.dart';
import 'firebase_options.dart';
import 'helpers/theme.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize SQLite database helper
  SQLHelper dbHelper = SQLHelper();
  await dbHelper.initalDb();
  // Initialize GetStorage for persistent local storage
  await GetStorage.init();
  // Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      // Set the light theme for the app
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: primaryClr),
      ),
      darkTheme: ThemesClass.dark,
      themeMode: ThemeService().theme,
    );
  }
}
