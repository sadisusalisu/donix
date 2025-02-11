import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class EducationalResourcesScreen extends StatelessWidget {
  const EducationalResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Resources'),
        elevation: 0,
      ),
      drawer: AppDrawer(currentUserType: 'individual'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildResourceCard(
            context,
            'Benefits of Blood Donation',
            'Learn about the health benefits of regular blood donation.',
            Icons.favorite,
                () {
              // TODO: Navigate to detailed view
            },
          ),
          _buildResourceCard(
            context,
            'Blood Types Explained',
            'Understand different blood types and their compatibility.',
            Icons.science,
                () {
              // TODO: Navigate to detailed view
            },
          ),
          _buildResourceCard(
            context,
            'Donation Process',
            'Step-by-step guide to the blood donation process.',
            Icons.timeline,
                () {
              // TODO: Navigate to detailed view
            },
          ),
          _buildResourceCard(
            context,
            'Eligibility Criteria',
            'Check if you\'re eligible to donate blood.',
            Icons.check_circle,
                () {
              // TODO: Navigate to detailed view
            },
          ),
          _buildResourceCard(
            context,
            'Post-Donation Care',
            'Tips for taking care of yourself after donating blood.',
            Icons.healing,
                () {
              // TODO: Navigate to detailed view
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(
      BuildContext context, String title, String description, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
