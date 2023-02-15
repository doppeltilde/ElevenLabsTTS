import 'dart:convert';
import 'dart:io';
import 'package:elevenlabs/core/elevenlabs_endpoints.dart';
import 'package:elevenlabs/elevenlabs.dart';
import 'package:path_provider/path_provider.dart';

extension ElevenLabsCreate on ElevenLabs {
  Future<File> create({
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
  }) async {
    // Converts text to speech
    var endpoint = 'text-to-speech/$voiceId';

    Map<String, String> headers = {
      'accept': 'audio/mpeg',
      'xi-api-key': ElevenLabs.apiKey,
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
        return file;
      } else {
        var response = await ElevenLabsEndpoints.client.post(
          Uri.parse("${ElevenLabsEndpoints.baseUrl}/$endpoint"),
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

        return file;
      }
    } catch (e) {
      throw (e);
    }
  }
}
