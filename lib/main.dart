import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/individual_dashboard.dart';
import 'screens/hospital_dashboard.dart';
import 'screens/ngo_dashboard.dart';
import 'screens/admin_dashboard.dart';
import 'screens/donate_screen.dart';
import 'screens/request_blood_screen.dart';
import 'screens/nearby_centers_screen.dart';
import 'screens/chat_support_screen.dart';
import 'screens/rewards_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/organize_drive_screen.dart';
import 'screens/user_management_screen.dart';
import 'screens/donation_scheduling_screen.dart';
import 'screens/educational_resources_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/availability_screen.dart'; // Import the new screen
import 'screens/blood_tracking_screen.dart'; // Import the new screen
import 'screens/profile_screen.dart'; // Import the new screen
import 'screens/notifications_screen.dart'; // Import the new screen
import 'screens/eligibility_tracker_screen.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const DonixApp(),
    ),
  );
}

class DonixApp extends StatelessWidget {
  const DonixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Donix Blood Donation',
          theme: themeProvider.currentTheme,
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/individual_dashboard': (context) => const IndividualDashboard(),
            '/hospital_dashboard': (context) => const HospitalDashboard(),
            '/ngo_dashboard': (context) => const NGODashboard(),
            '/admin_dashboard': (context) => const AdminDashboard(),
            '/donate': (context) => const DonateScreen(),
            '/request_blood': (context) => const RequestBloodScreen(),
            '/nearby_centers': (context) => const NearbyCentersScreen(),
            '/chat_support': (context) => const ChatSupportScreen(),
            '/rewards': (context) => const RewardsScreen(),
            '/inventory': (context) => const InventoryScreen(),
            '/organize_drive': (context) => const OrganizeDriveScreen(),
            '/user_management': (context) => const UserManagementScreen(),
            '/donation_scheduling': (context) => const DonationSchedulingScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/notifications': (context) => const NotificationsScreen(),
            '/eligibility_tracker': (context) => const EligibilityTrackerScreen(),
            '/availability': (context) => const AvailabilityScreen(),
            '/blood_tracking': (context) => const BloodTrackingScreen(),
          },
        );
      },
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData(
    primaryColor: Color(0xFFE53935),
    hintColor: Color(0xFFFFCDD2),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Color(0xFFE53935), systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Color(0xFFE53935),
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: Color(0xFFE53935), fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme.brightness == Brightness.light
        ? ThemeData.dark().copyWith(
      primaryColor: Color(0xFFE53935),
      hintColor: Color(0xFFFFCDD2),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Color(0xFFE53935), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Color(0xFFE53935),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(color: Color(0xFFE53935), fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.white),
      ),
    )
        : ThemeData(
      primaryColor: Color(0xFFE53935),
      hintColor: Color(0xFFFFCDD2),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Color(0xFFE53935), systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Color(0xFFE53935),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(color: Color(0xFFE53935), fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );
    notifyListeners();
  }
}

