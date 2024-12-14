import 'package:ai_chatboat/screens/explore/explore_screen.dart';
import 'package:ai_chatboat/screens/home/home_screen.dart';
import 'package:ai_chatboat/screens/theme/theme_screen.dart';
import 'package:ai_chatboat/screens/tools/tools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  const BottomNavigationBarScreen({super.key, required this.onThemeChanged});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 1;
  late final List _pages;

  String apptitle = "Assistant";
  @override
  void initState() {
    _pages = [
      HomeScreen(
        onThemeChanged: widget.onThemeChanged,
        isAppbarActive: false,
      ),
      ExploreScreen(onThemeChanged: widget.onThemeChanged),
      ToolsScreen(onThemeChanged: widget.onThemeChanged),
      ThemeScreen(onThemeChanged: widget.onThemeChanged),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarOpacity: 0,
        scrolledUnderElevation: 0,
        title: Text(apptitle),
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
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          border: Border(
            top: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF1B1B1B)
                  : Color(0xFFF3F3F3), // Border color
              width: 1.5, // Border width
            ),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 2,
                  //       blurRadius: 10,
                  //       offset: const Offset(0, -2),
                  //     ),
                  //   ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTab("assets/svg/home_unfill.svg", 'Home', 0, "Home"),
                    _buildTab("assets/svg/explore_unfill.svg", 'Explore', 1,
                        "Assistant"),
                    _buildTab(
                        "assets/svg/tools_unfill.svg", 'Tools', 2, "Tools"),
                    _buildTab(
                        "assets/svg/theme_unfill.svg", 'Theme', 3, "Theme"),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              left: (MediaQuery.of(context).size.width / 4) * _currentIndex +
                  MediaQuery.of(context).size.width / 8 - // Center the FAB
                  28, // Offset to align the FAB
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF9247E7), // Start color
                        Color(0xFF4D35E5), // End color
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      _currentIndex == 0
                          ? "assets/svg/home_fill.svg"
                          : _currentIndex == 1
                              ? "assets/svg/explore_fill.svg"
                              : _currentIndex == 2
                                  ? "assets/svg/tools_fill.svg"
                                  : "assets/svg/theme_fill.svg",
                      height: 28,
                      width: 28,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String icon, String title, int index, String appTitle) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          apptitle = appTitle;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: _currentIndex == index
                ? Colors.transparent
                : Theme.of(context).brightness == Brightness.dark
                    ? Color(0xFFB1B1B1).withOpacity(0.6)
                    : Colors.black,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: _currentIndex == index
                  ? Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black
                  : Theme.of(context).brightness == Brightness.dark
                      ? Color(0xFFB1B1B1).withOpacity(0.6)
                      : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
