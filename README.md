
# LoggerLite 📝

**LoggerLite** is a customizable logging package for Dart and Flutter projects, designed to make your logs more informative and organized by adding emojis, file locations, timestamps, and pretty-printed JSON.

## Features

- Supports multiple log levels: Debug 🐞, Info ℹ️, Warning ⚠️, and Error ❌.
- Automatically includes timestamps and caller location in the logs.

## Getting Started

### Installation

1. Add the following to your `pubspec.yaml`:

    ```yaml
    dependencies:
      logger_lite: latest_version
    ```

2. Run ```flutter pub get``` in your terminal to install the package.


## Usage
Import the package in your Dart file:
```
import 'package:logger_lite/logger_lite.dart;
```

You can easily log messages with different log levels:
```
LoggerLite.log('This is a debug message.');
LoggerLite.log('This is an info message.', logType: LogType.info);
LoggerLite.log('This is a warning message.', logType: LogType.warning);
LoggerLite.log('This is a error message.', logType: LogType.error);
```

## Contributing
Feel free to open issues or submit PRs on [Github](https://github.com/JeetDev24/smart_logger).
