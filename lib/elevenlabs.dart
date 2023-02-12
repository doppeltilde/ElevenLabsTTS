import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.elevenlabs.io/v1/";
var client = http.Client();

class FileService {
  static Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  static Future<File> createAndWriteFile(String filePath, content) async {
    final path = await _localPath;
    final file = File('$path/$filePath');
    await file.writeAsBytes(content);
    return file;
  }
}

class AudioResponse {
  final String? audioContent;

  AudioResponse(this.audioContent);

  AudioResponse.fromJson(Map<String, dynamic> json)
      : audioContent = json['audioContent'];
}

class ElevenLabsTTS {
  AudioPlayer audioPlayer = AudioPlayer();
  String apiKey;

  ElevenLabsTTS({required this.apiKey});

  _getApiUrl(String endpoint) {
    return Uri.parse('$baseUrl$endpoint');
  }

  Future textToSpeech({
    required String text,

    /// Voice name.
    ///
    /// See https://api.elevenlabs.io/v1/voices for more info.
    String voiceId = 'MF3mGyEYCl7XYWbV9V6O',

    /// Ranges from 0.0 to 1.0.
    double stability = 0.0,

    /// Ranges from 0.0 to 1.0.
    double similarityBoost = 0.0,
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

    var response = await http.post(
      _getApiUrl(endpoint),
      headers: headers,
      body: json.encode(jsonData),
    );

    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/audio.mp3');
      final bytes = response.bodyBytes;
      await file.writeAsBytes(bytes);

      await audioPlayer.play(DeviceFileSource(file.path));
    } catch (e) {
      throw (e);
    }
  }
}
