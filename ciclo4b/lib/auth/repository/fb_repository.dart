import 'package:ciclo4b/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationRepository {
  final AuthRepository user = AuthRepository();

  Future<void> signInEmailPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.user!.email.toString(), password: password);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no existe.');
      } else if (e.code == 'wrong-password') {
        return Future.error('Credenciales inválidas.');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
