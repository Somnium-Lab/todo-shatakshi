import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_aechitecture/app/authentication/domain/repository/authentication-repository.dart';

class CheckLoginStatusUseCase extends CompletableUseCase<void> {
  final AuthenticationRepository _repository;

  CheckLoginStatusUseCase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();
    try {
      bool status = await _repository.checkLogInStatus();
      print('SplashScreen Execution Successful :CheckLoginStatusUseCase');
      streamController.add(status);
      streamController.close();
    } catch (error) {
      print(
          'SplashScreen Execution Unsuccessful: $error :CheckLoginStatusUseCase');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}
