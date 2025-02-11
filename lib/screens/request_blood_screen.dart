import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({Key? key}) : super(key: key);

  @override
  _RequestBloodScreenState createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  final _formKey = GlobalKey<FormState>();
  String _bloodType = 'A+';
  int _units = 1;
  String _hospital = '';
  String _reason = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Blood'),
      ),
      drawer: AppDrawer(currentUserType: 'individual'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blood Request Form',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              _buildBloodTypeDropdown(),
              const SizedBox(height: 16),
              _buildUnitsInput(),
              const SizedBox(height: 16),
              _buildHospitalInput(),
              const SizedBox(height: 16),
              _buildReasonInput(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitRequest,
                child: Text('Submit Request'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBloodTypeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Blood Type',
        border: OutlineInputBorder(),
      ),
      value: _bloodType,
      onChanged: (String? newValue) {
        setState(() {
          _bloodType = newValue!;
        });
      },
      items: <String>['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildUnitsInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Units Required',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the number of units';
        }
        return null;
      },
      onSaved: (value) => _units = int.parse(value!),
    );
  }

  Widget _buildHospitalInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Hospital Name',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the hospital name';
        }
        return null;
      },
      onSaved: (value) => _hospital = value!,
    );
  }

  Widget _buildReasonInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Reason for Request',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the reason for the request';
        }
        return null;
      },
      onSaved: (value) => _reason = value!,
    );
  }

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Implement request submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Blood request submitted successfully')),
      );
    }
  }
}

