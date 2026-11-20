import 'customer_model.dart';

class AuthResponseModel {
  bool? success;
  CustomerModel? customer;
  String? token;

  AuthResponseModel({
    this.success,
    this.customer,
    this.token,
  });

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        success: json["success"],
        customer: json["customer"] == null
            ? null
            : CustomerModel.fromMap(json["customer"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "customer": customer?.toMap(),
        "token": token,
      };
}