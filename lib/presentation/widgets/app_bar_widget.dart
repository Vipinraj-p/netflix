import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cast,
              color: kWhiteColor,
            )),
        kwidth,
        Container(
          width: 16,
          height: 16,
          color: Colors.blue,
        ),
        kwidth
      ],
    );
  }
}
