import 'package:flutter/material.dart';

import 'package:ciclo4b/widgets/widgets.dart';

class OpcionScanPage extends StatelessWidget {
  const OpcionScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _header(context),
          Container(
              margin: const EdgeInsets.only(left: 11),
              child: _botonIngresarExtraordinario(context)),
          _botton(),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/opciones_scan_cabeza.png',
          fit: BoxFit.scaleDown,
        ),
        const Positioned(top: 25, left: 5, child: IconoAtras()),
        Positioned(top: 140, right: 80, child: _textoIngreso()),
        Positioned(
            bottom: 50, right: 25, child: _botonIngresarOrdinario(context)),
      ],
    );
  }

  Widget _textoIngreso() {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffE0A643), Color(0xff94620F)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        'Bienvenido',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 45,
          foreground: Paint()..shader = linearGradient,
        ),
      ),
    );
  }

  Widget _botonIngresarOrdinario(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Color(0xffF77F34)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {
        // if (formKey.currentState!.validate()) {

        //   Navigator.pushNamed(context, 'opcion_scan_page');
        // }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 74, vertical: 21),
        child: Text(
          'Ingreso Ordinario',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _botonIngresarExtraordinario(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Color(0xff56509A)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {
        // if (formKey.currentState!.validate()) {

        //   Navigator.pushNamed(context, 'opcion_scan_page');
        // }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 52, vertical: 21),
        child: Text(
          'Ingreso Extraordinario',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _botton() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        child: Image.asset(
          'assets/opciones_scan_pie.png',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
