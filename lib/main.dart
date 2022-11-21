import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/confirm_order_screen.dart';
import 'pages/dashboard_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/order_screen.dart';
import 'pages/product_details_page.dart';
import 'pages/products_page.dart';
import 'pages/register_page.dart';
import 'utils/shared_service.dart';
import '../utils/custom_color.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();

  if (_result) {
    _defaultHome = const DashboardPage();
  }
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DirmAgrolives App ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //home: const RegisterPage(),
        navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          '/': (context) => _defaultHome,
          '/login': (BuildContext context) => const LoginPage(),
          '/register': (BuildContext context) => const RegisterPage(),
          '/home': (BuildContext context) => const DashboardPage(),
          '/products': (BuildContext context) => const ProductsPage(),
          '/product-details': (BuildContext context) =>
              const ProductDetailsPage(),
          '/orders': (BuildContext context) => const OrderScreen(),
          '/confirmorders': (BuildContext context) =>
              const ConfirmOrderScreen(),
        });
  }
}
