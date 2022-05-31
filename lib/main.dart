import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salephone_user/utility/common_methods.dart';

import 'configuration/app_binding/app_binding_controllers.dart';
import 'modules/dashboard/dashboard_view.dart';
import 'modules/login/login_screen.dart';

final getPreferences = GetStorage();

pref() async {
  await GetStorage.init();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  pref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AppBinding(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (getIsLogin()) {
        Get.off(() => const DashboardView());
      } else {
        Get.off(() => const LoginView());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
