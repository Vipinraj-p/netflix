import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final VideoUrl = dummyvideoURLs[index % dummyvideoURLs.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(VideoUrl: VideoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Left Side
                // IconButton(
                //     onPressed: () {
                //       final videocls = _FastLaughVideoPlayerState();
                //       videocls.MuteAndUnmute();
                //     },
                //     icon: CircleAvatar(
                //         radius: 30,
                //         backgroundColor: Colors.black45,
                //         child: Icon(
                //           Icons.volume_off_outlined,
                //           color: kWhiteColor,
                //           size: 30,
                //         ))),

                //Right Side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPath'),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideoIdsNotifier,
                      builder: (BuildContext context, Set<int> newLikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              //BlocProvider.of<FastLaughBloc>(context).add(UnLikeVideo(id: _index));

                              likedVideoIdsNotifier.value.remove(_index);
                              likedVideoIdsNotifier.notifyListeners();
                            },
                            child: VideoActionsWidgets(
                              icon: Icons.favorite,
                              title: 'Liked',
                              color: Colors.red,
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context).add(LikeVideo(id: _index));

                            likedVideoIdsNotifier.value.add(_index);
                            likedVideoIdsNotifier.notifyListeners();
                          },
                          child: VideoActionsWidgets(
                              icon: Icons.emoji_emotions, title: 'LOL'),
                        );
                      },
                    ),
                    VideoActionsWidgets(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                      onTap: () {
                        Share.share(VideoUrl);
                      },
                      child: VideoActionsWidgets(
                          icon: Icons.near_me_outlined, title: 'Share'),
                    ), //send_sharp
                    VideoActionsWidgets(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidgets({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.white,
  });
  final color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: color,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String VideoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.VideoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = //VideoPlayerController.network(widget.VideoUrl);
        VideoPlayerController.networkUrl(Uri.parse(widget.VideoUrl));
    log(widget.VideoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });

    super.initState();
  }

  void PlayPause() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
      } else {
        _videoPlayerController.play();
      }
    });
  }

  var muteIcon = Icon(
    Icons.volume_off_outlined,
    color: kWhiteColor,
    size: 30,
  );

  void MuteAndUnmute() {
    setState(() {
      if (_videoPlayerController.value.volume != 0) {
        _videoPlayerController.setVolume(0);
        muteIcon = Icon(
          Icons.volume_off_outlined,
          color: kWhiteColor,
          size: 30,
        );
      } else {
        _videoPlayerController.setVolume(1);
        muteIcon = Icon(
          Icons.volume_up,
          color: kWhiteColor,
          size: 30,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onTap: PlayPause,
            child: SizedBox(
                width: double.infinity,
                child: _videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: IconButton(
              onPressed: () {
                MuteAndUnmute();
              },
              icon: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black45,
                  child: muteIcon)),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
