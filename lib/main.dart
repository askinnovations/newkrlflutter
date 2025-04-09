import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl/splash.dart';
import 'package:krl/utils/app_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KRL',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 170, 9, 111)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
