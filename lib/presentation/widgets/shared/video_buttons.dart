import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:swipe_videos/config/helpers/human_formats.dart';
import 'package:swipe_videos/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          icon: Icons.favorite,
          iconColor: Colors.red,
          value: video.likes,
        ),
        _CustomIconButton(
          icon: Icons.remove_red_eye_outlined,
          value: video.views,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomIconButton(icon: Icons.play_circle_outline, value: 0),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  // final VoidCallback onPressed;
  final Color? color;
  final int value;

  const _CustomIconButton({required this.icon, iconColor, required this.value})
    : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: color, size: 40),
        ),
        if (value > 0)
          Text(
            HumanFormats.formatNumber(value.toDouble()),
            style: const TextStyle(color: Colors.white),
          ),
      ],
    );
  }
}
