import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class DonorDashboard extends StatelessWidget {
  const DonorDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Dashboard'),
      ),
      drawer: AppDrawer(currentUserType: 'donor'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, John Donor!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _buildDonationStats(),
            const SizedBox(height: 24),
            _buildUpcomingDrives(),
            const SizedBox(height: 24),
            _buildRecentDonations(),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationStats() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Donation Stats', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Total Donations', '8'),
                _buildStatItem('Lives Saved', '24'),
                _buildStatItem('Last Donation', '2 months ago'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildUpcomingDrives() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upcoming Blood Drives', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildDriveItem('City Hospital', 'May 15, 2023', '2.5 km away'),
            const SizedBox(height: 8),
            _buildDriveItem('Red Cross Center', 'May 22, 2023', '5 km away'),
          ],
        ),
      ),
    );
  }

  Widget _buildDriveItem(String location, String date, String distance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('$date • $distance'),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement registration logic
          },
          child: Text('Register'),
        ),
      ],
    );
  }

  Widget _buildRecentDonations() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Donations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildDonationItem('City Hospital', 'March 10, 2023'),
            const SizedBox(height: 8),
            _buildDonationItem('Red Cross Center', 'January 5, 2023'),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationItem(String location, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(date),
          ],
        ),
        Icon(Icons.check_circle, color: Colors.green),
      ],
    );
  }
}

