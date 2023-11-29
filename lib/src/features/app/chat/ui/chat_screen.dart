import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(text: 'Hello!', isMe: false),
    Message(text: 'Hi there!', isMe: true),
    Message(text: 'How are you?', isMe: false),
    Message(text: 'I\'m fine, thank you!', isMe: true),
    // Add more messages here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Messages',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          )),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            reverse: true,
            children: [...messages.map((e) => MessageBubble(message: e))],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    counterText: '',
                    counterStyle: const TextStyle(fontSize: 0),
                    hintText: 'Type your message...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // Add other decoration properties as needed
                  ),
                )),
                const Gap.horizontal(width: 5),
                IconButton(
                  icon: const Icon(Icons.send_outlined),
                  onPressed: () {
                    setState(() {
                      if (_controller.text.isNotEmpty) {
                        messages = [
                          Message(isMe: true, text: _controller.text.trim()),
                          ...messages
                        ];
                        _controller.clear();
                      }
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: message.isMe
              ? Theme.of(context).colorScheme.secondary
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: message.isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
