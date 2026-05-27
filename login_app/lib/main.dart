import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(KosanApp());
}

class KosanApp extends StatelessWidget {
  const KosanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MYKOS',
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        //  3 Routes
        '/login': (context) => LoginScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
