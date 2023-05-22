import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool autoGrow;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.autoGrow = true});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
    Widget button = TextButton(
      style: raisedButtonStyle,
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
    return autoGrow
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [button],
            ),
          )
        : button;
  }
}
