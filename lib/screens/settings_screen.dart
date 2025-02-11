import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart'; // Ensure ThemeProvider is imported correctly

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _buildSettingsOption(
            context,
            icon: Icons.person,
            title: 'Profile Settings',
            onTap: () => Navigator.pushNamed(context, '/profile_settings'),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.notifications,
            title: 'Notification Preferences',
            onTap: () => Navigator.pushNamed(context, '/notification_preferences'),
          ),
          _buildThemeToggle(context, themeProvider),
          _buildSettingsOption(
            context,
            icon: Icons.lock,
            title: 'Privacy & Security',
            onTap: () => Navigator.pushNamed(context, '/privacy_security'),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () => Navigator.pushNamed(context, '/help_support'),
          ),
        ],
      ),
    );
  }

  // Reusable method for settings options
  Widget _buildSettingsOption(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  // Theme toggle switch
  Widget _buildThemeToggle(BuildContext context, ThemeProvider themeProvider) {
    return ListTile(
      leading: const Icon(Icons.dark_mode, color: Colors.black87),
      title: const Text('Theme Mode'),
      trailing: Switch(
        value: themeProvider.currentTheme.brightness == Brightness.dark,
        onChanged: (value) => themeProvider.toggleTheme(),
      ),
    );
  }
}
