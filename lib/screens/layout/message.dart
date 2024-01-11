import 'package:flutter/material.dart';
import 'package:learn/model/message.dart';
import 'package:clipboard/clipboard.dart';

class Message extends StatefulWidget {
  final MessageModel message;
  const Message({Key? key, required this.message}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool _isCopy = false;
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
                  ? Icon(
                      Icons.account_circle,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Icon(
                      Icons.support_agent,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.message.senderType == 'user' ? 'You' : 'Mina',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        widget.message.content,
                        softWrap: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                    widget.message.senderType == 'user'
                        ? Row(
                            children: [
                              Icon(
                                Icons.border_color_rounded,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 14,
                              )
                            ],
                          )
                        : const SizedBox(),
                    widget.message.senderType == 'bot'
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isCopy = true;
                                  });
                                  FlutterClipboard.copy(widget.message.content)
                                      .then((value) {
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      setState(() {
                                        _isCopy = false;
                                      });
                                    });
                                  });
                                },
                                child: _isCopy
                                    ? Icon(
                                        Icons.check,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        size: 16,
                                      )
                                    : Icon(
                                        Icons.content_paste,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        size: 16,
                                      ),
                              ),
                              const SizedBox(width: 8.0),
                              Icon(
                                Icons.thumb_up_off_alt_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 18,
                              ),
                              const SizedBox(width: 8.0),
                              Icon(
                                Icons.thumb_down_off_alt_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 18,
                              ),
                              const SizedBox(width: 8.0),
                              Icon(
                                Icons.replay_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 18,
                              ),
                            ],
                          )
                        : const SizedBox()
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
