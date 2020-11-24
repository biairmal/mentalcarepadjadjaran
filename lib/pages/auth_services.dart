import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // // create Account
  // static Future<SignInSignUpResult> createUser(
  //     {String email, String pass}) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: pass);
  //     return SignInSignUpResult(user: result.user);
  //   } catch (e) {
  //     return SignInSignUpResult(message: e.toString());
  //   }
  // }

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
