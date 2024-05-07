import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  final int index;
  MainCard({
    super.key,
    required this.index,
  });
  final List TrendingNowPoster = [
    '/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg',
    '/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg',
    '/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg',
    '/cxevDYdeFkiixRShbObdwAHBZry.jpg',
    '/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
    '/fdZpvODTX5wwkD0ikZNaClE4AoW.jpg',
    "/zK2sFxZcelHJRPVr242rxy5VK4T.jpg",
    "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
    "/ldfCF9RhR40mppkzmftxapaHeTo.jpg",
    "/upKD8UbH8vQ798aMWgwMxV8t4yk.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 145,
          height: 217,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: Radius10,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('$imageAppendUrl${TrendingNowPoster[index]}'
                  //'https://image.tmdb.org/t/p/original/czembW0Rk1Ke7lCJGahbOhdCuh.jpg',
                  ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
