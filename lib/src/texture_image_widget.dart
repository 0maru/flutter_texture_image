import 'package:flutter/cupertino.dart';
import 'package:flutter_texture_image/src/texture_image_plugin.dart';
import 'package:flutter_texture_image/src/utils.dart';

class TextureImage extends StatefulWidget {
  const TextureImage(
    this.url, {
    required this.width,
    required this.height,
    this.freeze = false,
    this.filterQuality = FilterQuality.low,
    this.placeholder,
    this.errorWidget,
  });

  final String url;

  /// If non-null, require the image to have this width.
  final double width;

  /// If non-null, require the image to have this height.
  final double height;

  /// When true the texture will not be updated with new frames.
  final bool freeze;

  /// The quality of sampling the texture and rendering it on screen.
  final FilterQuality filterQuality;

  ///
  final PlaceholderWidgetBuilder? placeholder;

  ///
  final LoadingErrorWidgetBuilder? errorWidget;

  @override
  _TextureImageState createState() => _TextureImageState();
}

class _TextureImageState extends State<TextureImage> {
  int? textureId;
  bool failedRender = false;

  @override
  void initState() {
    super.initState();
    _render();
  }

  @override
  void dispose() {
    TextureImagePlugin.dispose();
    super.dispose();
  }

  Future<void> _render() async {
    final _textureId = await TextureImagePlugin.render(
      widget.url,
      width: widget.width,
      height: widget.height,
    );
    if (_textureId == null) {
      setState(() {
        failedRender = true;
      });
      return;
    }

    if (mounted) {
      setState(() {
        textureId = _textureId;
      });
    } else {
      textureId = null;
    }
  }

  @override
  void didUpdateWidget(covariant TextureImage oldWidget) {
    if (widget.url != oldWidget.url ||
        widget.width != oldWidget.width ||
        widget.height != oldWidget.height ||
        widget.freeze != oldWidget.freeze ||
        widget.filterQuality != oldWidget.filterQuality) {
      // TODO: relaod
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final buildLoadingErrorBuilder = widget.placeholder != null ? _buildLoadingErrorBuilder : null;
    final builderPlaceholderBuilder = widget.placeholder != null ? _buildPlaceholderBuilder : null;
    if (failedRender) {
      return _buildLoadingErrorBuilder(context);
    }
    return _buildTextureImageBuilder(context);
  }

  Widget _buildTextureImageBuilder(BuildContext context) {
    if (textureId != null) {
      return Text('${textureId}');
      // return Texture(textureId: textureId!);
    }
    return const SizedBox.shrink();
  }

  Widget _buildPlaceholderBuilder(BuildContext context) {
    return widget.placeholder!(context, widget.url);
  }

  Widget _buildLoadingErrorBuilder(BuildContext context) {
    return widget.errorWidget!(context, widget.url, '');
  }
}
