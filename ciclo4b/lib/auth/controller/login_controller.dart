import 'package:ciclo4b/auth/controller/request/login_request.dart';
import 'package:ciclo4b/auth/controller/response/login_response.dart';

import 'package:ciclo4b/auth/repository/auth_repository.dart';
import 'package:ciclo4b/auth/repository/fb_repository.dart';


class LoginController {
  late final AuthRepository _userRepository;
  late final FirebaseAuthenticationRepository _authRepository;

  LoginController() {
    _userRepository = AuthRepository();
    _authRepository = FirebaseAuthenticationRepository();
  }

  // Future<UserInfoResponse> validateEmailPassword(LoginRequest request) async {
  //   await _authRepository.signInEmailPassword(request.email, request.password);

  //   // Consultar el usuario que tenga el correo dado
  //   var user = await _userRepository.findByEmail(request.email);

  //   return UserInfoResponse(
  //     id: user.id,
  //     email: user.email,
  //   );
  // }


  Future<void> logout() async {
    await _authRepository.signOut();
  }
}

