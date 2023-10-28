import 'package:flutter/material.dart';
import 'package:srchout_assignment/main.dart';
import 'package:srchout_assignment/screens/bike_details.dart';
import 'package:srchout_assignment/screens/checkout.dart';
import 'package:srchout_assignment/screens/dashboard.dart';

class RouteGenerator {
  static const String dashboardPage = '/DashboardPage';
  static const String defaultPage = '/';
  static const String bikeDetailsPage = '/BikeDetailsPage';
  static const String checkoutPage = '/CheckoutPage';

  static Route? generateRoute(RouteSettings settings) {    
    switch (settings.name) {
      case defaultPage:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case dashboardPage:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case bikeDetailsPage:
      final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BikeDetailsPage(
            image: args['image'],
            name: args['name'],
            type: args['type'],
            rent: args['rent'],
          ),
        );
      case checkoutPage:
        return MaterialPageRoute(builder: (_) => const CheckoutPage());

      default:
        return null;
        // MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  }
}
