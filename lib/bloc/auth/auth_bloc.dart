import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_foodstore_1/resource/local/auth_local_resource.dart';
import 'package:flutter_foodstore_1/resource/remote/auth_remote_resource.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteResource authRemoteResource;

  AuthBloc(this.authRemoteResource) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        started: () async {},
        loginRequested: (email, password) async {
          emit(const AuthState.loading());
          final result = await authRemoteResource.login(email, password);

          if (result.isLeft) {
            emit(AuthState.loginFailure(result.left));
            return;
          }

          // token sudah disimpan di AuthRemoteResource.login
          emit(const AuthState.loginSuccess('Login berhasil'));
          emit(const AuthState.authenticated());
        },
        registerRequested: (name, email, password, passwordConfirmation) async {
          emit(const AuthState.loading());
          final result = await authRemoteResource.register(
              name, email, password, passwordConfirmation);

          if (result.isLeft) {
            final error = result.left;
            if (error is Map<String, dynamic>) {
              emit(AuthState.registerFailure(error));
            } else {
              emit(AuthState.registerFailure({'message': error.toString()}));
            }
            return;
          }

          emit(AuthState.registerSuccess(result.right));
        },
        checkLoginStatus: () async {
          final token = await AuthLocalResource.getToken();
          if (token != null && token.isNotEmpty) {
            emit(const AuthState.authenticated());
          } else {
            emit(const AuthState.unauthenticated());
          }
        },
        logoutRequested: () async {
          await authRemoteResource.logout();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}