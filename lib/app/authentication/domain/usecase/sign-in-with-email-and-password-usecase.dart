import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_aechitecture/app/authentication/domain/repository/authentication-repository.dart';

class SignInWithEmailAndPasswordUseCase
    extends CompletableUseCase<SignInWithEmailAndPasswordUseCaseParams> {
  final AuthenticationRepository _repository;

  SignInWithEmailAndPasswordUseCase(this._repository);
  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = new StreamController();

    try {
      await _repository.signInWithEmailAndPassword(
          email: params!.email, password: params.password);
      print('Authentication successful:SignInWithEmailAndPasswordUseCase');
      streamController.close();
    } catch (error) {
      print('Authentication error: $error : SignInWithEmailAndPasswordUseCase');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}

class SignInWithEmailAndPasswordUseCaseParams {
  final String email;
  final String password;
  SignInWithEmailAndPasswordUseCaseParams(
      {required this.email, required this.password});
}
