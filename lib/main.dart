import 'package:app_my_resep/common/theme.dart';
import 'package:app_my_resep/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        backgroundColor: AppTheme.bgColor,
        primarySwatch:
            const MaterialColor(0xFF201c2b, AppTheme.colorCustomSwatch),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/splash",
      initialRoute: "/",
      getPages: AppRoute.listRoute,
    );
  }
}
