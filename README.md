# ElevenLabsTTS

[![pub package](https://img.shields.io/pub/v/elevenlabs.svg)](https://pub.dartlang.org/packages/elevenlabs)

A simple wrapper for ElevenLabs's [Text-To-Speech API](https://beta.elevenlabs.io).

## Usage

- add the package as a dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  elevenlabs: ^1.0.3
```

- Initialize ElevenLabsTTS:

```dart
ElevenLabsTTS elevenlabs = ElevenLabsTTS(apiKey: 'API_KEY');
```

VoiceId's can be found here: https://api.elevenlabs.io/v1/voices

- Convert your text to a File object (**api key required**):

```dart
    elevenlabs.textToSpeech(
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
