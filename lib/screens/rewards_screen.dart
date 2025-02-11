import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Rewards',
                style: Theme.of(context).textTheme.headlineSmall,
              ).animate().fadeIn().moveY(begin: 50, end: 0),
              const SizedBox(height: 16),
              _buildPointsCard(context),
              const SizedBox(height: 24),
              Text(
                'Available Rewards',
                style: Theme.of(context).textTheme.titleLarge,
              ).animate().fadeIn(delay: 400.ms),
              const SizedBox(height: 16),
              _buildRewardCard(
                context,
                'Free Coffee',
                '100 points',
                Icons.local_cafe,
              ),
              _buildRewardCard(
                context,
                'Movie Ticket',
                '300 points',
                Icons.movie,
              ),
              _buildRewardCard(
                context,
                'Restaurant Voucher',
                '500 points',
                Icons.restaurant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPointsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 48,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Points',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '500',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).scale();
  }

  Widget _buildRewardCard(BuildContext context, String title, String points, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        subtitle: Text(points),
        trailing: ElevatedButton(
          onPressed: () {
            // Redeem reward
          },
          child: const Text('Redeem'),
        ),
      ),
    ).animate().fadeIn(delay: 600.ms).moveX(begin: 50, end: 0);
  }
}

