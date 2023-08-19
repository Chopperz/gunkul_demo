import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:gunkul_demo/core/api/path.dart';
import 'package:gunkul_demo/core/model/model.dart';
import 'package:gunkul_demo/core/service/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStatus { init, loading, done }

extension ExtensionLoginStatus on LoginStatus {
  bool get isInit => this == LoginStatus.init;

  bool get isLoading => this == LoginStatus.loading;

  bool get isDone => this == LoginStatus.done;
}

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String get _username => usernameCtrl.text;

  String get _password => passwordCtrl.text;

  RxBool isValidate = false.obs;
  Rx<LoginStatus> loginStatus = LoginStatus.init.obs;

  void onInitial() async {
    final pref = await SharedPreferences.getInstance();
    final userId = pref.getInt("userId");
    if (userId != null) {
      loginStatus.value = LoginStatus.loading;
      fetchUser(userId);
    } else {
      usernameCtrl.addListener(onTextListener);
      passwordCtrl.addListener(onTextListener);
    }
  }

  void onDispose() {
    usernameCtrl
      ..removeListener(onTextListener)
      ..dispose();
    passwordCtrl
      ..removeListener(onTextListener)
      ..dispose();
  }

  void onTextListener() {
    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      isValidate.value = true;
    } else {
      isValidate.value = false;
    }
  }

  Future<void> login() async {
    loginStatus.value = LoginStatus.loading;
    debugPrint(loginStatus.value.name);
    Response response = await DioService.instance.post(
      path: ApiPath.login.path,
      data: {
        "username": _username,
        "password": _password,
      },
      options: Options(
        contentType: "application/json",
      ),
    );
    String? message = response.data["message"];
    loginStatus.value = LoginStatus.done;
    if (message != null) {
      Get.defaultDialog(
        title: "ERROR ${response.statusCode}",
        middleText: message,
      );
    } else {
      user.value = UserModel.fromJson(response.data);
      final pref = await SharedPreferences.getInstance();
      await pref.setInt("userId", user.value.id ?? 1);
      Get.offAllNamed("/profile");
    }
  }

  Future<void> fetchUser(int userId) async {
    Response response = await DioService.instance.get(
      path: "users/$userId",
    );
    loginStatus.value = LoginStatus.done;
    String? message = response.data["message"];
    if (message != null) {
      Get.defaultDialog(
        title: "ERROR ${response.statusCode}",
        middleText: message,
      );
    } else {
      user.value = UserModel.fromJson(response.data);
      Get.offAllNamed("/profile");
    }
  }

  void logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("userId");
    Get.offAllNamed("/login");
  }
}
