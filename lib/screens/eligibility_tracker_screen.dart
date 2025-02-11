import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EligibilityTrackerScreen extends StatelessWidget {
  const EligibilityTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data - replace with actual user data in a real app
    final lastDonationDate = DateTime(2023, 5, 1);
    final nextEligibleDate = lastDonationDate.add(const Duration(days: 56));
    final daysUntilEligible = nextEligibleDate.difference(DateTime.now()).inDays;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eligibility Tracker'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Donation Status',
                style: Theme.of(context).textTheme.headlineSmall,
              ).animate().fadeIn().slideX(),
              const SizedBox(height: 24),
              _buildStatusCard(context, daysUntilEligible),
              const SizedBox(height: 24),
              Text(
                'Donation History',
                style: Theme.of(context).textTheme.titleLarge,
              ).animate().fadeIn(delay: 300.ms),
              const SizedBox(height: 16),
              _buildDonationHistoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, int daysUntilEligible) {
    final isEligible = daysUntilEligible <= 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              isEligible ? Icons.check_circle : Icons.access_time,
              size: 64,
              color: isEligible ? Colors.green : Colors.orange,
            ).animate().scale(),
            const SizedBox(height: 16),
            Text(
              isEligible ? 'You are eligible to donate!' : 'Next donation in',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            if (!isEligible)
              Text(
                '$daysUntilEligible days',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isEligible ? () {
                // Navigate to donation scheduling screen
              } : null,
              child: Text(isEligible ? 'Schedule Donation' : 'Not Eligible Yet'),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).scale();
  }

  Widget _buildDonationHistoryList() {
    // Mock data - replace with actual user data in a real app
    final donationHistory = [
      {'date': '2023-05-01', 'location': 'Central Hospital'},
      {'date': '2023-02-15', 'location': 'Community Blood Drive'},
      {'date': '2022-11-30', 'location': 'Red Cross Center'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: donationHistory.length,
      itemBuilder: (context, index) {
        final donation = donationHistory[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.bloodtype, color: Colors.white),
          ),
          title: Text('Donation at ${donation['location']}'),
          subtitle: Text(donation['date']!),
        ).animate().fadeIn(delay: (index * 100 + 400).ms).slideX();
      },
    );
  }
}

