import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDarkMode => MediaQuery.of(this).platformBrightness == Brightness.dark;

  bool get isLightMode => MediaQuery.of(this).platformBrightness == Brightness.light;
}
