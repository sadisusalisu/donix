import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donix/theme_provider.dart';

class AppDrawer extends StatelessWidget {
  final String currentUserType;

  const AppDrawer({Key? key, required this.currentUserType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Donix',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/${currentUserType}_dashboard');
            },
          ),

          // Individual User Options
          if (currentUserType == 'individual') ...[
            _buildDrawerItem(context, Icons.person, 'Profile', '/profile'),
            _buildDrawerItem(context, Icons.favorite, 'Donate', '/donate'),
            _buildDrawerItem(context, Icons.local_hospital, 'Request Blood', '/request_blood'),
            _buildDrawerItem(context, Icons.location_on, 'Nearby Centers', '/nearby_centers'),
            _buildDrawerItem(context, Icons.chat, 'Chat Support', '/chat_support'),
            _buildDrawerItem(context, Icons.star, 'Rewards', '/rewards'),
          ],

          // Hospital User Options
          if (currentUserType == 'hospital') ...[
            _buildDrawerItem(context, Icons.inventory, 'Inventory', '/inventory'),
          ],

          // NGO User Options
          if (currentUserType == 'ngo') ...[
            _buildDrawerItem(context, Icons.event, 'Organize Drive', '/organize_drive'),
          ],

          // Admin User Options
          if (currentUserType == 'admin') ...[
            _buildDrawerItem(context, Icons.admin_panel_settings, 'User Management', '/user_management'),
            _buildDrawerItem(context, Icons.analytics, 'Analytics', '/analytics'),
          ],

          // Common Options for All Users
          _buildDrawerItem(context, Icons.book, 'Educational Resources', '/educational_resources'),
          _buildDrawerItem(context, Icons.feedback, 'Provide Feedback', '/feedback'),

          const Divider(),

          // Logout
          _buildDrawerItem(context, Icons.exit_to_app, 'Logout', '/login', isLogout: true),

          // Toggle Theme
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Toggle Theme'),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      onTap: () {
        if (isLogout) {
          Navigator.pushReplacementNamed(context, route);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
