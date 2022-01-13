import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shapiping/modules/models/api_result.dart';
import 'package:shapiping/modules/models/api_result/api_response.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    _auth.authStateChanges().listen((event) {
      print(event);
    });
    return _auth.authStateChanges();
  }

  Future<ApiResult> signInWithEmail(String email, String password) async {
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

  Future<ApiResponse> signInWithFb() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      if (loginResult.status == LoginStatus.success) {
        final facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, return the UserCredential
        final res = await _auth.signInWithCredential(facebookAuthCredential);

        return ApiResponse.success();
      } else {
        return ApiResponse.fail();
      }
    } catch (e) {
      if (e is FirebaseException) return ApiResponseFirebaseError(e);
      return ApiResponseClientError(e);
    }
  }

  Future<ApiResponse> signInWithGoogle() async {
    try {
      // Trigger the sign-in flow
      final googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth;

      if (googleUser == null)
        return ApiResponse.fail();
      else
        googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      return ApiResponseSuccess();
    } catch (e) {
      print(e);
      if (e is FirebaseException) return ApiResponseFirebaseError(e);
      return ApiResponseClientError(e);
    }
  }
}
