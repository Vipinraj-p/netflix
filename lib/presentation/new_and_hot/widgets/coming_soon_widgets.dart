import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          height: 470,
          width: 60,
          child: Column(
            children: [
              Text(
                month,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60),
              ),
              Text(
                day,
                style: TextStyle(
                    letterSpacing: 5,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 470,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//video img
              VideoWidget(Url: '$imageAppendUrl$posterPath'),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            letterSpacing: -3,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    CustomButtonWidget(
                      icon: Icons.notifications_none_outlined,
                      title: 'Remind Me',
                      TextColor: Colors.white54,
                      iconSize: 25,
                      textSize: 14,
                    ),
                    kwidth20,
                    CustomButtonWidget(
                      icon: Icons.info_outline,
                      title: 'Info',
                      TextColor: Colors.white54,
                      iconSize: 25,
                      textSize: 14,
                    ),
                  ],
                ),
              ),
              Text(
                'Coming on $day $month',
                style: TextStyle(
                    //letterSpacing: -3,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60),
              ),
              kheight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 20),
                child: Text(
                  description,
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white38),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
