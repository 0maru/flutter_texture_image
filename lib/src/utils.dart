import 'dart:convert';
import 'dart:math';

String createCryptoRandomString([int length = 32]) {
  var values = List<int>.generate(length, (i) => Random.secure().nextInt(256));

  return base64Url.encode(values);
}
