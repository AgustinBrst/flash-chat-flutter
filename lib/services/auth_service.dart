import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return User(
      email: firebaseUser.email,
      uid: firebaseUser.uid,
    );
  }

  Future<User> createUserWithEmailAndPassword({@required String email, @required String password}) async {
    final AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebaseUser(authResult.user);
  }
}
