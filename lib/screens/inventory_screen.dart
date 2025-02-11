import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Inventory'),
      ),
      drawer: AppDrawer(currentUserType: 'hospital'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Blood Inventory Management',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _buildInventoryOverview(),
            const SizedBox(height: 24),
            _buildLowStockAlert(),
            const SizedBox(height: 24),
            _buildRecentTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryOverview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Inventory', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBloodTypeItem('A-', 20),
                _buildBloodTypeItem('B-', 10),
                _buildBloodTypeItem('O-', 40),
                _buildBloodTypeItem('AB-', 5),
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

  Widget _buildLowStockAlert() {
    return Card(
      color: Colors.yellow[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Low Stock Alert', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 16),
            Text('The following blood types are running low:'),
            const SizedBox(height: 8),
            Text('• B- (10 units)', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• AB- (5 units)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement request blood logic
              },
              child: Text('Request Blood'),
            ),
          ],
        ),
      ),
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
            const SizedBox(height: 8),
            _buildTransactionItem('Received', 'B+', 15, 'Community Blood Bank'),
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

