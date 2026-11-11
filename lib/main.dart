import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_videos/config/theme/app_theme.dart';
import 'package:swipe_videos/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:swipe_videos/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:swipe_videos/presentation/providers/discover_provider.dart';
import 'package:swipe_videos/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostRepositoryImpl(
      datasource: LocalVideoDataSource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              DiscoverProvider(videoPostRepositoryImpl: videoPostRepository)
                ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Swiper Video',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
