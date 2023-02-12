// TODO!

// import 'package:flutter_test/flutter_test.dart';
// import 'package:elevenlabs/elevenlabs.dart';
// import 'package:elevenlabs/elevenlabs_platform_interface.dart';
// import 'package:elevenlabs/elevenlabs_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockElevenlabsPlatform
//     with MockPlatformInterfaceMixin
//     implements ElevenlabsPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final ElevenlabsPlatform initialPlatform = ElevenlabsPlatform.instance;

//   test('$MethodChannelElevenlabs is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelElevenlabs>());
//   });

//   test('getPlatformVersion', () async {
//     Elevenlabs elevenlabsPlugin = Elevenlabs();
//     MockElevenlabsPlatform fakePlatform = MockElevenlabsPlatform();
//     ElevenlabsPlatform.instance = fakePlatform;

//     expect(await elevenlabsPlugin.getPlatformVersion(), '42');
//   });
// }
