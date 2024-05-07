import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class VideoWidget extends StatelessWidget {
  final String Url;
  const VideoWidget({
    super.key,
    required this.Url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 205,
            width: double.infinity,
            child: Image.network(
              Url,
              fit: BoxFit.cover,
            )),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black45,
              child: Icon(
                Icons.volume_off_outlined,
                color: kWhiteColor,
                size: 25,
              )),
        ),
      ],
    );
  }
}
