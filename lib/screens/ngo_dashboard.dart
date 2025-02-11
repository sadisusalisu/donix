import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../widgets/app_drawer.dart';
import '../widgets/stat_card.dart';
import '../theme/app_theme.dart';

class NGODashboard extends StatelessWidget {
  const NGODashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NGO Dashboard'),
        backgroundColor: AppTheme.primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              _showDonorRegistrationForm(context);
            },
          ),
        ],
      ),
      drawer: AppDrawer(currentUserType: 'ngo'),
      body: AnimationLimiter(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                _buildDriveStats(context),
                const SizedBox(height: 24),
                _buildUpcomingDrives(),
                const SizedBox(height: 24),
                _buildDonorEngagement(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDonorRegistrationForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Register Donor'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: InputDecoration(labelText: 'Donor Name')),
              TextField(decoration: InputDecoration(labelText: 'Blood Type')),
              TextField(decoration: InputDecoration(labelText: 'Last Donation Date')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement donor registration logic
                Navigator.pop(context);
              },
              child: Text('Register'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDriveStats(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigating to detailed stats...')),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Blood Drive Statistics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatCard(label: 'Total Drives', value: '24', color: AppTheme.primaryColor, icon: Icons.event),
                    const SizedBox(width: 8),
                    StatCard(label: 'Donors Reached', value: '1,200', color: AppTheme.secondaryColor, icon: Icons.people),
                    const SizedBox(width: 8),
                    StatCard(label: 'Units Collected', value: '950', color: Colors.green, icon: Icons.bloodtype),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingDrives() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upcoming Blood Drives', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildDriveItem('City Hospital', 'May 15, 2025', 100),
            const SizedBox(height: 8),
            _buildDriveItem('University Campus', 'May 22, 2025', 150),
          ],
        ),
      ),
    );
  }

  Widget _buildDriveItem(String location, String date, int targetDonors) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppTheme.primaryColor,
        child: Icon(Icons.event, color: Colors.white),
      ),
      title: Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$date • Target: $targetDonors donors'),
      trailing: ElevatedButton(
        onPressed: () {
          // TODO: Implement drive management logic
        },
        child: Text('Manage'),
      ),
    );
  }

  Widget _buildDonorEngagement() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Donor Engagement', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildEngagementItem('New Donors This Month', '45'),
            const SizedBox(height: 8),
            _buildEngagementItem('Repeat Donors', '78%'),
            const SizedBox(height: 8),
            _buildEngagementItem('Awareness Campaigns', '3 active'),
          ],
        ),
      ),
    );
  }

  Widget _buildEngagementItem(String label, String value) {
    return ListTile(
      title: Text(label),
      trailing: Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
    );
  }
}
