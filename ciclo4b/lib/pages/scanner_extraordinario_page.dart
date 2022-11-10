import 'package:ciclo4b/pages/widgets/cuerpo_scan.dart';
import 'package:flutter/material.dart';

class ScanExtraordinarioPage extends StatelessWidget {
  const ScanExtraordinarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff56509A), Color(0xff091A46)],
        begin: FractionalOffset(-0.2, 0.4),
        end: FractionalOffset(2, 1),
        stops: [-0.2, 0.5],
        transform: GradientRotation(0.2),
      ),
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: boxDecoration,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: CuerpoScan(
                imagen:'assets/codigo_qr.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
