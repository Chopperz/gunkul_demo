import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunkul_demo/core/controller/app_controller.dart';
import 'package:gunkul_demo/core/controller/user_controller.dart';
import 'package:gunkul_demo/core/extensions/string.dart';
import 'package:gunkul_demo/core/model/model.dart';
import 'package:gunkul_demo/core/widget/app_scaffold.dart';

part 'ui/avatar.dart';

part 'ui/menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: GetX<UserController>(
        init: Get.put(UserController()),
        builder: (userController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              MyProfileInfo(
                user: userController.user.value,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 5, color: Colors.grey.shade400),
                  const SizedBox(width: 5),
                  Icon(Icons.circle, size: 5, color: Colors.grey.shade400),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: GetX<AppController>(
                  init: Get.put(AppController()),
                  builder: (appController) {
                    return MyProfileMenu(
                      isDarkMode: appController.isDarkMode.value,
                      onThemeChanged: (value) => appController.onChangeThemeMode(value),
                    );
                  }
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
