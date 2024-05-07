import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';
import 'package:share_plus/share_plus.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight,
          Text(
            movieName,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: Text(
              description,
              maxLines: 4,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white38),
            ),
          ),
          kheight50,
          VideoWidget(
            Url: '$posterPath',
          ),
          kheight20,
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GestureDetector(
              onTap: () {
                Share.share('$posterPath');
              },
              child: CustomButtonWidget(
                icon: Icons.near_me_outlined,
                title: 'Share',
                textSize: 12,
                iconSize: 30,
                TextColor: kGreyColor,
              ),
            ),
            kwidth20,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              textSize: 12,
              iconSize: 30,
              TextColor: kGreyColor,
            ),
            kwidth20,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              textSize: 12,
              iconSize: 30,
              TextColor: kGreyColor,
            ),
          ])
        ],
      ),
    );
  }
}
