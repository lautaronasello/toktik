import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videosList;
  const VideoScrollableView({super.key, required this.videosList});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: videosList.length,
        itemBuilder: (context, index) {
          final VideoPost videoPost = videosList[index];
          return Stack(
            children: [
              SizedBox.expand(
                child: FullscreenPlayer(
                  videoUrl: videoPost.videoUrl,
                  caption: videoPost.caption,
                ),
              ),
              Positioned(
                  bottom: 40, right: 20, child: VideoButtons(video: videoPost))
            ],
          );
        });
  }
}
