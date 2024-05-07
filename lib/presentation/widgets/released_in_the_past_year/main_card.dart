import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  final int index;
  MainCard({
    super.key,
    required this.index,
  });

  final List ReleasedInThePastYearPosterPath = [
    "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
    "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
    "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
    "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
    "/ow3wq89wM8qd5X7hWKxiRfsFf9C.jpg",
    "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
    "/lfRkUr7DYdHldAqi3PwdQGBRBPM.jpg",
    "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
    "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
    "/8VG8fDNiy50H4FedGwdSVUPoaJe.jpg"
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
              image: NetworkImage(
                  '$imageAppendUrl${ReleasedInThePastYearPosterPath[index]}'
                  //'https://image.tmdb.org/t/p/original/czembW0Rk1Ke7lCJGahbOhdCuhV.jpg',
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
