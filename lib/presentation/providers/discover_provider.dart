import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
//TODO:_Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videosList = [];

  Future<void> loadNextPage() async {
    //todo: cargar videos
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    videosList.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
