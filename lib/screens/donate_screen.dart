import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/blood_drop_button.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedCenter = 'City Hospital';
  String selectedDonationType = 'Whole Blood';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Blood'),
        elevation: 0,
      ),
      drawer: AppDrawer(currentUserType: 'individual'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule a Donation',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  _buildDatePicker(),
                  const SizedBox(height: 20),
                  _buildCenterDropdown(),
                  const SizedBox(height: 20),
                  _buildDonationTypeSelection(),
                  const SizedBox(height: 30),
                  Center(
                    child: BloodDropButton(
                      text: 'Schedule Donation',
                      onPressed: _scheduleDonation,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Text(
        'Your donation can save up to 3 lives!',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Select Date',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Donation Center',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      value: selectedCenter,
      onChanged: (String? newValue) {
        setState(() {
          selectedCenter = newValue!;
        });
      },
      items: <String>['City Hospital', 'Red Cross Center', 'Community Clinic']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildDonationTypeSelection() {
    List<String> donationTypes = ['Whole Blood', 'Plasma', 'Platelets'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Donation Type',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: donationTypes.map((type) {
            return ChoiceChip(
              label: Text(type),
              selected: selectedDonationType == type,
              onSelected: (bool selected) {
                if (selected) {
                  setState(() {
                    selectedDonationType = type;
                  });
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _scheduleDonation() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Donation scheduled successfully!\nDate: ${selectedDate.toLocal().toString().split(' ')[0]}\nCenter: $selectedCenter\nType: $selectedDonationType',
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
