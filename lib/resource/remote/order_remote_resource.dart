import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore_1/resource/model/order_model.dart';
import 'package:flutter_foodstore_1/resource/model/paging_model.dart';

class OrderRemoteResource {
  final Dio _dio;

  OrderRemoteResource(this._dio);

  // Method 1: Mengambil daftar pesanan dengan pagination
  Future<Either<String, PagingModel<OrderModel>>> fetchOrders({int page = 0}) async {
    try {
      final response = await _dio.get('customer/my-orders?page=$page');
      final result = PagingModel.fromMap(
        response.data['data'],
        OrderModel.fromMap,
      );
      return Right(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  // Method 2: Mengambil detail pesanan berdasarkan snapToken
  Future<Either<String, dynamic>> detailOrder(String snapToken) async {
    try {
      final response = await _dio.get('customer/my-orders/$snapToken');
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  // Method 3: Memberikan ulasan/rating produk
  Future<Either<String, String>> reviewProduct({
    required int transactionDetailId,
    required int productId,
    required int rating,
    required String review,
  }) async {
    try {
      final response = await _dio.post(
        'customer/ratings',
        data: {
          'transaction_detail_id': transactionDetailId,
          'product_id': productId,
          'rating': rating,
          'review': review,
        },
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Terjadi kesalahan');
    }
  }
}