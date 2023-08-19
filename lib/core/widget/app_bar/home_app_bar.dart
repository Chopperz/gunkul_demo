part of '../widget.dart';

mixin HomeAppBar {
  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      title: Text(
        "HOME",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      actions: [
        GetX<HomeController>(
          init: Get.put(HomeController()),
          global: true,
          builder: (controller) {
            return IconButton(
              onPressed: () => controller.onToggleView(),
              icon: controller.isCategoryView.value ? const Icon(Icons.grid_view_sharp) : const Icon(Icons.list_alt),
            );
          },
        ),
      ],
    );
  }
}
