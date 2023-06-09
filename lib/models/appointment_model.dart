class Appointment {
  int? id;

  String? carType;
  String? stationType;
  String? date;
  String? startTime;
  String? endTime;
  String? note;
  int? isCompleted;

  Appointment({
    this.id,
    this.carType,
    this.stationType,
    this.date,
    this.startTime,
    this.endTime,
    this.note,
    this.isCompleted,
  });

  // Constructor to create an Appointment object from JSON data
  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carType = json['carType'];
    stationType = json['stationType'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    note = json['note'];
    isCompleted = json['isCompleted'];
  }

  // Method to convert an Appointment object to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['carType'] = this.carType;
    data['stationType'] = this.stationType;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['note'] = this.note;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}