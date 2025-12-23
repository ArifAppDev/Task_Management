import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/helpers/all_routes.dart';
import 'package:to_do/helpers/navigation_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(microseconds: 2000), () {
      NavigationService.navigateTo(Routes.homescreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [



          
        ],
      ));
  }
}
