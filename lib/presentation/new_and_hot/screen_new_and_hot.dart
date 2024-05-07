import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widgets.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:intl/intl.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'New & Hot',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                actions: [
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
                bottom: TabBar(
                  indicatorPadding: EdgeInsets.symmetric(horizontal: -20),
                  unselectedLabelColor: kWhiteColor,
                  labelColor: kblack,
                  labelStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: Radius30,
                  ),
                  tabs: [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: '👀 Everyone\'s Watching',
                    ),
                  ],
                ),
              )
              //AppBarWidget(
              //
              // )
              ),
          body: TabBarView(children: [
            ComingSoonList(
              key: Key('coming_soon'),
            ),
            EveryOneIsWatching(
              key: Key('every_one_is_watching'),
            )
            //_buildEveryonesWatching()
          ])),
    );
  }

  // Widget _buildComingSoon() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
  //   );
  // }

  // Widget _buildEveryonesWatching() {
  //   return ListView.builder(
  //       itemCount: 10, itemBuilder: (BuildContext context, index) => SizedBox()
  //        //EveryonesWatchingWidget(posterPath: posterPath, movieName: movieName, description: description),
  //       );
  // }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          const Center(
            child: Text('Error while loading coming soon list'),
          );
        } else if (state.comingSoonList.isEmpty) {
          const Center(
            child: Text('Coming soon list is empty'),
          );
        } else {
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);
                  print(formatedDate);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No title',
                  description: movie.overview ?? 'No description',
                );
              });
        }

        return SizedBox();
      },
    );
  }
}

class EveryOneIsWatching extends StatelessWidget {
  const EveryOneIsWatching({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          const Center(
            child: Text('Error while loading Everyone\'s watching'),
          );
        } else if (state.everyOneIsWatchingList.isEmpty) {
          const Center(
            child: Text('Everyone\'s watching list is empty'),
          );
        } else {
          return ListView.builder(
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                return EveryonesWatchingWidget(
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalName ?? 'No title',
                  description: movie.overview ?? 'No description',
                );
              });
        }

        return SizedBox();
      },
    );
  }
}
