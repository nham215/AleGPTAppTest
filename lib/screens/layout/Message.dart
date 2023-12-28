import 'package:flutter/material.dart';
import 'package:learn/model/Message.dart';

class Message extends StatefulWidget {
  final MessageModel message;
  const Message({Key? key, required this.message}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 15,
              child: widget.message.senderType == 'user'
                  ? const Text('N')
                  : const Icon(
                      Icons.logo_dev_outlined,
                      color: Colors.black,
                    ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        widget.message.senderType == 'user' ? 'You' : 'Mina',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      widget.message.content,
                      softWrap: true,
                      style: const TextStyle(
                        color: Color(0xFFD1D5DB),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
