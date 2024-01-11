import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../food/widget/food_page.dart';
import '../../login/widget/login_page.dart';
import '../../main.dart';

class AppRouter{

  static const home = '/home';
  static const login = '/login';
  static const food = '/food';


  static Widget _homePageRouteBuilder(BuildContext context, GoRouterState state) => const HomePage();
  static Widget _loginPageRouteBuilder(BuildContext context, GoRouterState state) => const LoginPage();
  static Widget _foodRouteBuilder(BuildContext context, GoRouterState state) => const FoodPage(uaername: '',);

  //error path 
  //static Widget errorWidget(BuildContext context, GoRouterState state) => const NotFoundPage();

  // use this in [MaterialApp.router]
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: home, builder: _homePageRouteBuilder),
      GoRoute(path: login, builder: _loginPageRouteBuilder),
      GoRoute(path: food, builder: _foodRouteBuilder),
    ],
    //errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}