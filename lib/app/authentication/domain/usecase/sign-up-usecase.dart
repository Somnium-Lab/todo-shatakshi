import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_aechitecture/app/authentication/domain/repository/authentication-repository.dart';

class SignUpUseCase extends CompletableUseCase<SignUpUseCaseParams> {
  final AuthenticationRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = new StreamController();
    try {
      await _repository.signUp(
          name: params!.name, email: params.email, password: params.password);
      print('SignUp Successful: SignUpUseCase');
      streamController.close();
    } catch (error) {
      print('SignUp error : $error : SignUpUseCase');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}

class SignUpUseCaseParams {
  String name;
  String email;
  String password;

  SignUpUseCaseParams(
      {required this.name, required this.email, required this.password});
}
