import 'dart:async';
import 'dart:convert';
import 'package:ai_chatboat/contant/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  _AiChatScreenState createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final StreamController<List<Map<String, String>>> _messageStreamController =
      StreamController<List<Map<String, String>>>.broadcast();

  final List<Map<String, String>> _messages = [];

  final String _baseUrl = "https://chat-gpt26.p.rapidapi.com/";
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'x-rapidapi-host': 'chat-gpt26.p.rapidapi.com',
    'x-rapidapi-key': '6457b5acb4msh2e1bbe43ac098c9p1e75acjsn619ccafdf798',
  };

  @override
  void dispose() {
    _messageController.dispose();
    _messageStreamController.close();
    super.dispose();
  }

  /// Sends a chat message and adds both the user and bot messages to the stream
  Future<void> _sendMessage() async {
    final userMessage = _messageController.text.trim();
    if (userMessage.isEmpty) return;

    // Add user message to the local list
    _messages.add({"sender": "user", "message": userMessage});
    _messageStreamController.add(List.from(_messages));
    _messageController.clear();

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: _headers,
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": userMessage}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botMessage =
            data['choices'][0]['message']['content'] ?? "No response.";
        _messages.add({"sender": "bot", "message": botMessage});
      } else {
        _messages.add({
          "sender": "bot",
          "message": "Error: ${response.statusCode} - ${response.reasonPhrase}"
        });
      }
    } catch (e) {
      _messages.add({"sender": "bot", "message": "Error: $e"});
    }

    // Update the stream
    _messageStreamController.add(List.from(_messages));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        "AI Chat",
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: StreamBuilder<List<Map<String, String>>>(
              stream: _messageStreamController.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Start the conversation!"));
                }

                final messages = snapshot.data!;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isUser = message["sender"] == "user";
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          isUser
                              ? Container()
                              : Image.asset(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? "assets/png/chat_icon_dark.png"
                                      : "assets/png/chat_icon.png",
                                  height: 40,
                                  width: 40,
                                ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF181818)
                                          : Color(0xFFECEBEB))),
                              child: Text(
                                message["message"] ?? "",
                                style: TextStyle(),
                              ),
                            ),
                          ),
                          isUser
                              ? SvgPicture.asset(Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? "assets/png/user_icon_dark.svg"
                                  : "assets/svg/user_icon.svg")
                              : Container(),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Input field
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  keyboardAppearance:
                      Theme.of(context).brightness == Brightness.dark
                          ? Brightness.dark
                          : Brightness.light,
                  controller: _messageController,
                  style: TextStyle(color: Color(0xFF777777), fontSize: 13),
                  decoration: InputDecoration(
                    // fillColor: Color(0xFF9247E7).withOpacity(0.1),
                    filled: true,
                    hintText: "Type your message...",
                    hintStyle:
                        TextStyle(color: Color(0xFF777777), fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Circular border radius
                      borderSide: BorderSide.none, // Removes the border line
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: SvgPicture.asset("assets/svg/send.svg"),
                onPressed: _sendMessage,
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
