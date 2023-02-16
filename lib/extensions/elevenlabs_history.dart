import 'dart:convert';
import 'dart:io';

import 'package:elevenlabs/models/elevenlabs_history_model.dart';
import 'package:elevenlabs/core/elevenlabs_endpoints.dart';
import 'package:elevenlabs/elevenlabs.dart';
import 'package:path_provider/path_provider.dart';

extension ElevenLabsHistory on ElevenLabs {
  Future<List<HistoryItem>> listHistory() async {
    Map<String, String> headers = {
      'xi-api-key': ElevenLabs.apiKey,
      'accept': 'application/json',
    };

    try {
      final response = await ElevenLabsEndpoints.client.get(
        Uri.parse(ElevenLabsEndpoints.historyUrl),
        headers: headers,
      );
      final json = jsonDecode(response.body);
      final list = json["history"] as List;

      List<HistoryItem> voices =
          list.map((e) => HistoryItem.fromJson(e)).toList();

      return voices;
    } catch (e) {
      throw (e);
    }
  }

  Future<File> createHistoryAudioId({
    required itemId,
    fileName,
  }) async {
    Map<String, String> headers = {
      'xi-api-key': ElevenLabs.apiKey,
      'accept': 'audio/mpeg',
    };

    try {
      final dir = await getTemporaryDirectory();
      final file =
          File('${dir.path}/${fileName?.replaceAll(RegExp(r"\s+"), "")}.mp3');

      if (await file.exists()) {
        return file;
      } else {
        final response = await ElevenLabsEndpoints.client.get(
          Uri.parse("${ElevenLabsEndpoints.historyUrl}/$itemId/audio"),
          headers: headers,
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
