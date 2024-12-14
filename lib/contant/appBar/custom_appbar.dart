import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppbar(BuildContext context, String title) {
  return AppBar(
    // toolbarOpacity: 0,
    scrolledUnderElevation: 0,
    title: Text(title),
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/svg/back_button.svg",
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        )),
  );
}
