import 'package:flutter/material.dart';

class CampaignManagementScreen extends StatelessWidget {
  const CampaignManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Campaign Management')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Create New Campaign'),
            trailing: Icon(Icons.add),
            onTap: () {
              // Navigate to campaign creation screen
            },
          ),
          ListTile(
            title: Text('Active Campaigns'),
            trailing: Text('3'),
            onTap: () {
              // Navigate to active campaigns list
            },
          ),
          ListTile(
            title: Text('Past Campaigns'),
            trailing: Text('10'),
            onTap: () {
              // Navigate to past campaigns list
            },
          ),
          ListTile(
            title: Text('Campaign Analytics'),
            trailing: Icon(Icons.bar_chart),
            onTap: () {
              // Navigate to campaign analytics screen
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create new campaign
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

