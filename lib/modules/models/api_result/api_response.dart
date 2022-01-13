import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'api_response.freezed.dart';
// part 'api_result.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const ApiResponse._();
  const factory ApiResponse.success([String? message]) = ApiResponseSuccess;
  const factory ApiResponse.firebaseError(FirebaseException error) =
      ApiResponseFirebaseError;
  const factory ApiResponse.clientError(dynamic error) = ApiResponseClientError;
  const factory ApiResponse.fail([String? message]) = ApiResponseFail;
}
