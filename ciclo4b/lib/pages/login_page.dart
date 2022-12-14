import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _Formulario(),
            _botton(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Image.asset(
            'assets/login2.png',
            fit: BoxFit.scaleDown,
          ),
        ),
        // ClipRRect(
        //   child: Flexible(
        //     child: Image.asset(
        //       'assets/login4.png',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Image.asset(
          'assets/login1.png',
          fit: BoxFit.contain,
        ),
        Positioned(bottom: 0, right: 185, child: _textoIngreso())
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
        'Ingresar',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 45,
          foreground: Paint()..shader = linearGradient,
        ),
      ),
    );
  }

  Widget _botton() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          height: 170,
          child: Image.asset(
            'assets/login3.png',
            fit: BoxFit.scaleDown,
          ),
        ),
        Image.asset(
          'assets/login5.png',
          fit: BoxFit.contain,
        ),
        const Positioned(
          top: 0,
          right: 100,
          child: Text('tambien puedes ingresar con'),
        ),
        Positioned(
          top: 30,
          right: 160,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: 50.0,
              child: Image.asset('assets/google.png'),
            ),
          ),
        ),
      ],
    );
  }
}

class _Formulario extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  //
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          children: [
            _campoCorreoElectronico(),
            const SizedBox(height: 15.0),
            _campoClave(),
            TextButton(
              onPressed: () {},
              child: const Text('Olvidate la contrase??a?'),
            ),
            _botonIngresar(context),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _campoCorreoElectronico() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red, width: 2)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        labelText: 'Correo Electronico',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El correo electronico es Obligatorio';
        }
        if (!value.contains('@') && !value.contains('.')) {
          return 'El correo no es valido';
        }
        return null;
      },
    );
  }

  Widget _campoClave() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red, width: 2)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: Colors.black,
        ),
        labelText: 'Contrase??a',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'La contrase??a es Obligatorio';
        }
        //TODO: Preguntar que  no esta validando esta condicion
        if (value.length == 6) {
          return "Debe contener 6 caracteres";
        }
      },
    );
  }

  Widget _botonIngresar(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Color(0xffE18519)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // TODO: Validar usuario y contrase??a  en BD

          Navigator.pushNamed(context, 'opcion_scan_page');
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 90),
        child: Text(
          'Ingresar',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
