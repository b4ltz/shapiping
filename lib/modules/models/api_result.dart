import 'package:firebase_auth/firebase_auth.dart';

class ApiResult {
  final dynamic? data;
  final dynamic? error;

  const ApiResult({this.data, this.error});

  bool get hasError => error != null;
  bool get isFirebaseException => error is FirebaseAuthException;
}
