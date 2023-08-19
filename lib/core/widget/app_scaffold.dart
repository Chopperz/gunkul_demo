import 'package:flutter/material.dart';
import 'package:gunkul_demo/core/widget/widget.dart';

class AppScaffold extends StatelessWidget with HomeAppBar {
  const AppScaffold({
    Key? key,
    this.title,
    this.backgroundColor,
    this.hideAppBar = true,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final bool hideAppBar;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  factory AppScaffold.home({
    Color? backgroundColor,
    required Widget body,
    Widget? bottomNavigationBar,
  }) {
    return AppScaffold(
      backgroundColor: backgroundColor,
      hideAppBar: false,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? (hideAppBar ? null : appBarWidget(context)),
      backgroundColor: backgroundColor,
      body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: body,
        );
      }),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}