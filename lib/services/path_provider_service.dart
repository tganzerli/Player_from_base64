import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PathProvider {
  Future<String> getPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    print(appDocDir.path);
    return appDocDir.path;
  }
}
