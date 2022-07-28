// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';

class ChangeView {
  /// Creates a [MethodChannel] with the specified name to invoke platform method.
  /// In order to communicate across platforms, the name of MethodChannel
  /// should be same on native and dart side.
  static MethodChannel methodChannel = const MethodChannel('methodChannelDemo');

  /// This method is responsible.
  static Future<int> goToReact() async {
    final result = await methodChannel
        .invokeMethod<int>('goToReact', {'state': 0});
    return result!;
  }
}
