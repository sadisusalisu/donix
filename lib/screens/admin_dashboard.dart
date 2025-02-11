import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:donix/screens/user_management_screen.dart';
import 'package:donix/screens/notifications_screen.dart';
import 'package:donix/screens/settings_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  bool isDarkMode = false;
  String searchQuery = "";
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadDarkModePreference();
  }

  void _loadDarkModePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  void _toggleDarkMode() async {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', isDarkMode);
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Donation Dashboard'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: _toggleDarkMode,
          ),
        ],
      ),
      drawer: _AdminDrawer(),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          _DashboardScreen(searchQuery: searchQuery, onSearchChanged: updateSearchQuery),
          NotificationsScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Admin"),
            accountEmail: Text("admin@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.redAccent),
            ),
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          ListTile(leading: Icon(Icons.dashboard, color: Colors.red), title: Text('Dashboard'), onTap: () {}),
          ListTile(leading: Icon(Icons.person, color: Colors.red), title: Text('User Management'), onTap: () {}),
          ListTile(leading: Icon(Icons.notifications, color: Colors.red), title: Text('Notifications'), onTap: () {}),
          ListTile(leading: Icon(Icons.settings, color: Colors.red), title: Text('Settings'), onTap: () {}),
          Divider(),
          ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text('Logout'), onTap: () {}),
        ],
      ),
    );
  }
}

class _DashboardScreen extends StatelessWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  const _DashboardScreen({required this.searchQuery, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search donations or users...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 24),
          _OverviewStats(),
          const SizedBox(height: 24),
          _RecentActivities(searchQuery: searchQuery),
        ],
      ),
    );
  }
}

class _OverviewStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Donation Analytics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [FlSpot(0, 10), FlSpot(1, 50), FlSpot(2, 80), FlSpot(3, 150), FlSpot(4, 120)],
                      isCurved: true,
                      color: Colors.red,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: true, color: Colors.red.withOpacity(0.3)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentActivities extends StatelessWidget {
  final String searchQuery;
  const _RecentActivities({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(leading: Icon(Icons.history, color: Colors.red), title: Text('John Doe donated blood'), subtitle: Text('2 hours ago')),
            ListTile(leading: Icon(Icons.history, color: Colors.red), title: Text('Jane Smith registered as donor'), subtitle: Text('1 day ago')),
          ],
        ),
      ),
    );
  }
}
