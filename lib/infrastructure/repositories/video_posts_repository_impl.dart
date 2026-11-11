

import 'package:swipe_videos/domain/datasources/video_posts_datasource.dart';
import 'package:swipe_videos/domain/entities/video_post.dart';
import 'package:swipe_videos/domain/repositories/video_posts_repository.dart';

class VideoPostRepositoryImpl implements VideoPostsRepository {
  final VideoPostsDatasource datasource;

  VideoPostRepositoryImpl({required this.datasource});


  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return datasource.getTrendingVideosByPage(page);
  }
  
}