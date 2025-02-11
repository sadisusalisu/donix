import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class DonorManagementScreen extends StatelessWidget {
  const DonorManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Management'),
      ),
      drawer: AppDrawer(currentUserType: 'ngo'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donor Management',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _buildDonorSearch(),
            const SizedBox(height: 24),
            _buildDonorList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorSearch() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search Donors', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter donor name or ID',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement donor search
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Donor List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildDonorItem('John Doe', 'A+', '5 donations'),
            const SizedBox(height: 8),
            _buildDonorItem('Jane Smith', 'O-', '3 donations'),
            const SizedBox(height: 8),
            _buildDonorItem('Mike Johnson', 'B+', '7 donations'),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorItem(String name, String bloodType, String donations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Blood Type: $bloodType • $donations'),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement view donor details
          },
          child: Text('View Details'),
        ),
      ],
    );
  }
}

