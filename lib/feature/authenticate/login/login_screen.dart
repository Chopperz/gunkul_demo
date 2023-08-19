part of '../authenticate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_login.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: GetX<UserController>(
          init: Get.put(UserController()),
          initState: (state) => state.controller?.onInitial(),
          dispose: (state) => state.controller?.onDispose(),
          builder: (controller) {
            if (controller.loginStatus.value.isLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(backgroundColor: Colors.deepPurple),
              );
            }
            return LoginForm(
              formKey: _formKey,
              usernameCtrl: controller.usernameCtrl,
              passwordCtrl: controller.passwordCtrl,
              isValidate: controller.isValidate.value,
              onLogin: () {
                bool isValidate = _formKey.currentState?.validate() ?? false;
                if (isValidate) {
                  controller.login();
                }
              },
            );
          }
        ),
      ),
    );
  }
}
