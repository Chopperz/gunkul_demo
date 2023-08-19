part of '../../authenticate.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.formKey,
    required this.usernameCtrl,
    required this.passwordCtrl,
    this.isValidate = false,
    this.onLogin,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameCtrl;
  final TextEditingController passwordCtrl;
  final bool isValidate;
  final Function? onLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "GUNKUL",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          LoginTextFormFieldWidget(
            controller: usernameCtrl,
            type: LoginTextFormFieldType.userName,
          ),
          const SizedBox(height: 20),
          LoginTextFormFieldWidget(
            controller: passwordCtrl,
            type: LoginTextFormFieldType.password,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (onLogin != null) onLogin!.call();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (isValidate) {
                  return Colors.deepPurple;
                }
                return Colors.deepPurple.shade200;
              }),
              fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
