import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  final List<Map<String, dynamic>> _users = [
    {'name': 'John Doe', 'role': 'Donor', 'isActive': true},
    {'name': 'City Hospital', 'role': 'Hospital', 'isActive': true},
    {'name': 'Blood Donors Association', 'role': 'NGO', 'isActive': false},
  ];
  final List<Map<String, dynamic>> _filteredUsers = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredUsers.addAll(_users);
  }

  void _filterUsers(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      _filteredUsers.clear();
      _filteredUsers.addAll(_users.where((user) =>
      user['name'].toLowerCase().contains(query.toLowerCase()) ||
          user['role'].toLowerCase().contains(query.toLowerCase())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Management')),
      drawer: AppDrawer(currentUserType: 'admin'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User Management',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            _buildUserSearch(),
            const SizedBox(height: 24),
            _buildUserList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserSearch() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: _isSearching
            ? [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          )
        ]
            : [],
      ),
      child: Card(
        elevation: _isSearching ? 4 : 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Search Users',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                onChanged: _filterUsers,
                decoration: InputDecoration(
                  hintText: 'Enter username or email',
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _filteredUsers.isEmpty
                  ? Center(
                key: ValueKey('empty'),
                child: Text('No users found',
                    style: TextStyle(color: Colors.grey)),
              )
                  : Column(
                key: ValueKey('list'),
                children: _filteredUsers
                    .map((user) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildUserItem(user),
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserItem(Map<String, dynamic> user) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user['name'], style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Role: ${user['role']} • ${user['isActive'] ? 'Active' : 'Inactive'}'),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }
}
