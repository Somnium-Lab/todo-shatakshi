import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UseCaseObserver extends Observer<dynamic> {
  final Function _onComplete;
  final Function _onError;
  final Function? onNextFunction;

  UseCaseObserver(this._onComplete, this._onError, this.onNextFunction);

  @override
  void onComplete() {
    _onComplete();
  }

  @override
  void onError(e) {
    _onError();
  }

  @override
  void onNext(_) {
    if (onNextFunction != null) onNextFunction!(_);
  }
}
