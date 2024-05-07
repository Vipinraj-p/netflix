import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(SearchEvent.initialize());
    });
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 217,
            ),
            BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return Text('Error while getting data');
              } else if (state.idleList.isEmpty) {
                return Text('List is empty');
              } else {
                final movie = state.idleList[index];
                return Container(
                  width: 145,
                  height: 217,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: Radius10,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage('$imageAppendUrl${movie.posterPath}')),
                  ),
                );
              }
            }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: StrokeText(
            strokeWidth: 3,
            strokeColor: Colors.white,
            text: '${index + 1}',
            textStyle: TextStyle(
              fontSize: 110,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
