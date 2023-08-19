import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunkul_demo/core/controller/app_controller.dart';

class ThemeModeConfig {
  BuildContext get context => Get.context ?? AppController.navigatorKey.currentContext!;

  ThemeData get lightTheme => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          onPrimary: Colors.deepPurple.shade300,
          background: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple.shade400,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.deepPurple),
          ),
          fillColor: Colors.deepPurple,
          floatingLabelStyle: const TextStyle(color: Colors.deepPurple),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.deepPurple,
          selectionColor: Colors.deepPurple.shade100,
          selectionHandleColor: Colors.deepPurple.shade100,
        ),
        useMaterial3: true,
      );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          primary: Colors.cyan,
          onPrimary: Colors.cyan.shade300,
          background: Colors.grey[900],
        ),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.grey.shade200,
          ),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade200,
              ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.deepPurple),
          ),
          fillColor: Colors.deepPurple,
          floatingLabelStyle: const TextStyle(color: Colors.deepPurple),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.deepPurple,
          selectionColor: Colors.deepPurple.shade100,
          selectionHandleColor: Colors.deepPurple.shade100,
        ),
        useMaterial3: true,
      );
}
