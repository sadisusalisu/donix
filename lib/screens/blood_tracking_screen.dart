import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class BloodTrackingScreen extends StatelessWidget {
  const BloodTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Tracking'),
      ),
      drawer: AppDrawer(currentUserType: 'donor'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Blood Donation Tracking',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _buildDonationHistory(),
            const SizedBox(height: 24),
            _buildNextEligibleDate(),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationHistory() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Donation History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildDonationItem('City Hospital', 'March 15, 2023', 'Whole Blood'),
            const SizedBox(height: 8),
            _buildDonationItem('Red Cross Center', 'January 2, 2023', 'Plasma'),
            const SizedBox(height: 8),
            _buildDonationItem('Community Clinic', 'October 10, 2022', 'Platelets'),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationItem(String location, String date, String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('$date - $type'),
          ],
        ),
        Icon(Icons.check_circle, color: Colors.green),
      ],
    );
  }

  Widget _buildNextEligibleDate() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Next Eligible Donation Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('You are eligible to donate again on:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('June 15, 2023', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 16),
            Text('Remember to stay hydrated and eat a healthy meal before your next donation!'),
          ],
        ),
      ),
    );
  }
}

