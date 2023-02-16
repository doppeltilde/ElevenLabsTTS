# ElevenLabsTTS

[![pub package](https://img.shields.io/pub/v/elevenlabs.svg)](https://pub.dartlang.org/packages/elevenlabs)

Lightweight wrapper for ElevenLabs's [Text-To-Speech API](https://beta.elevenlabs.io).

- Video example with ElevenLabs generated voices:
<a href="https://www.youtube.com/watch?v=Wd5yRlYM798"><img src="https://i3.ytimg.com/vi/Wd5yRlYM798/maxresdefault.jpg"/></a>

## Usage

1. Add the package as a dependency to your `pubspec.yaml` file.
2. An audio package is required. I recommend [AudioPlayers](https://pub.dev/packages/audioplayers) or [just_audio](https://pub.dev/packages/just_audio).

3. Initialize ElevenLabs:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize ElevenLabs
  ElevenLabs(apiKey: dotenv.get("API_KEY"));

  runApp(const MyApp());
}
```


- Convert your text to a File object:
VoiceId's can be found here: https://api.elevenlabs.io/v1/voices

```dart
    File file = await ElevenLabs.instance.create(
      // Required
      // Your Input
      text: text,

      // Optional
      // The Voice Id for the Voice.
      // See: https://api.elevenlabs.io/v1/voices
      voiceId: "ErXwobaYiN019PkySvjV",

      // Optional
      // Creates a cached audio file which can then be called by name.
      fileName: "Hello World",

      // Optional
      // Higher stability ensures consistency but may result in monotony, therefore
      // for longer text, it is recommended to decrease stability.
      stability: 1.0,

      // Optional
      // Boosting voice clarity and target speaker similarity is achieved by high
      // enhancement; however, very high values can produce artifacts, so it's
      // essential to find the optimal setting.
      similarityBoost: 1.0,
    );
```

- List voices:
```dart
    final voices = await ElevenLabs.instance.listVoices();
    for (var i in voices) {
      print(
          'Voice Name: ${i.name}, Voice ID: ${i.voiceId}, Category: ${i.category}');
    }
```

- List history:
```dart
    final voices = await ElevenLabs.instance.listHistory();
    for (var i in voices) {
      print(
          'Item Id: ${i.historyItemId}, Voice ID: ${i.voiceId}, Voice Name: ${i.voiceName}, Text: ${i.text},');
    }
```

- Create audio file from history item id:
```dart
    final file = await ElevenLabs.instance.createHistoryAudioId(
      // Required
      // History Item Id
      itemId: "your-history-item-id",

      // Optional
      // Creates a cached audio file which can then be called by name
      fileName: "your-file-name",
    );
```
See [example](https://github.com/jonafeucht/ElevenLabsTTS/blob/main/example/lib/main.dart) for more details.


---

*Notice:*
*This package was initally created to be used in-house, as such the development is first and foremost aligned with the internal requirements.*