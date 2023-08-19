part of '../profile_screen.dart';

class MyProfileMenu extends StatelessWidget {
  const MyProfileMenu({
    Key? key,
    required this.isDarkMode,
    this.onThemeChanged,
  }) : super(key: key);

  final bool isDarkMode;
  final Function(bool)? onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SwitchListTile(
            secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            title: Text(
              "Theme Mode",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            thumbIcon: MaterialStateProperty.resolveWith((states) {
              if (isDarkMode) {
                return const Icon(Icons.dark_mode, color: Colors.white);
              }
              return const Icon(Icons.light_mode, color: Colors.white);
            }),
            thumbColor: MaterialStateProperty.resolveWith((states) {
              if (isDarkMode) {
                return Colors.blue;
              }
              return Colors.yellow.shade700;
            }),
            trackColor: MaterialStateProperty.resolveWith((states) {
              if (isDarkMode) {
                return Colors.blue.shade600.withOpacity(.3);
              }
              return Colors.yellow.shade600.withOpacity(.3);
            }),
            trackOutlineColor: MaterialStateProperty.resolveWith((states) {
              if (isDarkMode) {
                return Colors.blue.shade600.withOpacity(.1);
              }
              return Colors.yellow.shade600.withOpacity(.1);
            }),
            value: isDarkMode,
            onChanged: onThemeChanged,
          ),
          Divider(height: 5, color: Colors.grey.shade200, indent: 20, endIndent: 20),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(
              "Products",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.grey,
            ),
            onTap: () => Get.toNamed("/home"),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Get.put(UserController()).logout();
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.red),
              fixedSize: MaterialStatePropertyAll(
                Size(MediaQuery.of(context).size.width, 50),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            child: Text(
              "Logout",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
