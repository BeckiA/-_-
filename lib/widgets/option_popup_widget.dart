import 'package:flutter/material.dart';

class OptionPopup extends StatelessWidget {
  OptionPopup({super.key, required this.message, required this.icon});

  String message;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Text(message),
          const SizedBox(
            width: 20,
          ),
          Icon(icon)
        ],
      ),
    );
  }
}
