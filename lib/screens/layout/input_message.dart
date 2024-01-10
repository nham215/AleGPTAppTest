import 'package:flutter/material.dart';

class InputMessage extends StatefulWidget {
  const InputMessage({super.key});

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: TextField(
        style: const TextStyle(
          color: Color(0xFFFAFAFA),
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
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
