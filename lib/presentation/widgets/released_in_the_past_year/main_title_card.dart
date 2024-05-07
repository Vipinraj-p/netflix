import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/released_in_the_past_year/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCardReleasedInThePastYear extends StatelessWidget {
  final String title;
  const MainTitleCardReleasedInThePastYear({super.key, required this.title});

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
            children: List.generate(10, (index) => MainCard(index: index)),
          ),
        )
      ],
    );
  }
}
