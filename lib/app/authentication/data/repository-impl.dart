import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_clean_aechitecture/app/authentication/domain/repository/authentication-repository.dart';
import 'package:todo_clean_aechitecture/core/utility/db-keys.dart';

class AuthRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  bool checkLogInStatus() {
    if (_firebaseAuth.currentUser == null)
      return false;
    else
      return true;
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await firestore
        .collection(DbKeys.collectionNameUsers)
        .doc(_firebaseAuth.currentUser!.uid)
        .set({DbKeys.userName: name, DbKeys.userEmail: email});
  }
}
