import 'dart:async';

import 'package:app_my_resep/common/theme.dart';
import 'package:app_my_resep/routes/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 3500), () {
      Get.offNamed(NameRoute.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Center(
        child: Lottie.asset("assets/102070-thank-you-yoga-style.json", repeat: false),
      ),
    );
  }
}
