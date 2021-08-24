abstract class AuthenticationRepository {
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();
  Future<void> signUp(
      {required String name, required String email, required String password});

  bool checkLogInStatus();
}
