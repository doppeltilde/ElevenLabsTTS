import 'package:audioplayers/audioplayers.dart';
import 'package:elevenlabs/elevenlabs.dart';
import 'package:elevenlabs_example/main.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  listHistory() async {
    final voices = await ElevenLabs.instance.listHistory();
    for (var i in voices) {
      print(
          'Item Id: ${i.historyItemId}, Voice ID: ${i.voiceId}, Voice Name: ${i.voiceName}, Text: ${i.text},');
    }
  }

  createHistoryAudioId() async {
    final file = await ElevenLabs.instance.createHistoryAudioId(
      itemId: "your-history-item-id",
    );
    print(file.path);
    await audioPlayer.play(DeviceFileSource(file.path), volume: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            ElevatedButton(
              child: const Text("List History"),
              onPressed: () => listHistory(),
            ),
            ElevatedButton(
              child: const Text("Create Audio from History Item Id"),
              onPressed: () => createHistoryAudioId(),
            ),
          ])),
    );
  }
}
