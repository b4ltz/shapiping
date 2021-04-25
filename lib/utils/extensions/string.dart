import 'package:shapiping/const/regexp_const.dart';

extension ExtString on String {
  bool isValidEmail() {
    final regex = RegExp(kEmailPattern);
    return regex.hasMatch(this.trim());
  }
}
