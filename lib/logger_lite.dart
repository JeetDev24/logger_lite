library logger_lite;

import 'dart:convert';

class LoggerLite {
  static int consoleWidth = 100;

  static const String debugEmoji = '🐞';
  static const String infoEmoji = 'ℹ️';
  static const String warningEmoji = '⚠️';
  static const String errorEmoji = '❌';

  static void log(dynamic message, {LogType logType = LogType.debug}) {
    final timestamp = DateTime.now().toIso8601String();
    final levelTag = _levelToEmoji(logType);
    final location = _getCallerLocation();
    final prettyMessage = _prettyPrintJson(message);
    final separator = _generateCustomSeparator();
    print(separator);
    print('[$location] [$timestamp]');
    print(separator);
    _printLogWithPrefixEmoji(prettyMessage, levelTag);
    print(separator);
  }

  static String _levelToEmoji(LogType type) {
    switch (type) {
      case LogType.debug:
        return debugEmoji;
      case LogType.info:
        return infoEmoji;
      case LogType.warning:
        return warningEmoji;
      case LogType.error:
        return errorEmoji;
      default:
        return '❓'; // Unknown level emoji
    }
  }

  static String _getCallerLocation() {
    try {
      final stackTrace = StackTrace.current;
      final frames = stackTrace.toString().split('\n');

      final frame = frames[2];

      final regex = RegExp(r'#\d+\s+(.+)\s+\((.+):(\d+):(\d+)\)');
      final match = regex.firstMatch(frame);

      if (match != null) {
        final filePath = match.group(2) ?? 'unknown_file';
        final lineNumber = match.group(3) ?? 'unknown_line';

        final fileName = filePath.split('/').last;
        final packagePath = 'package:custom_logger/$fileName';

        return '$packagePath:$lineNumber';
      }
    } catch (e) {
      return 'unknown_location';
    }
    return 'unknown_location';
  }

  static String _generateCustomSeparator() {
    final maxLength = consoleWidth;
    final lineLength = maxLength - 2;

    final separator = '•~' * (lineLength ~/ 2);

    return separator.trimRight();
  }

  static void _printLogWithPrefixEmoji(String message, String emoji) {
    final lines = message.split('\n');
    for (var line in lines) {
      print('[$emoji] $line');
    }
  }

  static String _prettyPrintJson(dynamic json) {
    try {
      if (json is Map || json is List) {
        final encoder = JsonEncoder.withIndent(' ' * 4);
        final jsonString = encoder.convert(json);

        return jsonString;
      } else {
        return json.toString();
      }
    } catch (e) {
      return json.toString();
    }
  }
}


enum LogType { debug, info, warning, error }
