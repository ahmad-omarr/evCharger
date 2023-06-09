import 'package:evcharger/controllers/appointment_controller.dart';
import 'package:evcharger/helpers/button.dart';
import 'package:evcharger/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../helpers/input_field.dart';
import '../helpers/theme.dart';
import '../layouts/payment_screen.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({Key? key}) : super(key: key);

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final AppointmentController _appointmentController =
      Get.put(AppointmentController());
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = "11:59 PM";
  String _selectedStation = "Select a Station";
  String _selectedCar = "Select a Car";
  TextEditingController _noteController = TextEditingController();

  List<String> carList = [
    "Tesla",
    "Porche",
    "Nissan",
    "Kia",
  ];
  List<String> stationList = [
    "Airport Road",
    "Marj Alhamam",
    "Abu Nsair",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // Empty AppBar
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  "Schedule charging Time",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InputField(
                title: 'Car Type',
                hint: '$_selectedCar',
                widget: DropdownButton(
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  underline: Container(
                    width: Get.width,
                    height: 0,
                  ),
                  items: carList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value.toString()),
                      value: value.toString(),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedCar = value!;
                    });
                  },
                ),
              ),
              InputField(
                title: 'Station',
                hint: '$_selectedStation',
                widget: DropdownButton(
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  underline: Container(
                    width: Get.width,
                    height: 0,
                  ),
                  items:
                      stationList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value.toString()),
                      value: value.toString(),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedStation = value!;
                    });
                  },
                ),
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: Icon(Icons.access_time_outlined),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Icon(Icons.access_time_outlined),
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: 'Additional Notes',
                hint: 'Enter any notes',
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: MyButton(
                  label: 'Save appointment',
                  onTap: () {
                    if (_selectedCar == "Select a Car") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Please select a valid car type."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else if (_selectedStation == "Select a Station") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content:
                                Text("Please select a valid charging station."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      _addTasktoDb();
                      Get.to(Payment());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to show the date picker and update the selected date
  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Set the first selectable date as today
      lastDate: DateTime(3000), // Max year is year 3000
    );

    if (_pickerDate != null) {
      // Check if the selected date is before today's date
      if (_pickerDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Please select a valid date."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _selectedDate = _pickerDate;
        });
      }
    } else {
      print("Null date");
    }
  }

  // Method to show the time picker and update the selected start/end time
  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? _pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 10),
    );

    if (_pickedTime != null) {
      DateTime selectedDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _pickedTime.hour,
        _pickedTime.minute,
      );

      // Check if the selected time is in the future
      if (selectedDateTime.isAfter(DateTime.now())) {
        String _formatedTime = _pickedTime.format(context);

        // Check if the end time is before the start time
        if (!isStartTime) {
          DateTime startTime = DateFormat("hh:mm a").parse(_startTime);
          DateTime endTime = DateFormat("hh:mm a").parse(_formatedTime);

          if (endTime.isBefore(startTime)) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("End time cannot be before start time."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
            return;
          }
        } else {
          DateTime startTime = DateFormat("hh:mm a").parse(_formatedTime);
          DateTime endTime = DateFormat("hh:mm a").parse(_endTime);

          if (startTime.isAfter(endTime)) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("Start time cannot be after end time."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
            return;
          }
        }

        if (isStartTime) {
          setState(() {
            _startTime = _formatedTime;
          });
        } else {
          setState(() {
            _endTime = _formatedTime;
          });
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Please select a valid time."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      print("No time selected");
    }
  }

  // Method to add the appointment to the database
  _addTasktoDb() async {
    int? id = await _appointmentController.addAppointment(
      appointment: Appointment(
        carType: _selectedCar,
        stationType: _selectedStation,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        note: _noteController.text,
        isCompleted: 0,
      ),
    );
    print("my id $id");
  }
}
