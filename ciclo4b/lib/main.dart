import 'package:flutter/material.dart';

import 'package:ciclo4b/pages/login_page.dart';
import 'package:ciclo4b/pages/opcion_scan_page.dart';

void main() => runApp(const MyApp());

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
        'opcion_scan_page': (_) => OpcionScanPage(),
      },
    );
  }
}
