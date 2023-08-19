part of '../profile_screen.dart';

class MyProfileInfo extends StatelessWidget {
  const MyProfileInfo({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  Widget get genderIcon {
    switch((user.gender ?? "").toLowerCase()) {
      case "male":
        return const Icon(Icons.male, color: Colors.blue);
      case "female":
        return const Icon(Icons.female, color: Colors.pink);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 120,
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 60,
              child: user.firstName.isNullOrEmpty
                  ? const Icon(Icons.person, size: 60)
                  : Text(
                      user.firstName.getFirstOrSingleCharacter,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.grey.shade800,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, size: 18),
                      Text(
                        ": ${user.firstName ?? ""} ${user.lastName ?? ""}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 18),
                      Text(
                        ": ${user.email}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Age: ${user.age ?? "-"}y ${user.gender.isNullOrEmpty ? "" : ","}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 2),
                      genderIcon,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
