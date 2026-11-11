import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_videos/config/theme/app_theme.dart';
import 'package:swipe_videos/presentation/providers/discover_provider.dart';
import 'package:swipe_videos/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage(),
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
