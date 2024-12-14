import 'package:ai_chatboat/chat/ai_chat_screen.dart';
import 'package:ai_chatboat/screens/bottomNavigationBar/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  bool isAppbarActive;
  HomeScreen(
      {super.key, required this.onThemeChanged, required this.isAppbarActive});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAppbarActive
          ? AppBar(
              elevation: 0,
              title: Row(
                children: [
                  GradientText(
                    "Ai ",
                    style: const TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    colors: const [Color(0xFF9648E8), Color(0xFF4634E5)],
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Type Keyboard",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              actions: [
                Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: widget.onThemeChanged,
                  activeColor: Colors.deepPurple,
                  inactiveThumbColor: Colors.grey,
                ),
                TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset("assets/svg/setting.svg"))
              ],
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset("assets/svg/home_chat_logo.svg"),
            FittedBox(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AiChatScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/png/gridbg.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.2))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SvgPicture.asset("assets/svg/ai_chat_logo.svg"),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GradientText(
                                "Ai ",
                                style: const TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                ),
                                colors: const [
                                  Color(0xFF9648E8),
                                  Color(0xFF4634E5)
                                ],
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Chat",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 27,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    "ttttt",
                                    style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 27,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.transparent),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text(
                            "Smart AI for seamless\nconversations",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFFB1B1B1)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? "assets/svg/next.svg"
                                      : "assets/svg/light_next.svg")),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationBarScreen(
                            onThemeChanged: widget.onThemeChanged,
                          ),
                        ),
                        // Keep the last route (the one that is being navigated to)
                        (Route<dynamic> route) => route
                            .isFirst, // This keeps the last route and removes others
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/png/gridbg.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.2))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SvgPicture.asset("assets/svg/ai_assistant.svg"),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GradientText(
                                "Ai ",
                                style: const TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                ),
                                colors: const [
                                  Color(0xFF9648E8),
                                  Color(0xFF4634E5)
                                ],
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                "Assistant",
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Smart AI for engaging\ninteractions",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFFB1B1B1)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? "assets/svg/next.svg"
                                      : "assets/svg/light_next.svg")),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/png/gridbg.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.2))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/svg/ai_chat_logo.svg"),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GradientText(
                                        "Ai ",
                                        style: const TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 27,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        colors: const [
                                          Color(0xFF9648E8),
                                          Color(0xFF4634E5)
                                        ],
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(
                                        "Chat",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 27,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Smart AI for seamless\nconversations",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFFB1B1B1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? "assets/svg/next.svg"
                                      : "assets/svg/light_next.svg")),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
