import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  final FirebaseAuth _authClient = FirebaseAuth.instance;
  static AuthClient _instance = AuthClient.internal();
  AuthClient.internal();
  factory AuthClient() => _instance;

  // isLoggedIn?
  // Returns FirebaseUser if loggedIn and null if Not LoggedIn
  Future<bool> isLoggedIn() async {
    return await _authClient.currentUser() != null;
  }

  Future<void> loginWithEmailAndPass(String email, String pass) async {
    await _authClient.signInWithEmailAndPassword(email: email, password: pass);
  }

  Future<void> signupWithEmailAndPass(String email, String pass) async {
    await _authClient.createUserWithEmailAndPassword(
        email: email, password: pass);
  }

  Future<void> sendPasswordResetLink(String email) async {
    await _authClient.sendPasswordResetEmail(email: email);
  }

  // Sign Out From Firebase _auth
  // No Returns
  Future<void> signOut() async {
    return await _authClient.signOut();
  }
}
