import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/modules/models/api_result.dart';
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

  Future<ApiResult> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toUpperCase(), password: password);

      return ApiResult(data: user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return ApiResult(error: e);
    } catch (e) {
      print('$e');
      return ApiResult(error: e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<ApiResult> register(String email, String password) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password);
      return ApiResult(data: user);
    } on FirebaseAuthException catch (e) {
      return ApiResult(error: e);
    } catch (e) {
      return ApiResult(error: e);
    }
  }
}
