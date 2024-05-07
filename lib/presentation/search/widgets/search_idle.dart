import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return Text('Error while getting data');
              } else if (state.idleList.isEmpty) {
                return Text('List is empty');
              } else {
                return ListView.separated(
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearches(
                        title: movie.title ?? 'No title Provided',
                        imageURL: '$imageAppendUrl${movie.posterPath}');
                  },
                  separatorBuilder: (ctx, index) => kheight,
                  itemCount: state.idleList.length,
                  shrinkWrap: true,
                );
              }
            },
          ),
        )
      ],
    );
  }
}

class TopSearches extends StatelessWidget {
  final String title;
  final String imageURL;
  const TopSearches({super.key, required this.title, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white24,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageURL),
              )),
        ),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        )),
        Icon(
          Icons.play_circle_outline_outlined,
          color: Colors.white60,
          size: 50,
        )
      ],
    );
  }
}
