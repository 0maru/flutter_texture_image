import 'package:flutter/cupertino.dart';

class TextureImage extends StatefulWidget {
  const TextureImage(
    this.url, {
    required this.width,
    required this.height,
  });

  final String url;
  final double width;
  final double height;

  @override
  _TextureImageState createState() => _TextureImageState();
}

class _TextureImageState extends State<TextureImage> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
