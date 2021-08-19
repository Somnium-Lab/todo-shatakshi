import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    throw Exception('invalid route');
  } //TODO

  Future<void> navigateTo(String routeName,
      {bool shouldReplace = false, Object? arguments}) {
    if (shouldReplace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void navigateBack() {
    return navigatorKey.currentState!.pop();
  }

  void navigatePopUntil(String untilRoute) {
    return navigatorKey.currentState!
        .popUntil(ModalRoute.withName('$untilRoute'));
  }
}
