import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/config/app_dependency.dart';
import 'package:flutter_clean_architecture/constant/config_keys.dart';
import 'package:flutter_clean_architecture/presentation/home/home_page.dart';
import 'package:flutter_clean_architecture/presentation/login/login_page.dart';
import 'package:flutter_clean_architecture/presentation/register/register.page.dart';
import 'package:flutter_clean_architecture/presentation/splash/splash.page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConfigKeys.ROUTE_SPLASH:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case ConfigKeys.ROUTE_LOGIN:
        return MaterialPageRoute(
            builder: (_) => LoginPage(loginBloc: AppDependencies.sl.get()));
      case ConfigKeys.ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ConfigKeys.ROUTE_REGISTER:
        return MaterialPageRoute(
            builder: (_) => RegisterPage(registerBloc: AppDependencies.sl()));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text("No route"))));
    }
  }
}
