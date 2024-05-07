import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/tense_dramas/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCardTenseDramas extends StatelessWidget {
  final String title;
  const MainTitleCardTenseDramas({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
          maxHeight: 220,
          child: ListView(
            padding: EdgeInsets.only(top: 10),
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => MainCard(
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
