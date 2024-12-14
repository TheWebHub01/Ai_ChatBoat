import 'dart:convert';
import 'package:http/http.dart' as http;

class Apis {
  sendChatMessage(String message) async {
    try {
      // Create the request body
      var response = await http.post(
        Uri.parse('https://chat-gpt26.p.rapidapi.com/'),
        headers: {
          'Content-Type': 'application/json',
          'x-rapidapi-host': 'chat-gpt26.p.rapidapi.com',
          'x-rapidapi-key':
              '6457b5acb4msh2e1bbe43ac098c9p1e75acjsn619ccafdf798',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": message}
          ]
        }),
      );

      // Check for success
      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse and return response
      } else {
        // Handle error response
        return {
          "error": true,
          "message": "Error: ${response.statusCode}, ${response.reasonPhrase}"
        };
      }
    } catch (e) {
      // Handle exceptions
      return {"error": true, "message": e.toString()};
    }
  }
}

Apis apis = Apis();
