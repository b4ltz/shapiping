// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApiResponseTearOff {
  const _$ApiResponseTearOff();

  ApiResponseSuccess success([String? message]) {
    return ApiResponseSuccess(
      message,
    );
  }

  ApiResponseFirebaseError firebaseError(FirebaseException error) {
    return ApiResponseFirebaseError(
      error,
    );
  }

  ApiResponseClientError clientError(dynamic error) {
    return ApiResponseClientError(
      error,
    );
  }

  ApiResponseFail fail([String? message]) {
    return ApiResponseFail(
      message,
    );
  }
}

/// @nodoc
const $ApiResponse = _$ApiResponseTearOff();

/// @nodoc
mixin _$ApiResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) success,
    required TResult Function(FirebaseException error) firebaseError,
    required TResult Function(dynamic error) clientError,
    required TResult Function(String? message) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseFirebaseError value) firebaseError,
    required TResult Function(ApiResponseClientError value) clientError,
    required TResult Function(ApiResponseFail value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res> implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  final ApiResponse _value;
  // ignore: unused_field
  final $Res Function(ApiResponse) _then;
}

/// @nodoc
abstract class $ApiResponseSuccessCopyWith<$Res> {
  factory $ApiResponseSuccessCopyWith(
          ApiResponseSuccess value, $Res Function(ApiResponseSuccess) then) =
      _$ApiResponseSuccessCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ApiResponseSuccessCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res>
    implements $ApiResponseSuccessCopyWith<$Res> {
  _$ApiResponseSuccessCopyWithImpl(
      ApiResponseSuccess _value, $Res Function(ApiResponseSuccess) _then)
      : super(_value, (v) => _then(v as ApiResponseSuccess));

  @override
  ApiResponseSuccess get _value => super._value as ApiResponseSuccess;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ApiResponseSuccess(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiResponseSuccess extends ApiResponseSuccess
    with DiagnosticableTreeMixin {
  const _$ApiResponseSuccess([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse.success(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponse.success'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResponseSuccess &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ApiResponseSuccessCopyWith<ApiResponseSuccess> get copyWith =>
      _$ApiResponseSuccessCopyWithImpl<ApiResponseSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) success,
    required TResult Function(FirebaseException error) firebaseError,
    required TResult Function(dynamic error) clientError,
    required TResult Function(String? message) fail,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseFirebaseError value) firebaseError,
    required TResult Function(ApiResponseClientError value) clientError,
    required TResult Function(ApiResponseFail value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiResponseSuccess extends ApiResponse {
  const factory ApiResponseSuccess([String? message]) = _$ApiResponseSuccess;
  const ApiResponseSuccess._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  $ApiResponseSuccessCopyWith<ApiResponseSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseFirebaseErrorCopyWith<$Res> {
  factory $ApiResponseFirebaseErrorCopyWith(ApiResponseFirebaseError value,
          $Res Function(ApiResponseFirebaseError) then) =
      _$ApiResponseFirebaseErrorCopyWithImpl<$Res>;
  $Res call({FirebaseException error});
}

/// @nodoc
class _$ApiResponseFirebaseErrorCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res>
    implements $ApiResponseFirebaseErrorCopyWith<$Res> {
  _$ApiResponseFirebaseErrorCopyWithImpl(ApiResponseFirebaseError _value,
      $Res Function(ApiResponseFirebaseError) _then)
      : super(_value, (v) => _then(v as ApiResponseFirebaseError));

  @override
  ApiResponseFirebaseError get _value =>
      super._value as ApiResponseFirebaseError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ApiResponseFirebaseError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as FirebaseException,
    ));
  }
}

/// @nodoc

class _$ApiResponseFirebaseError extends ApiResponseFirebaseError
    with DiagnosticableTreeMixin {
  const _$ApiResponseFirebaseError(this.error) : super._();

  @override
  final FirebaseException error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse.firebaseError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponse.firebaseError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResponseFirebaseError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ApiResponseFirebaseErrorCopyWith<ApiResponseFirebaseError> get copyWith =>
      _$ApiResponseFirebaseErrorCopyWithImpl<ApiResponseFirebaseError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) success,
    required TResult Function(FirebaseException error) firebaseError,
    required TResult Function(dynamic error) clientError,
    required TResult Function(String? message) fail,
  }) {
    return firebaseError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
  }) {
    return firebaseError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
    required TResult orElse(),
  }) {
    if (firebaseError != null) {
      return firebaseError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseFirebaseError value) firebaseError,
    required TResult Function(ApiResponseClientError value) clientError,
    required TResult Function(ApiResponseFail value) fail,
  }) {
    return firebaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
  }) {
    return firebaseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
    required TResult orElse(),
  }) {
    if (firebaseError != null) {
      return firebaseError(this);
    }
    return orElse();
  }
}

abstract class ApiResponseFirebaseError extends ApiResponse {
  const factory ApiResponseFirebaseError(FirebaseException error) =
      _$ApiResponseFirebaseError;
  const ApiResponseFirebaseError._() : super._();

  FirebaseException get error;
  @JsonKey(ignore: true)
  $ApiResponseFirebaseErrorCopyWith<ApiResponseFirebaseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseClientErrorCopyWith<$Res> {
  factory $ApiResponseClientErrorCopyWith(ApiResponseClientError value,
          $Res Function(ApiResponseClientError) then) =
      _$ApiResponseClientErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$ApiResponseClientErrorCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res>
    implements $ApiResponseClientErrorCopyWith<$Res> {
  _$ApiResponseClientErrorCopyWithImpl(ApiResponseClientError _value,
      $Res Function(ApiResponseClientError) _then)
      : super(_value, (v) => _then(v as ApiResponseClientError));

  @override
  ApiResponseClientError get _value => super._value as ApiResponseClientError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ApiResponseClientError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ApiResponseClientError extends ApiResponseClientError
    with DiagnosticableTreeMixin {
  const _$ApiResponseClientError(this.error) : super._();

  @override
  final dynamic error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse.clientError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponse.clientError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResponseClientError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ApiResponseClientErrorCopyWith<ApiResponseClientError> get copyWith =>
      _$ApiResponseClientErrorCopyWithImpl<ApiResponseClientError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) success,
    required TResult Function(FirebaseException error) firebaseError,
    required TResult Function(dynamic error) clientError,
    required TResult Function(String? message) fail,
  }) {
    return clientError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
  }) {
    return clientError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseFirebaseError value) firebaseError,
    required TResult Function(ApiResponseClientError value) clientError,
    required TResult Function(ApiResponseFail value) fail,
  }) {
    return clientError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
  }) {
    return clientError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(this);
    }
    return orElse();
  }
}

abstract class ApiResponseClientError extends ApiResponse {
  const factory ApiResponseClientError(dynamic error) =
      _$ApiResponseClientError;
  const ApiResponseClientError._() : super._();

  dynamic get error;
  @JsonKey(ignore: true)
  $ApiResponseClientErrorCopyWith<ApiResponseClientError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseFailCopyWith<$Res> {
  factory $ApiResponseFailCopyWith(
          ApiResponseFail value, $Res Function(ApiResponseFail) then) =
      _$ApiResponseFailCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ApiResponseFailCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res>
    implements $ApiResponseFailCopyWith<$Res> {
  _$ApiResponseFailCopyWithImpl(
      ApiResponseFail _value, $Res Function(ApiResponseFail) _then)
      : super(_value, (v) => _then(v as ApiResponseFail));

  @override
  ApiResponseFail get _value => super._value as ApiResponseFail;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ApiResponseFail(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiResponseFail extends ApiResponseFail with DiagnosticableTreeMixin {
  const _$ApiResponseFail([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse.fail(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponse.fail'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResponseFail &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ApiResponseFailCopyWith<ApiResponseFail> get copyWith =>
      _$ApiResponseFailCopyWithImpl<ApiResponseFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) success,
    required TResult Function(FirebaseException error) firebaseError,
    required TResult Function(dynamic error) clientError,
    required TResult Function(String? message) fail,
  }) {
    return fail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
  }) {
    return fail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? success,
    TResult Function(FirebaseException error)? firebaseError,
    TResult Function(dynamic error)? clientError,
    TResult Function(String? message)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseFirebaseError value) firebaseError,
    required TResult Function(ApiResponseClientError value) clientError,
    required TResult Function(ApiResponseFail value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseFirebaseError value)? firebaseError,
    TResult Function(ApiResponseClientError value)? clientError,
    TResult Function(ApiResponseFail value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class ApiResponseFail extends ApiResponse {
  const factory ApiResponseFail([String? message]) = _$ApiResponseFail;
  const ApiResponseFail._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  $ApiResponseFailCopyWith<ApiResponseFail> get copyWith =>
      throw _privateConstructorUsedError;
}
