import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _CustomIconButton(
            value: video.likes,
            iconData: Icons.favorite,
            iconColor: Colors.red,
          ),
          _CustomIconButton(
            value: video.views,
            iconData: Icons.remove_red_eye_outlined,
          ),
          const _CustomIconButton(
              value: 0, iconData: Icons.share, textLabel: 'Share'),
          const _SpinWithBox()
        ],
      ),
    );
  }
}

class _SpinWithBox extends StatelessWidget {
  const _SpinWithBox();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_outline,
                size: 35,
                color: Colors.blue.shade400,
              )),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;
  final String? text;
  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor, textLabel})
      : color = iconColor ?? Colors.white,
        text = textLabel ?? '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 05,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 35,
            )),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble())),
        if (text!.isNotEmpty) Text(text!)
      ],
    );
  }
}
