part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = Initial;
  const factory OrderState.loading() = Loading;
  const factory OrderState.loadedOrder(
    List<OrderModel> orders, {
    required bool hasMore,
  }) = LoadedOrder;
  const factory OrderState.detail(dynamic detailOrder) = DetailOrder;
  const factory OrderState.error(String message) = Error;
}