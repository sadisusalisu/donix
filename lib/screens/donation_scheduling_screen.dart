import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/blood_drop_button.dart';
import '../widgets/app_drawer.dart';

class DonationSchedulingScreen extends StatefulWidget {
  const DonationSchedulingScreen({Key? key}) : super(key: key);

  @override
  _DonationSchedulingScreenState createState() => _DonationSchedulingScreenState();
}

class _DonationSchedulingScreenState extends State<DonationSchedulingScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedCenter = 'City Hospital';
  String selectedDonationType = 'Whole Blood';

  final List<String> donationCenters = [
    'City Hospital',
    'Red Cross Center',
    'Community Clinic',
    'Mobile Donation Unit'
  ];

  final List<String> donationTypes = [
    'Whole Blood',
    'Plasma',
    'Platelets',
    'Double Red Cells'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Donation'),
        elevation: 0,
      ),
      drawer: AppDrawer(currentUserType: 'individual'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule Your Next Donation',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20),
            _buildDatePicker(context),
            SizedBox(height: 20),
            _buildTimePicker(context),
            SizedBox(height: 20),
            _buildCenterDropdown(),
            SizedBox(height: 20),
            _buildDonationTypeDropdown(),
            SizedBox(height: 30),
            BloodDropButton(
              text: 'Schedule Donation',
              onPressed: _scheduleAppointment,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () => _selectDate(context),
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('MMM dd, yyyy').format(selectedDate)),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Time',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () => _selectTime(context),
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedTime.format(context)),
                Icon(Icons.access_time),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCenterDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Donation Center',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          value: selectedCenter,
          items: donationCenters.map((String center) {
            return DropdownMenuItem<String>(
              value: center,
              child: Text(center),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCenter = newValue!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDonationTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Donation Type',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          value: selectedDonationType,
          items: donationTypes.map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedDonationType = newValue!;
            });
          },
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _scheduleAppointment() {
    // TODO: Implement appointment scheduling logic
    String appointmentDetails = '''
      Date: ${DateFormat('MMM dd, yyyy').format(selectedDate)}
      Time: ${selectedTime.format(context)}
      Center: $selectedCenter
      Donation Type: $selectedDonationType
    ''';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment Scheduled'),
          content: Text('Your appointment has been scheduled:\n\n$appointmentDetails'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/individual_dashboard');
              },
            ),
          ],
        );
      },
    );
  }
}

