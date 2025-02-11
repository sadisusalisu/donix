import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({Key? key}) : super(key: key);

  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  List<bool> _availability = List.generate(7, (_) => false);
  List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Availability'),
      ),
      drawer: AppDrawer(currentUserType: 'donor'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set Your Availability',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Select the days you are available for blood donation:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(_days[index]),
                  value: _availability[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _availability[index] = value!;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveAvailability,
              child: Text('Save Availability'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveAvailability() {
    // TODO: Implement saving availability to backend
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Availability saved successfully')),
    );
  }
}

