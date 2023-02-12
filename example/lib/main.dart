import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:elevenlabs/elevenlabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  final ElevenLabsTTS elevenlabs = ElevenLabsTTS(apiKey: dotenv.get("API_KEY"));

  String text =
      "Once men turned their thinking over to machines in the hope that this would set them free. But that only permitted other men with machines to enslave them.";

  _playDemo() async {
    File file = await elevenlabs.create(
      text: text,
      voiceId: "ErXwobaYiN019PkySvjV",
      fileName: "Hello World",
      stability: 0.2,
      similarityBoost: 0.2,
    );
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
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playDemo,
        tooltip: 'Play Demo',
        child: const Icon(Icons.arrow_right_alt_outlined),
      ),
    );
  }
}
