import 'package:flutter/services.dart';
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

  static Future<int?> createTextureId(
    String url, {
    required double width,
    required double height,
  }) async {
    try {
      final base64 = await _imageChannel.invokeMethod('createTextureImage');
      return null;
    } on Exception {
      return null;
    }
  }

  static Future<void> destroy() async {
    try {
      _imageChannel.invokeMethod('destroy');
      return null;
    } on Exception {
      return null;
    }
  }
}
