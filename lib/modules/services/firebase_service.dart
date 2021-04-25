import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/modules/models/user.dart' as model;

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<model.User?> get user {
    return _auth.authStateChanges().map((user) {
      if (user == null) return null;
      return model.User(
          email: user.email, name: user.displayName, isAnon: user.isAnonymous);
    });
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toUpperCase(), password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    } on Exception catch (e) {
      print('$e');
      return false;
    } catch (e) {
      print('$e');
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
