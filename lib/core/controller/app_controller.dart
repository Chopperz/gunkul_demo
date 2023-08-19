import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunkul_demo/theme/theme_mode_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  Rx<bool> isDarkMode = false.obs;
  late SharedPreferences sharedPreferences;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: "global-navigator-key");

  @override
  bool get initialized => super.initialized;

  @override
  void onInit() {
    setSharedPreferences();
    super.onInit();
  }

  void setSharedPreferences() async => sharedPreferences = await SharedPreferences.getInstance();

  Future<void> onInitSetThemeMode() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String theme = sharedPreferences.getString("theme") ?? "light";
    bool isDarkModeFromString = theme.contains("dark");
    isDarkMode.value = isDarkModeFromString;
    Get.changeTheme(isDarkModeFromString ? ThemeModeConfig().darkTheme : ThemeModeConfig().lightTheme);
  }

  void onChangeThemeMode(bool value) {
    isDarkMode.value = value;
    Get.changeTheme(!value ? ThemeModeConfig().lightTheme : ThemeModeConfig().darkTheme);
    sharedPreferences.setString("theme", !value ? "light" : "dark");
  }
}
