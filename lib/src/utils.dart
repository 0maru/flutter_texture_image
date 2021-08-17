import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';

String createCryptoRandomString([int length = 32]) {
  final values = List<int>.generate(length, (i) => Random.secure().nextInt(256));

  return base64Url.encode(values);
}

typedef PlaceholderWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
);

typedef LoadingErrorWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
  dynamic error,
);
