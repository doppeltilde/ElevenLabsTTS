import 'dart:convert';

import 'package:elevenlabs/Models/elevenlabs_voices_model.dart';
import 'package:elevenlabs/core/elevenlabs_endpoints.dart';
import 'package:elevenlabs/elevenlabs.dart';

extension ElevenLabsVoices on ElevenLabs {
  Future<List<Voice>> fetchVoices() async {
    Map<String, String> headers = {
      'xi-api-key': ElevenLabs.apiKey,
      'Content-Type': 'application/json',
    };

    try {
      final response = await ElevenLabsEndpoints.client.get(
        Uri.parse(ElevenLabsEndpoints.voicesUrl),
        headers: headers,
      );
      final json = jsonDecode(response.body);
      final list = json["voices"] as List;

      List<Voice> voices = list.map((e) => Voice.fromJson(e)).toList();

      return voices;
    } catch (e) {
      throw (e);
    }
  }
}
