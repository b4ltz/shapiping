import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/modules/models/api_result.dart';
import 'package:shapiping/modules/models/api_result/api_response.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.authStateChanges();

  Future<ApiResult> signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.toUpperCase(), password: password)
          .timeout(Duration(seconds: 10));

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
      final user = await _auth
          .createUserWithEmailAndPassword(
              email: email.toLowerCase().trim(), password: password)
          .timeout(Duration(seconds: 10));
      return ApiResult(data: user);
    } on FirebaseAuthException catch (e) {
      return ApiResult(error: e);
    } catch (e) {
      return ApiResult(error: e);
    }
  }

  Future<ApiResponse> forgotPassword(String email) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: email)
          .timeout(Duration(seconds: 10));
      return ApiResponseSuccess();
    } catch (e) {
      if (e is FirebaseException) return ApiResponseFirebaseError(e);
      return ApiResponseClientError(e);
    }
  }
}
