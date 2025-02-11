import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class HospitalDashboard extends StatelessWidget {
  const HospitalDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Dashboard'),
      ),
      drawer: AppDrawer(currentUserType: 'hospital'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, City Hospital',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _buildBloodInventory(),
            const SizedBox(height: 24),
            _buildPendingRequests(),
            const SizedBox(height: 24),
            _buildRecentTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodInventory() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Blood Inventory', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBloodTypeItem('A+', 50),
                _buildBloodTypeItem('B+', 30),
                _buildBloodTypeItem('O+', 80),
                _buildBloodTypeItem('AB+', 15),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodTypeItem(String bloodType, int units) {
    return Column(
      children: [
        Text(bloodType, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('$units units', style: TextStyle(fontSize: 14, color: units < 20 ? Colors.red : Colors.green)),
      ],
    );
  }

  Widget _buildPendingRequests() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pending Blood Requests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildRequestItem('Emergency Surgery', 'O-', 3, 'High'),
            const SizedBox(height: 8),
            _buildRequestItem('Scheduled Transfusion', 'A+', 2, 'Medium'),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestItem(String title, String bloodType, int units, String urgency) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('$bloodType • $units units • Urgency: $urgency'),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement fulfillment logic
          },
          child: Text('Fulfill'),
        ),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTransactionItem('Received', 'A+', 10, 'Red Cross Center'),
            const SizedBox(height: 8),
            _buildTransactionItem('Sent', 'O-', 5, 'General Hospital'),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String type, String bloodType, int units, String partner) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$type $units units of $bloodType', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(partner),
          ],
        ),
        Icon(type == 'Received' ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.blue),
      ],
    );
  }
}

