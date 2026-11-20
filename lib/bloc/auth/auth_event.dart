part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = _LoginRequested;
  const factory AuthEvent.registerRequested({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) = _RegisterRequested;
  const factory AuthEvent.checkLoginStatus() = _CheckLoginStatus;
  const factory AuthEvent.logoutRequested() = _LogoutRequested;
}