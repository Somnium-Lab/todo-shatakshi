import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_aechitecture/app/authentication/domain/repository/authentication-repository.dart';
import 'package:todo_clean_aechitecture/injection-container.dart';

class SignOutUseCase extends CompletableUseCase<void> {
  final AuthenticationRepository _repository;

  SignOutUseCase(this._repository);
  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = new StreamController();

    try {
      await reset();
      await _repository.signOut();
      print('SignOut successfully: SignOutUseCase');
      streamController.close();
    } catch (error) {
      print('Error in SingOut : $error : SignOutUseCase');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
