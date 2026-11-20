import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore_1/bloc/auth/auth_bloc.dart';
import 'package:flutter_foodstore_1/bloc/order/order_cubit.dart';
import 'package:flutter_foodstore_1/bloc/profile/profile_bloc.dart';
import 'package:flutter_foodstore_1/core/constants/app_config.dart';
import 'package:flutter_foodstore_1/core/utils/auth_interceptor.dart';
import 'package:flutter_foodstore_1/resource/remote/auth_remote_resource.dart';
import 'package:flutter_foodstore_1/resource/remote/order_remote_resource.dart';
import 'package:flutter_foodstore_1/resource/remote/profile_remote_resource.dart';
import 'package:flutter_foodstore_1/router/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio(BaseOptions(baseUrl: AppConfig.API_PATH));

  final profileRemoteResource = ProfileRemoteResource(dio);
  final authRemoteResource = AuthRemoteResource(dio);
  final orderRemoteResource = OrderRemoteResource(dio);
  final authBloc = AuthBloc(authRemoteResource)
    ..add(const AuthEvent.checkLoginStatus());

  final appRouter = AppRouter(authBloc: authBloc);

  dio.interceptors.add(AuthInterceptor(authBloc));
  runApp(
    MyApp(
      appRouter: appRouter,
      authBloc: authBloc,
      profileRemoteResource: profileRemoteResource,
      orderRemoteResource: orderRemoteResource,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final AuthBloc authBloc;
  final ProfileRemoteResource profileRemoteResource;
  final OrderRemoteResource orderRemoteResource;

  const MyApp({
    super.key,
    required this.appRouter,
    required this.authBloc,
    required this.profileRemoteResource,
    required this.orderRemoteResource,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
        BlocProvider(
          create: (context) => ProfileBloc(profileRemoteResource),
        ),
        BlocProvider(
          create: (context) => OrderCubit(orderRemoteResource),
        ),
      ],
      child: MaterialApp.router(
        title: 'Food Store',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
          useMaterial3: true,
        ),
        routerConfig: appRouter.router,
      ),
    );
  }
}