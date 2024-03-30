
import 'package:flutter/cupertino.dart';
import 'package:flutter_pizzas/screens/home/home_page.dart';
import 'package:flutter_pizzas/screens/page/login_page.dart';
import 'package:flutter_pizzas/screens/routes/route_consts.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LOGIN_PAGE: (context) => const LoginPage(),
  HOME_PAGE: (context) => const HomePage(),
};