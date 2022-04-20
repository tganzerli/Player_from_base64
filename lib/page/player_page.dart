import 'package:errovideo/stores/core_store.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  CoreStore coreStore = CoreStore();
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(coreStore.videoPath)
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
