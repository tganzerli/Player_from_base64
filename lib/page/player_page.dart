import 'dart:io';
import 'package:flutter/material.dart';
import 'package:playerfrombase64/stores/core_store.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  final CoreStore coreStore;
  const PlayerPage({
    Key? key,
    required this.coreStore,
  }) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.file(File(widget.coreStore.videoPath))
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => controller.play());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? Container(alignment: Alignment.topCenter, child: buildVideoPlayer())
      : const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
