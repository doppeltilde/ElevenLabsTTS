import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'elevenlabs_platform_interface.dart';

/// An implementation of [ElevenlabsPlatform] that uses method channels.
class MethodChannelElevenlabs extends ElevenlabsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('elevenlabs');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
