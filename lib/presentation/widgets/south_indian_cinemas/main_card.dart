import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  final int index;
  MainCard({
    super.key,
    required this.index,
  });
  final List SouthIndianCinemaPosterPath = [
    "/6WxsV3fdvqqKuCkYoWNVzgaik9L.jpg",
    "/q8UfM4H5Z8nSXomlXgHxRtwznVx.jpg",
    "/tALEStUhrsNx0xvC9psLkey2O0A.jpg",
    "/eVcOSgM2mrsQ6Kqp93adTgK2uIy.jpg",
    "/iZoLfix1ijLZVbyztcM1AICRiSJ.jpg",
    "/iUgeT99RHVdqkExrW7X0poE0BIB.jpg",
    "/n1pDcXST1I137DcUjWUv1Ar13TW.jpg",
    "/hlVn1K8fdCLOux8nxwQa0yI2mTg.jpg",
    "/eorz05QeNzVp8fm10pIQb3lBKwp.jpg",
    "/e7E9mFsCwm6s5k0akviOIuVIKIU.jpg",
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
                  '$imageAppendUrl${SouthIndianCinemaPosterPath[index]}'
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
