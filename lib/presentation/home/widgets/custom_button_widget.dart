import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 16,
      this.TextColor = Colors.white});
  final double iconSize;
  final double textSize;
  final Color TextColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: Colors.white,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize, color: TextColor),
        )
      ],
    );
  }
}
