import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/SplashScreen.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/domain/core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
      BlocProvider(create: (ctx) => getIt<SearchBloc>()),
      BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
      BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
    ],
    // child: Container(),

    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
            ),
            scaffoldBackgroundColor: background_Color,
            textTheme: TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white))),
        home: SpalashScreen()),
  ));
}
