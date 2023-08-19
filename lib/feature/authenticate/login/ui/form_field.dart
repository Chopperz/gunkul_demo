part of '../../authenticate.dart';

enum LoginTextFormFieldType { userName, password, none }

class LoginTextFormFieldWidget extends StatelessWidget {
  const LoginTextFormFieldWidget({
    Key? key,
    this.type = LoginTextFormFieldType.none,
    this.controller,
  }) : super(key: key);

  final LoginTextFormFieldType type;
  final TextEditingController? controller;

  Widget? get prefixIcon {
    switch (type) {
      case LoginTextFormFieldType.userName:
        return const Icon(Icons.person, color: Colors.black);
      case LoginTextFormFieldType.password:
        return const Icon(Icons.lock, color: Colors.black);
      default:
        return null;
    }
  }

  String? get labelText {
    switch (type) {
      case LoginTextFormFieldType.userName:
        return "Username";
      case LoginTextFormFieldType.password:
        return "Password";
      default:
        return "Enter something..";
    }
  }

  static bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 57,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FormField(builder: (state) {
            return TextFormField(
              controller: controller,
              obscureText: type == LoginTextFormFieldType.password && !_isVisible ? true : false,
              textInputAction: type == LoginTextFormFieldType.userName ? TextInputAction.next : TextInputAction.done,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: prefixIcon,
                suffixIcon: type == LoginTextFormFieldType.password
                    ? GestureDetector(
                        onTap: () => state.didChange(_isVisible = !_isVisible),
                        child: Icon(_isVisible ? Icons.visibility_off : Icons.visibility),
                      )
                    : null,
                errorText: null,
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              validator: (value) {
                if (type != LoginTextFormFieldType.none && (value ?? "").isEmpty) {
                  return "please, enter something.";
                }
                return null;
              },
            );
          }),
        ),
      ],
    );
  }
}
