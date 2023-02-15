# ElevenLabsTTS

[![pub package](https://img.shields.io/pub/v/elevenlabs.svg)](https://pub.dartlang.org/packages/elevenlabs)

Lightweight wrapper for ElevenLabs's [Text-To-Speech API](https://beta.elevenlabs.io).

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
      // Your Input
      text: text,

      // The Voice Id for the Voice.
      // See: https://api.elevenlabs.io/v1/voices
      voiceId: "ErXwobaYiN019PkySvjV",

      // Checks if the file exists by name
      // If it exists it gets called from cache, instead from the API.
      fileName: "Hello World",

      // Higher stability ensures consistency but may result in monotony, therefore
      // for longer text, it is recommended to decrease stability.
      stability: 1.0,

      // Boosting voice clarity and target speaker similarity is achieved by high
      // enhancement; however, very high values can produce artifacts, so it's
      // essential to find the optimal setting.
      similarityBoost: 1.0,
    );
```

- List voices:
```dart
    final voices = await ElevenLabs.instance.fetchVoices();
    for (var i in voices) {
      print(
          'Voice Name: ${i.name}, Voice ID: ${i.voiceId}, Category: ${i.category}');
    }
```
See [example](https://github.com/jonafeucht/ElevenLabsTTS/blob/main/example/lib/main.dart) for more details.
