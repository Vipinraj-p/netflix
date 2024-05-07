import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 TV Shows in India Today'),
        LimitedBox(
          maxHeight: 220,
          child: ListView(
            padding: EdgeInsets.only(top: 10),
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => NumberCard(index: index)),
          ),
        )
      ],
    );
  }
}
