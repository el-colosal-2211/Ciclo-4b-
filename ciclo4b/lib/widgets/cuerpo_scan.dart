import 'package:flutter/material.dart';

import 'package:ciclo4b/widgets/icono_atras.dart';

class CuerpoScan extends StatelessWidget {
  final String imagen;
  final String texto;
  const CuerpoScan({super.key, required this.imagen, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cabecera(),
        const SizedBox(
          height: 120,
        ),
        _cuepoCentral(context)
      ],
    );
  }

  Widget _cabecera() {
    return Row(
      children: [
        const IconoAtras(),
        const SizedBox(width: 35.0),
        Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 22.0,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _cuepoCentral(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Scanea el código QR',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Image.asset(imagen),
        const SizedBox(height: 20),
        const Text(
          'El código QR se detectará automáticamente cuando lo coloca entre las líneas de guía',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        //_botonScanear(context),
      ],
    );
  }

  // Widget _botonScanear(BuildContext context) {
  //   return ElevatedButton(
  //     style: ButtonStyle(
  //       backgroundColor: const MaterialStatePropertyAll(Color(0xffff9610)),
  //       shape: MaterialStateProperty.all(
  //         RoundedRectangleBorder(
  //           // Change your radius here
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //       ),
  //     ),
  //     onPressed: () {
  //       // if (formKey.currentState!.validate()) {

  //       //   Navigator.pushNamed(context, 'opcion_scan_page');
  //       // }
  //     },
  //     child: const Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
  //       child: Text(
  //         'Scanear QR',
  //         style: TextStyle(fontSize: 15.0),
  //       ),
  //     ),
  //   );
  // }
}
