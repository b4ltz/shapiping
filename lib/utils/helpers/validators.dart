import 'package:shapiping/utils/extensions/string.dart';

abstract class Validators {
  static String? email(String? email) {
    if (email == null) return null;
    if (email.trim().isEmpty) return 'This field is required';
    if (!email.isValidEmail()) return 'Please provide a valid email';
    return null;
  }

  static String? password(String? pass) {
    if (pass == null) return null;
    if (pass.trim().isEmpty) return 'This field is required';
    if (pass.length < 8) return 'Password must be greater than 8 characters';
    return null;
  }
}
