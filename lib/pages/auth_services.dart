import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // create Account

  static createUser({String email, String password}) async {
    final res = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = res.user;
    return user;
  }
  // sign in with email/password
  static signInWithEmail({String email, String password}) async {
    final res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = res.user;
    return user;
  }

  static void signOut() {
    _auth.signOut();
  }
}

class SignInSignUpResult {
  final User user;
  final String message;
  SignInSignUpResult({this.user, this.message});
}
