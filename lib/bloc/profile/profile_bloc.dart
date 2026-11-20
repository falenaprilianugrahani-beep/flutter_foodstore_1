import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore_1/resource/model/customer_model.dart';
import 'package:flutter_foodstore_1/resource/remote/profile_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRemoteResource profileRemoteResource;

  ProfileBloc(this.profileRemoteResource) : super(const _Initial()) {
    on<_LoadProfile>((event, emit) async {
      emit(const _Loading());
      final result = await profileRemoteResource.fetchProfile();
      result.fold(
        (error) => emit(_Error(error)),
        (profile) => emit(_LoadedProfile(profile)),
      );
    });

    on<_UpdateProfile>((event, emit) async {
      emit(const _Loading());
      final result = await profileRemoteResource.updateProfile(
        name: event.name,
        email: event.email,
        image: event.image,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );
      result.fold(
        (error) => emit(_Failure(error)),
        (message) => emit(_UpdatedProfile(message)),
      );
    });
  }
}