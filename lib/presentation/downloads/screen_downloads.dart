import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          _SmartDownloads(),
          SizedBox(height: 50),
          body1(),
          SizedBox(height: 50),
          body2()
        ]),
      ),
    );
  }
}

class body2 extends StatelessWidget {
  const body2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kButtonWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              color: kButtonBlueColor,
            ),
          ),
        ),
        kheight,
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              'See What You Can Download',
              style: TextStyle(
                  color: kButtonBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            color: kWhiteColor,
          ),
        )
      ],
    );
  }
}

class body1 extends StatelessWidget {
  body1({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Introducing Downloads for you',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        kheight,
        Text(
          textAlign: TextAlign.center,
          'We\'ll Download a personalised selection of\nmovies and shows for you. SO there\'s\nalways something to watch on your\ndevice.',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: kGreyTextColor),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: 300,
            child: state.isLoading
                ? Center(child: const CircularProgressIndicator())
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 140,
                        backgroundColor: kGreyColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 160, top: 20),
                        child: Transform.rotate(
                          angle: 20 * pi / 180,
                          child: Container(
                            width: 125,
                            height: 187,
                            decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '$imageAppendUrl${state.downloads?[2].posterPath}'),
                                    fit: BoxFit.cover)),
                            //child: //Image.network(()) //(Images[0]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 160, top: 20),
                        child: Transform.rotate(
                          angle: -20 * pi / 180,
                          child: Container(
                            width: 125,
                            height: 187,
                            decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '$imageAppendUrl${state.downloads?[1].posterPath}'),
                                    fit: BoxFit.cover)),
                            //child: //Image.network(()) //(Images[0]),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: 0,
                        child: Container(
                          width: 143.75,
                          height: 215.05,
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '$imageAppendUrl${state.downloads?[0].posterPath}'),
                                  fit: BoxFit.cover)),
                          //child: //Image.network(()) //(Images[0]),
                        ),
                      )
                    ],
                  ),
          );
        }),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
