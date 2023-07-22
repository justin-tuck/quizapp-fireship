import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final userStream = FirebaseAuth.instance.authStateChanges();
  //Other way to check authentication like an event if a user clicks a button
  static final user = FirebaseAuth.instance.currentUser;
}
