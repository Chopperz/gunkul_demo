import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:gunkul_demo/core/controller/app_controller.dart';
import 'package:gunkul_demo/core/routes/routes.dart';
import 'package:gunkul_demo/feature/authenticate/authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      routes: Routes.instance.routes,
      onInit: () {
        Get.put(AppController())
          ..onInit()
          ..onInitSetThemeMode();
      },
      navigatorKey: AppController.navigatorKey,
      home: const LoginScreen(),
    );
  }
}
