import 'package:flutter/material.dart';

import 'package:ciclo4b/auth/repository/auth_repository.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _header(),
                _Formulario(),
                _botton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Stack(
      children: [
        Image.asset(
          'assets/login.png',
          fit: BoxFit.scaleDown,
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

  Widget _botton(BuildContext context) {
    final AuthRepository user = AuthRepository();
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          height: 172,
          child: Image.asset(
            'assets/login3.png',
            fit: BoxFit.cover,
          ),
        ),
        Image.asset(
          'assets/login5.png',
          fit: BoxFit.cover,
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
            onTap: () async {
              await user.signInWithGoogle(context: context);
              Navigator.pushNamed(context, 'opcion_scan_page');
            },
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
              child: const Text('Olvidaste la contraseña?'),
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
        labelText: 'Correo Electrónico',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El correo electrónico es Obligatorio';
        }
        if (!value.contains('@') || !value.contains('.')) {
          return 'El correo es inválido';
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
        labelText: 'Contraseña',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        //TODO: Preguntar que  no esta validando esta condicion
        // if (value!.length > 6) {
        //   return "Debe contener al menos 6 caracteres";
        // }
        if (value == null || value.isEmpty) {
          return 'La contraseña es Obligatoria';
        }

        return null;
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
          // TODO: Validar usuario y contraseña  en BD

          //Navigator.pushNamed(context, 'opcion_scan_page');
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
