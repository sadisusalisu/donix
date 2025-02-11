import 'package:flutter/material.dart';

class EligibilityCheckScreen extends StatefulWidget {
  const EligibilityCheckScreen({Key? key}) : super(key: key);

  @override
  _EligibilityCheckScreenState createState() => _EligibilityCheckScreenState();
}

class _EligibilityCheckScreenState extends State<EligibilityCheckScreen> {
  final List<Map<String, dynamic>> _questions = [
    {'question': 'Are you feeling well today?', 'answer': null},
    {'question': 'Have you donated blood in the last 8 weeks?', 'answer': null},
    {'question': 'Are you currently taking any medication?', 'answer': null},
    {'question': 'Have you had any recent surgeries?', 'answer': null},
    {'question': 'Are you pregnant or have you given birth in the last 6 months?', 'answer': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eligibility Check')),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_questions[index]['question']),
            trailing: Switch(
              value: _questions[index]['answer'] ?? false,
              onChanged: (bool value) {
                setState(() {
                  _questions[index]['answer'] = value;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkEligibility,
        child: Icon(Icons.check),
      ),
    );
  }

  void _checkEligibility() {
    bool isEligible = _questions.every((q) => q['answer'] == false);
    if (isEligible) {
      Navigator.pushNamed(context, '/enhanced_donate');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Eligibility Result'),
          content: Text('Based on your responses, you may not be eligible to donate at this time. Please consult with a healthcare professional for more information.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

