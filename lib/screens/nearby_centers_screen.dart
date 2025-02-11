import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/app_drawer.dart';
import '../widgets/blood_drop_button.dart';

class NearbyCentersScreen extends StatefulWidget {
  const NearbyCentersScreen({Key? key}) : super(key: key);

  @override
  _NearbyCentersScreenState createState() => _NearbyCentersScreenState();
}

class _NearbyCentersScreenState extends State<NearbyCentersScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(9.0820, 8.6753); // Nigeria's center
  Set<Marker> _markers = {};
  bool _showingDonors = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('center1'),
          position: LatLng(9.0765, 7.3986),
          infoWindow: InfoWindow(title: 'Abuja Blood Center'),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('center2'),
          position: LatLng(6.5244, 3.3792),
          infoWindow: InfoWindow(title: 'Lagos Blood Bank'),
        ),
      );
    });
  }

  void _toggleDonors() {
    setState(() {
      _showingDonors = !_showingDonors;
      if (_showingDonors) {
        // Add mock donors (in real app, this would fetch from a backend)
        _markers.add(
          Marker(
            markerId: MarkerId('donor1'),
            position: LatLng(9.0800, 7.4000),
            infoWindow: InfoWindow(title: 'John (A+)'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          ),
        );
        _markers.add(
          Marker(
            markerId: MarkerId('donor2'),
            position: LatLng(6.5200, 3.3800),
            infoWindow: InfoWindow(title: 'Sarah (O-)'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          ),
        );
      } else {
        _markers.removeWhere((marker) => marker.markerId.value.startsWith('donor'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Centers & Donors'),
        elevation: 0,
      ),
      drawer: AppDrawer(currentUserType: 'individual'),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 7.0,
            ),
            markers: _markers,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: BloodDropButton(
              text: _showingDonors ? 'Hide Donors' : 'Show Nearby Donors',
              onPressed: _toggleDonors,
            ),
          ),
        ],
      ),
    );
  }
}

