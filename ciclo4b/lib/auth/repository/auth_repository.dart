import 'package:ciclo4b/auth/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {

  // Determine si el usuatio esta autenticado

  final authentication = FirebaseAuth.instance;
  User? user;

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        // Once signed in, return the UserCredential
        UserCredential userCredential =
            await authentication.signInWithCredential(credential);
        user = userCredential.user;
        print('Datos usuario logeado: $user');
        return user;
      } on FirebaseAuthException catch (_) {
        Future.error('Error de Autenticación de Usuario');
      }
    }
  }

  //Sign out
  Future<void> signOut() async {
    await authentication.signOut();
  }

  void save(AuthModel authModel) {}
}
