import 'package:swipe_videos/domain/datasources/video_posts_datasource.dart';
import 'package:swipe_videos/domain/entities/video_post.dart';
import 'package:swipe_videos/infrastructure/models/local_video_model.dart';
import 'package:swipe_videos/shared/data/local_video_posts.dart';

class LocalVideoDataSource implements VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 1));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
