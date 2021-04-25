import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/modules/models/user.dart';
import 'package:shapiping/modules/services/firebase_service.dart';

final authProvider = StreamProvider<User?>((ref) {
  final auth = ref.watch(authServiceProvider);
  return auth.user;
});
