import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore_1/resource/model/customer_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRemoteResource {
  final Dio _dio;

  ProfileRemoteResource(this._dio);

  Future<Either<String, CustomerModel>> fetchProfile() async {
    try {
      final response = await _dio.get('profile');
      if (response.statusCode == 200) {
        return Right(CustomerModel.fromMap(response.data['customer']));
      }
      return Left('Failed to fetch profile');
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<dynamic, String>> updateProfile({
    required String name,
    required String email,
    XFile? image,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      final map = <String, dynamic>{
        'name': name,
        'email': email,
      };
      if (password != null && password.isNotEmpty) {
        map['password'] = password;
        map['password_confirmation'] = passwordConfirmation;
      }
      if (image != null) {
        map['image'] = MultipartFile.fromBytes(
          await image.readAsBytes(),
          filename: image.name,
        );
      }

      final response = await _dio.post(
        'profile',
        data: FormData.fromMap(map),
        options: Options(
          headers: {'content-type': 'multipart/form-data'},
        ),
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left({'message': response.data['message']});
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return Left(e.response?.data);
      }
      return Left({'message': e.toString()});
    }
  }
}