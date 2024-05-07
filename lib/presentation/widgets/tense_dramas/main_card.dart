import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  final int index;
  MainCard({
    super.key,
    required this.index,
  });

  final List TenseDramaPosterPath = [
    "/dY98PkUAbIGUUg0FhXEcOkbzHIZ.jpg",
    "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg",
    "/gxVcBc4VM0kAg9wX4HVg6KJHG46.jpg",
    "/eacWm6jPrjkpqhi4VzwqYeJWL6k.jpg",
    "/wTW2t8ocWDlHns8I7vQxuqkyK58.jpg",
    "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    "/jFK2ZLQUzo9pea0jfMCHDfvWsx7.jpg",
    "/zDi2U7WYkdIoGYHcYbM9X5yReVD.jpg",
    "/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
    "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
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
                  '$imageAppendUrl${TenseDramaPosterPath[index]}'
                  //'https://image.tmdb.org/t/p/original/czembW0Rk1Ke7lCJGahbOhdCuhV.jpg'
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
