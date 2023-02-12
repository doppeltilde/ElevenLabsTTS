import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'elevenlabs_method_channel.dart';

abstract class ElevenlabsPlatform extends PlatformInterface {
  /// Constructs a ElevenlabsPlatform.
  ElevenlabsPlatform() : super(token: _token);

  static final Object _token = Object();

  static ElevenlabsPlatform _instance = MethodChannelElevenlabs();

  /// The default instance of [ElevenlabsPlatform] to use.
  ///
  /// Defaults to [MethodChannelElevenlabs].
  static ElevenlabsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ElevenlabsPlatform] when
  /// they register themselves.
  static set instance(ElevenlabsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
