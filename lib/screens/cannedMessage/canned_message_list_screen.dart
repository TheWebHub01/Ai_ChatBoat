import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CannedMessageListScreen extends StatefulWidget {
  const CannedMessageListScreen({super.key});

  @override
  State<CannedMessageListScreen> createState() =>
      _CannedMessageListScreenState();
}

class _CannedMessageListScreenState extends State<CannedMessageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarOpacity: 0,
        scrolledUnderElevation: 0,
        title: Text("Canned Message"),
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
      ),
    );
  }
}
