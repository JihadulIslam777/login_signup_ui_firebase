import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCollection {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  static void saveUserData(
      String name, String email, String password, User user) async {
    await _firebaseFirestore.collection('Users').doc(user.uid).set({
      'Username': name,
      'Email': user.email,
      'Pass': password,
    }).onError(
      (error, stackTrace) => print(error.toString()),
    );
  }
}
