import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:evcharger/Screens/add_appointment_screen.dart';
import 'package:evcharger/helpers/theme.dart';
import 'package:evcharger/helpers/theme_services.dart';
import 'package:evcharger/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/appointment_controller.dart';
import '../helpers/button.dart';
import '../helpers/task_tile.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime _selectedDate = DateTime.now();
  final _appointmentController = Get.put(AppointmentController());

  @override
  void initState() {
    super.initState();
    _appointmentController
        .getAppointments(); // Fetch data when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMd().format(DateTime.now()),
                        style: subHeadingStyle,
                      ),
                      Text(
                        "Today",
                        style: headingStyle,
                      ),
                    ],
                  ),
                ),
                MyButton(
                  label: '+ Add Appointment',
                  onTap: () async {
                    await Get.to(AddAppointment());
                    _appointmentController.getAppointments();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 5),
            child: Container(
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.white,
                selectionColor: primaryClr,
                dateTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                dayTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                monthTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Divider(color: Colors.black, thickness: 1),
          ),
          _showAppointment(),
        ],
      ),
    );
  }

  // To show the added list tiles
  _showAppointment() {
    return Expanded(
      child: Obx(() {
        List<Appointment> filteredAppointments = _appointmentController
            .appointmentList
            .where((appointment) =>
                appointment.date == DateFormat.yMd().format(_selectedDate))
            .toList();

        if (filteredAppointments.isEmpty) {
          return Center(
            child: Text(
              'No appointments today',
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        // To show the added list tiles
        return ListView.builder(
          itemCount: filteredAppointments.length,
          itemBuilder: (_, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(
                              context, filteredAppointments[index]);
                        },
                        child: appointmentTile(filteredAppointments[index]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  // to show the completed and delete buttons when pressed on the list tile
  _showBottomSheet(BuildContext context, Appointment appointment) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(top: 4),
        height: appointment.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? darkGreyClr : Colors.white,
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              height: 6,
              width: 12,
            ),
            appointment.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: 'Appointment Completed',
                    onTap: () {
                      _appointmentController.markTaskCompleted(appointment.id!);
                      Get.back();
                    },
                    clr: primaryClr,
                    context: context,
                  ),
            SizedBox(height: 20),
            _bottomSheetButton(
              label: 'Delete Appointment',
              onTap: () {
                _appointmentController.delete(appointment);
                _appointmentController.getAppointments();
                Get.back();
              },
              clr: Colors.red,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  //Show the buttons inside the bottom sheet
  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true ? Colors.red : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.red : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? subHeadingStyle
                : subHeadingStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  //to call the app bar
  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
        },
        child: Icon(
          Icons.nightlight_round_rounded,
          size: 20,
        ),
      ),
      actions: [
        SizedBox(width: 20),
      ],
    );
  }
}
