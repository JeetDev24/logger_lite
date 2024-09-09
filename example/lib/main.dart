import 'package:flutter/material.dart';
import 'package:logger_lite/logger_lite.dart';

void main() {}

class SmartLoggerExample extends StatelessWidget {
  const SmartLoggerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LoggerLite Example',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            LoggerLite.log('Logging From LoggerLite');
          },
          child: const Text("Log Data"),
        ),
      ),
    );
  }
}
