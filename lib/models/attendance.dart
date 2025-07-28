class AttendanceRecord {
  final String name;
  final String type;
  final String date;
  final bool isHoliday;

  AttendanceRecord({
    required this.name,
    required this.type,
    required this.date,
    this.isHoliday = false,
  });
}