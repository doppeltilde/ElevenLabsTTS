import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.elevenlabs.io/v1/";
const historyUrl = "$baseUrl/history";
var client = http.Client();

class ElevenLabsTTS {
  AudioPlayer audioPlayer = AudioPlayer();
  String apiKey;

  ElevenLabsTTS({required this.apiKey});

  _getApiUrl(String endpoint) {
    return Uri.parse('$baseUrl$endpoint');
  }

  Future textToSpeech({
    /// Input Text.
    required String text,

    /// Voice Id.
    /// See https://api.elevenlabs.io/v1/voices for more info.
    String voiceId = 'MF3mGyEYCl7XYWbV9V6O',

    /// File name.
    /// Checks if the file exists by name
    /// and then calls it from cache, instead from the API.
    String? fileName,

    /// Ranges from 0.0 to 1.0.
    double stability = 0.0,

    /// Ranges from 0.0 to 1.0.
    double similarityBoost = 0.0,

    /// Speech Volume
    double volume = 1.0,
  }) async {
    // Converts text to speech
    var endpoint = 'text-to-speech/$voiceId';

    Map<String, String> headers = {
      'accept': 'audio/mpeg',
      'xi-api-key': apiKey,
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> jsonData = {
      "text": text,
      "stability": stability,
      "similarity_boost": similarityBoost,
    };

    try {
      final dir = await getTemporaryDirectory();
      final file =
          File('${dir.path}/${fileName?.replaceAll(RegExp(r"\s+"), "")}.mp3');

      if (await file.exists()) {
        await audioPlayer.play(DeviceFileSource(file.path), volume: volume);
      } else {
        var response = await http.post(
          _getApiUrl(endpoint),
          headers: headers,
          body: json.encode(jsonData),
        );
        String id = DateTime.now().millisecondsSinceEpoch.toString();

        final file = fileName?.replaceAll(RegExp(r"\s+"), "") != null
            ? File(
                '${dir.path}/${fileName?.replaceAll(RegExp(r"\s+"), "")}.mp3')
            : File('${dir.path}/$id.mp3');

        final bytes = response.bodyBytes;
        await file.writeAsBytes(bytes);

        await audioPlayer.play(DeviceFileSource(file.path), volume: volume);
      }
    } catch (e) {
      throw (e);
    }
  }
}
