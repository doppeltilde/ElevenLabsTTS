export 'extensions/elevenlabs_voices.dart';
export 'extensions/elevenlabs_create.dart';
export 'extensions/elevenlabs_history.dart';

class ElevenLabs {
  static final ElevenLabs instance = ElevenLabs._();
  static late String apiKey;

  ElevenLabs._();

  static Future<ElevenLabs> init({required String apiKey}) async {
    ElevenLabs.apiKey = apiKey;
    return instance;
  }
}
