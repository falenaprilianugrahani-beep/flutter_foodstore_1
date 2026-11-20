// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState()';
}


}

/// @nodoc
class $OrderStateCopyWith<$Res>  {
$OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( LoadedOrder value)?  loadedOrder,TResult Function( DetailOrder value)?  detail,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case LoadedOrder() when loadedOrder != null:
return loadedOrder(_that);case DetailOrder() when detail != null:
return detail(_that);case Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( LoadedOrder value)  loadedOrder,required TResult Function( DetailOrder value)  detail,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case LoadedOrder():
return loadedOrder(_that);case DetailOrder():
return detail(_that);case Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( LoadedOrder value)?  loadedOrder,TResult? Function( DetailOrder value)?  detail,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case LoadedOrder() when loadedOrder != null:
return loadedOrder(_that);case DetailOrder() when detail != null:
return detail(_that);case Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OrderModel> orders,  bool hasMore)?  loadedOrder,TResult Function( dynamic detailOrder)?  detail,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case LoadedOrder() when loadedOrder != null:
return loadedOrder(_that.orders,_that.hasMore);case DetailOrder() when detail != null:
return detail(_that.detailOrder);case Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OrderModel> orders,  bool hasMore)  loadedOrder,required TResult Function( dynamic detailOrder)  detail,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case LoadedOrder():
return loadedOrder(_that.orders,_that.hasMore);case DetailOrder():
return detail(_that.detailOrder);case Error():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OrderModel> orders,  bool hasMore)?  loadedOrder,TResult? Function( dynamic detailOrder)?  detail,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case LoadedOrder() when loadedOrder != null:
return loadedOrder(_that.orders,_that.hasMore);case DetailOrder() when detail != null:
return detail(_that.detailOrder);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements OrderState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState.initial()';
}


}




/// @nodoc


class Loading implements OrderState {
  const Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState.loading()';
}


}




/// @nodoc


class LoadedOrder implements OrderState {
  const LoadedOrder( List<OrderModel> orders, {required this.hasMore}): _orders = orders;
  

 final  List<OrderModel> _orders;
 List<OrderModel> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

 final  bool hasMore;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedOrderCopyWith<LoadedOrder> get copyWith => _$LoadedOrderCopyWithImpl<LoadedOrder>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedOrder&&const DeepCollectionEquality().equals(other.orders, _orders)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),hasMore);
}

@override
String toString() {
    return 'OrderState.loadedOrder(orders: $orders, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $LoadedOrderCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $LoadedOrderCopyWith(LoadedOrder value, $Res Function(LoadedOrder) _then) = _$LoadedOrderCopyWithImpl;
@useResult
$Res call({
 List<OrderModel> orders, bool hasMore
});




}
/// @nodoc
class _$LoadedOrderCopyWithImpl<$Res>
    implements $LoadedOrderCopyWith<$Res> {
  _$LoadedOrderCopyWithImpl(this._self, this._then);

  final LoadedOrder _self;
  final $Res Function(LoadedOrder) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,Object? hasMore = null,}) {
  return _then(LoadedOrder(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class DetailOrder implements OrderState {
  const DetailOrder(this.detailOrder);
  

 final  dynamic detailOrder;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailOrderCopyWith<DetailOrder> get copyWith => _$DetailOrderCopyWithImpl<DetailOrder>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailOrder&&const DeepCollectionEquality().equals(other.detailOrder, detailOrder));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(detailOrder));
}

@override
String toString() {
    return 'OrderState.detail(detailOrder: $detailOrder)';
}


}

/// @nodoc
abstract mixin class $DetailOrderCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $DetailOrderCopyWith(DetailOrder value, $Res Function(DetailOrder) _then) = _$DetailOrderCopyWithImpl;
@useResult
$Res call({
 dynamic detailOrder
});




}
/// @nodoc
class _$DetailOrderCopyWithImpl<$Res>
    implements $DetailOrderCopyWith<$Res> {
  _$DetailOrderCopyWithImpl(this._self, this._then);

  final DetailOrder _self;
  final $Res Function(DetailOrder) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detailOrder = freezed,}) {
  return _then(DetailOrder(
freezed == detailOrder ? _self.detailOrder : detailOrder // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class Error implements OrderState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'OrderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
