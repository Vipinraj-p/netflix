import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/released_in_the_past_year/main_title_card.dart';
import 'package:netflix/presentation/widgets/south_indian_cinemas/main_title_card.dart';
import 'package:netflix/presentation/widgets/tense_dramas/main_title_card.dart';
import 'package:netflix/presentation/widgets/trending_now/main_title_card.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: ScrollNotifier,
      builder: (BuildContext context, value, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              ScrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              ScrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  BackgroundCard(),
                  kheight20,
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        MainTitleCardReleasedInThePastYear(
                            title: 'Released in the Past Year'),
                        kheight20,
                        MainTitleCardTrendingNow(title: 'Trending Now'),
                        kheight20,
                        NumberTitleCard(),
                        kheight20,
                        MainTitleCardTenseDramas(title: 'Tense Dramas'),
                        kheight20,
                        MainTitleCardSouthIndianCinemas(
                            title: 'South Indian Cinemas'),
                      ],
                    ),
                  ),
                ],
              ),
              ScrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 5000),
                      width: double.infinity,
                      height: 90,
                      //color: Colors.amber,
                      // color: Colors.transparent,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              kwidth,
                              Image.asset(
                                'asset/logo/netflixlogo.png',
                                scale: 30,
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
                          ),
                          kheight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('TV Shows', style: HomeTileText),
                              Text('Movies', style: HomeTileText),
                              Row(
                                children: [
                                  Text('Categories', style: HomeTileText),
                                  Icon(Icons.arrow_drop_down,
                                      size: 28, color: Colors.white)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : kheight
            ],
          ),
        );
      },
    ));
  }
}
