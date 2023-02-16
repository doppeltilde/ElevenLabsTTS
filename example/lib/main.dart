import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:elevenlabs/elevenlabs.dart';
import 'package:elevenlabs_example/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

AudioPlayer audioPlayer = AudioPlayer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  // Initialize ElevenLabs
  ElevenLabs(apiKey: dotenv.get("API_KEY"));

  runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String text =
      "Once men turned their thinking over to machines in the hope that this would set them free. But that only permitted other men with machines to enslave them.";

  _playDemo() async {
    File file = await ElevenLabs.instance.create(
      text: text,
      voiceId: "ErXwobaYiN019PkySvjV",
      fileName: "Hello World",
      stability: 0.4,
      similarityBoost: 0.6,
    );
    print(file.path);
    await audioPlayer.play(DeviceFileSource(file.path), volume: 1.0);
  }

  listVoices() async {
    final voices = await ElevenLabs.instance.fetchVoices();
    for (var i in voices) {
      print(
          'Voice Name: ${i.name}, Voice ID: ${i.voiceId}, Category: ${i.category}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => _playDemo(), child: const Text("Play Demo")),
            ElevatedButton(
                onPressed: () => listVoices(),
                child: const Text("Fetch Voices")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const History()),
                  );
                },
                child: const Text("History")),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Text To Speech Example'),
    );
  }
}
