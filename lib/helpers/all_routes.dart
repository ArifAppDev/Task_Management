// ignore_for_file: unused_element

import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../features/add_task/presentation/add_task_screen.dart';
import '../features/home/presentation/home_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String homescreen = '/homescreen';
  static const String addtaskscreen = '/addtaskscreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homescreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: HomeScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => HomeScreen());

      case Routes.addtaskscreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: AddTaskScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => AddTaskScreen());

      // case Routes.screenView:
      //   Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //         widget: ScreenView(widget: data["widget"]),
      //         settings: settings,
      //       )
      //       : CupertinoPageRoute(
      //         builder: (context) => ScreenView(widget: data["widget"]),
      //       );

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
    : super(
        settings: settings,
        reverseTransitionDuration: const Duration(milliseconds: 1),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return widget;
            },
        transitionDuration: const Duration(milliseconds: 1),
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
                child: child,
              );
            },
      );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: widget,
    );
  }
}
