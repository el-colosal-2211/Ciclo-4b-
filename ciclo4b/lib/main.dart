import 'package:ciclo4b/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ciclo4b/pages/login_page.dart';
import 'package:ciclo4b/pages/opcion_scan_page.dart';

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
      initialRoute: 'login_page',
      routes: {
        'login_page': (_) => const LoginPage(),
        'opcion_scan_page': (_) => const OpcionScanPage(),
      },
    );
  }
}
