import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _focusedDay = DateTime(2025, 7, 15);
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            // Calendar with header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: _buildCalendar(),
            ),

            const SizedBox(height: 24),

            _Section(
              title: 'Upcoming Holidays',
              items: const [
                _IconRow(
                  icon: Icons.calendar_month,
                  iconColor: Colors.red,
                  title: 'Guru Purnima',
                  subtitle: '10 July, 2025',
                ),
                _IconRow(
                  icon: Icons.calendar_month,
                  iconColor: Colors.red,
                  title: 'Bhanu Jayanti',
                  subtitle: '13 July, 2025',
                ),
              ],
            ),

            const SizedBox(height: 16),

            _Section(
              title: 'Upcoming Birthdays',
              items: const [
                _IconRow(
                  icon: Icons.cake,
                  iconColor: Colors.orange,
                  title: 'Bhavna Patil',
                  subtitle: '21 July, 2025',
                ),
                _IconRow(
                  icon: Icons.cake,
                  iconColor: Colors.orange,
                  title: 'Parag Mistri',
                  subtitle: '24 July, 2025',
                ),
              ],
            ),

            const SizedBox(height: 16),

            _Section(
              title: '',
              items: const [
                _LeaveRow(
                  from: 'Aug 5, 2025',
                  to: 'Aug 7, 2025',
                  reason: 'Medical Leave 3 Days',
                  approved: false,
                ),
                _LeaveRow(
                  from: 'Aug 5, 2025',
                  to: 'Aug 7, 2025',
                  reason: 'Medical Leave 3 Days',
                  approved: true,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Request Leave'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarFormat: CalendarFormat.month,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        holidayTextStyle: TextStyle(color: Colors.red),
        weekendTextStyle: TextStyle(color: Colors.redAccent),
      ),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        leftChevronIcon: Icon(Icons.chevron_left),
        rightChevronIcon: Icon(Icons.chevron_right),
      ),
      holidayPredicate: (day) => [10, 13].contains(day.day),
    );
  }
}

// ======================
// SECTION CARD WIDGET
// ======================

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ...items,
        ],
      ),
    );
  }
}

// ======================
// HOLIDAY / BIRTHDAY ROW
// ======================

class _IconRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _IconRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 25),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================
// LEAVE REQUEST ROW
// ======================

class _LeaveRow extends StatelessWidget {
  final String from;
  final String to;
  final String reason;
  final bool approved;

  const _LeaveRow({
    required this.from,
    required this.to,
    required this.reason,
    required this.approved,
  });

  @override
  Widget build(BuildContext context) {
    final statusIcon = Icon(
      approved ? Icons.check_circle : Icons.radio_button_unchecked,
      color: approved ? Colors.green : Colors.grey,
      size: 27,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$from - $to', style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(reason, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ],
            ),
          ),
          statusIcon,
        ],
      ),
    );
  }
}
