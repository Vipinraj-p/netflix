import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});
  final String MainImgUrl =
      'https://image.tmdb.org/t/p/original/wNB551TsEb7KFU3an5LwOrgvUpn.jpg';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              color: Colors.white12,
              image: DecorationImage(
                  image: NetworkImage(MainImgUrl), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonWidget(icon: Icons.add, title: 'My List'),
              _playButton(),
              CustomButtonWidget(icon: Icons.info_outline, title: 'info'),
            ],
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    icon: Icon(
      Icons.play_arrow,
      size: 25,
    ),
    label: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Play',
        style: TextStyle(fontSize: 16),
      ),
    ),
    style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.black),
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
  );
}
