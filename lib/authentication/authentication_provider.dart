import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup_ui_firebase/authentication/auth_response.dart';
import 'package:login_signup_ui_firebase/authentication/firebase_collection.dart';

class AuthenticationProvider {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<AuthResponse> signUp(
      String name, String email, String password) async {
    return await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential value) {
      FirebaseCollection.saveUserData(name, email, password, value.user!);
      return AuthResponse(true, 'Successfully Signup');
    }).onError((FirebaseAuthException error, stackTrace) {
      return AuthResponse(false, error.code);
    }).catchError((error) {
      return AuthResponse(false, error.code);
    });
  }

  static Future<AuthResponse> logIn(String email, String password) async {
    return await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential value) {
      return AuthResponse(true, 'congrats');
    }).onError((error, stackTrace) => AuthResponse(false, error.toString()));
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
