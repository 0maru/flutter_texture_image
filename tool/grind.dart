import 'dart:io';

import 'package:grinder/grinder.dart';

main(List<String> args) => grind(args);

@DefaultTask('')
void task() => streamProcessLog('grind', ['-h']);

/// Run generate pigeon code.
///
/// flutter pub run pigeon --input pigeons/messages.dart
@Task('generate pigeon')
Future<void> generate() async {
  streamProcessLog(
    'flutter',
    [
      'pub',
      'run',
      'pigeon',
      '--input',
      'pigeons/messages.dart',
    ],
  );
}

Future<void> streamProcessLog(
  String executable,
  List<String> arguments,
) async {
  final process = await Process.start(executable, arguments);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
}
