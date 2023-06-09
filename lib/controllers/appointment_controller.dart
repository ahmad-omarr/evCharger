import 'package:evcharger/models/appointment_model.dart';
import 'package:get/get.dart';

import '../database/sqflite_db.dart';

class AppointmentController extends GetxController {
  SQLHelper dbHelper = SQLHelper();

  @override
  void onReady() {
    super.onReady();
  }

  var appointmentList = <Appointment>[].obs;

  // Retrieves appointments from the database
  Future<void> getAppointments() async {
    final db = await SQLHelper().db;
    if (db != null) {
      // Query the 'evcharger' table in the database
      List<Map<String, dynamic>> tasks = await db.query('evcharger');
      // Convert the query result into a list of Appointment objects
      appointmentList.assignAll(
          tasks.map((data) => new Appointment.fromJson(data)).toList());
    }
  }

  // Adds a new appointment to the database
  Future<int?> addAppointment({required Appointment appointment}) async {
    final db = await SQLHelper().db;
    if (db != null) {
      // Insert the appointment into the 'evcharger' table and return the ID
      final id = await db.insert('evcharger', appointment.toJson());
      return id;
    } else {
      return null;
    }
  }

  // Deletes an appointment from the database
  void delete(Appointment appointment) {
    SQLHelper.delete(appointment);
  }

  // Marks a task as completed in the database
  Future<void> markTaskCompleted(int id) async {
    await SQLHelper.update(id);
    getAppointments();
  }
}
