import 'package:ciclo4b/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:ciclo4b/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CES APP',
      home: LoginPage(),
      routes: {
        'login_page': (_) => LoginPage(),
        'opcion_scan_page': (_) => const OpcionScanPage(),
        'scanner_ordinario_page': (_) => const ScanOrdinarioPage(),
        'scanner_extraordinario_page': (_) => const ScanExtraordinarioPage(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.authStateChanges();

    if (firebaseUser != null) {
      return const OpcionScanPage();
    }
    return LoginPage();
  }
}
