import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore_1/bloc/auth/auth_bloc.dart';
import 'package:flutter_foodstore_1/bloc/order/order_cubit.dart';
import 'package:flutter_foodstore_1/ui/auth/dashboard/cart_page.dart';
import 'package:flutter_foodstore_1/ui/auth/dashboard/dashboard_page.dart';
import 'package:flutter_foodstore_1/ui/auth/dashboard/home_page.dart';
import 'package:flutter_foodstore_1/ui/auth/dashboard/order_page.dart';
import 'package:flutter_foodstore_1/ui/auth/dashboard/profile_page.dart';
import 'package:flutter_foodstore_1/ui/auth/login_page.dart';
import 'package:flutter_foodstore_1/ui/auth/register_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;
  AppRouter({required this.authBloc});

  late final router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: '/dashboard/home',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => DashboardPage(child: child),
        routes: [
          GoRoute(
            path: '/dashboard/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/dashboard/cart',
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: '/dashboard/order',
            builder: (context, state) {
              context.read<OrderCubit>().fetchOrders(isRefresh: true);
              return const OrderPage();
            },
          ),
          GoRoute(
            path: '/dashboard/profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = authBloc.state;
      final isLoggingIn = state.uri.toString() == '/login';
      final isRegistering = state.uri.toString() == '/register';

      return authState.maybeWhen(
        authenticated: () {
          if (isLoggingIn || isRegistering) return '/dashboard/home';
          return null;
        },
        orElse: () {
          if (!isLoggingIn && !isRegistering) return '/login';
          return null;
        },
      );
    },
  );
}

/// Mengubah stream (dari Bloc) menjadi Listenable supaya bisa dipakai GoRouter.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}