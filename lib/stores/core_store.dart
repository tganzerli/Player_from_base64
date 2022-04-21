import 'dart:convert';
import 'dart:io';

import 'package:errovideo/base64/video_base64.dart';
import 'package:errovideo/services/path_provider_service.dart';

class CoreStore {
  PathProvider pathProvider = PathProvider();
  Base64 base64 = Base64();

  String videoPath = '';

  Future<void> saveVideo() async {
    final String _getPath = await pathProvider.getPath();
    final Directory _videoPath = Directory('$_getPath/video');
    final bool _videoPathExist = await _videoPath.exists();
    if (!_videoPathExist) {
      await _videoPath.create();
    }
    videoPath = '${_videoPath.path}/teste.mp4';
    final decodedBytes = base64Decode(base64.video);
    var fileVideo = File(videoPath);
    await fileVideo.writeAsBytes(decodedBytes);
  }
}
