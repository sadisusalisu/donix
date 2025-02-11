import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        elevation: 0,
      ),
      drawer: AppDrawer(currentUserType: 'individual'),
      body: ListView(
        children: [
          _buildNotificationItem(
            context,
            'Upcoming Donation',
            'You have a scheduled donation tomorrow at 10:00 AM.',
            Icons.event,
          ),
          _buildNotificationItem(
            context,
            'Blood Request',
            'Urgent A+ blood needed at City Hospital.',
            Icons.local_hospital,
          ),
          _buildNotificationItem(
            context,
            'Reward Earned',
            'You\'ve earned 100 points for your recent donation!',
            Icons.star,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context, String title, String message, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
      subtitle: Text(message),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // TODO: Implement notification action
      },
    );
  }
}

