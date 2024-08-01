import 'package:go_router/go_router.dart';
import 'screen/login.dart';
import 'screen/home-screen/home.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    // Add your routes here
  ],
);
