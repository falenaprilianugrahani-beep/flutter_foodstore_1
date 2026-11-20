part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.loginSuccess(String message) = _LoginSuccess;
  const factory AuthState.loginFailure(String error) = _LoginFailure;
  const factory AuthState.registerSuccess(String message) = _RegisterSuccess;
  const factory AuthState.failure(String error) = _Failure;
  const factory AuthState.registerFailure(Map<String, dynamic> error) = _RegisterFailure;
}