// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './change_view.dart';

/// The widget demonstrates how to use [MethodChannel] to invoke platform methods.
/// It has two [ElevatedButton]s to increment and decrement the value of
/// [count], and a [Text] widget to display its value.
class MethodChannelDemo extends StatefulWidget {
  const MethodChannelDemo({super.key});

  @override
  State<MethodChannelDemo> createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MethodChannel Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Whenever users press the ElevatedButton, it invokes
              // Counter.increment method to increment the value of count.
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    final value = await ChangeView.goToReact();
                  } catch (error) {
                    showErrorMessage(
                      context,
                      (error as PlatformException).message!,
                    );
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Go To React'),
              ),
            ],
          )
        ],
      ),
    );
  }

  void showErrorMessage(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }
}
