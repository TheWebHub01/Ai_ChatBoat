import 'package:ai_chatboat/screens/cannedMessage/canned_message_list_screen.dart';
import 'package:ai_chatboat/screens/tools/reply/reply_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const ToolsScreen({super.key, required this.onThemeChanged});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  List toolsList = [
    {
      'image': "assets/svg/canned_message.svg",
      "name": "Canned Message",
    },
    {
      'image': "assets/svg/notes.svg",
      "name": "Notes",
    },
    {
      'image': "assets/svg/clipboard.svg",
      "name": "Clipboard",
    },
    {
      'image': "assets/svg/my_prompts.svg",
      "name": "My Prompts",
    },
    {
      'image': "assets/svg/reply.svg",
      "name": "Reply",
    },
    {
      'image': "assets/svg/keyboard_reply.svg",
      "name": "Keyboard Reply",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          for (int i = 0; i < toolsList.length; i++)
            GestureDetector(
              onTap: () {
                if (toolsList[i]['name'] == "Canned Message") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CannedMessageListScreen()));
                }
                if (toolsList[i]['name'] == "Reply") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReplyScreen()));
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      const Color(0xFF9247E7).withOpacity(0.2),
                      const Color(0xFF4D35E5).withOpacity(0.2),
                    ])),
                child: Row(
                  children: [
                    SvgPicture.asset(toolsList[i]['image']),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      toolsList[i]['name'],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
