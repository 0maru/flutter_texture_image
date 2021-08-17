import 'package:flutter/services.dart';
import 'package:flutter_texture_image/src/messages.dart';
import 'package:flutter_texture_image/src/utils.dart';

const String METHOD_NAME = 'flutter_texture_image';

class TextureImagePlugin {
  TextureImagePlugin() {
    _id = createCryptoRandomString();
    _imageChannel = MethodChannel('${METHOD_NAME}_${_id}');
  }

  static late String _id;
  static late MethodChannel _imageChannel;
  static const MethodChannel channel = MethodChannel(METHOD_NAME);

  static Future<int?> render(
    String url, {
    required double width,
    required double height,
  }) async {
    try {
      final api = TextureImageApi();
      final arg = NetworkImageMessage()
        ..url = ''
        ..width = 0.0
        ..height = 0.0;
      final result = await api.render(arg);
      return result.textureId;
    } on Exception {
      return null;
    }
  }

  static Future<void> dispose() async {
    try {
      final api = TextureImageApi();
      final arg = TextureMessage()..textureId = 1;
      api.dispose(arg);
      return null;
    } on Exception {
      return null;
    }
  }
}
