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

  Future<User> get currentUser async {
    User currentUser;

    try {
      final currentFirebaseUser = await _firebaseAuth.currentUser();
      currentUser = _userFromFirebaseUser(currentFirebaseUser);
    } catch (error) {
      print(error);
    }

    return currentUser;
  }

  Future<User> createUserWithEmailAndPassword({@required String email, @required String password}) async {
    User user;

    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      user = _userFromFirebaseUser(authResult.user);
    } catch (error) {
      print(error);
    }

    return user;
  }
}
