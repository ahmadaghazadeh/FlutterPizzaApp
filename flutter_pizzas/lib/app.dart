import 'package:flutter/material.dart';
import 'package:flutter_pizzas/screens/home/home_page.dart';
import 'package:flutter_pizzas/screens/page/login_page.dart';
import 'package:flutter_pizzas/screens/routes/route_consts.dart';
import 'package:flutter_pizzas/screens/routes/routes.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: "Recipe Book",
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(
         seedColor: Colors.deepOrange
       ),
       useMaterial3: true,
       appBarTheme: const AppBarTheme(
           toolbarTextStyle: TextStyle(
             color: Colors.black,
             fontSize: 25,
             fontWeight: FontWeight.bold,
           )
         )
     ),
     routes: routes,
     initialRoute: LOGIN_PAGE,
   );
  }
  
}