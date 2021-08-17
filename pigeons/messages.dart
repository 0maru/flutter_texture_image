import 'package:pigeon/pigeon.dart';

class TextureMessage {
  late int textureId;
}

class NetworkImageMessage {
  late String url;
  late double width;
  late double height;
}

@HostApi()
abstract class TextureImageApi {
  TextureMessage createTextureImage(NetworkImageMessage msg);

  void dispose(TextureMessage msg);
}

void configurePigeon(PigeonOptions opts) {
  opts.dartOut = 'lib/src/messages.dart';
  opts.objcHeaderOut = 'ios/Classes/messages.h';
  opts.objcSourceOut = 'ios/Classes/messages.m';
  opts.objcOptions.prefix = 'FLT';
  opts.javaOut = 'android/src/main/java/com/toricotokyo/flutter_texture_image/Messages.java';
  opts.javaOptions.package = 'com.toricotokyo.flutter_texture_image';
}
