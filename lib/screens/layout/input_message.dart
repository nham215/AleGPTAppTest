import 'package:flutter/material.dart';

class InputMessage extends StatefulWidget {
  final bool isSendMessage;
  final Function(String mesage) handleSendMessage;
  const InputMessage(
      {Key? key, required this.isSendMessage, required this.handleSendMessage})
      : super(key: key);

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final messageController = TextEditingController();

  Future<void> sendAndHandleMessage(String message) async {
    await widget.handleSendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: TextField(
        controller: messageController,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          suffixIcon: GestureDetector(
            onTap: () {
              if (messageController.text.isNotEmpty) {
                sendAndHandleMessage(messageController.text)
                    .then((_) => {messageController.clear()});
              }
            },
            child: widget.isSendMessage
                ? const Icon(
                    Icons.stop_circle_outlined,
                    color: Color(0xFF1E8F8E),
                  )
                : const Icon(
                    Icons.send,
                    color: Color(0xFF1E8F8E),
                  ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF3D3737)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xFF1E8F8E),
              width: 2.0,
            ),
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintText: 'Message chat...',
        ),
      ),
    );
  }
}
