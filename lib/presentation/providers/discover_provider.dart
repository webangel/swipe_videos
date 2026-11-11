import 'package:flutter/material.dart';
import 'package:swipe_videos/domain/entities/video_post.dart';
import 'package:swipe_videos/infrastructure/models/local_video_model.dart';
import 'package:swipe_videos/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:swipe_videos/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepositoryImpl videoPostRepositoryImpl;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepositoryImpl});

  Future<void> loadNextPage() async {
    
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoPostRepositoryImpl.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
