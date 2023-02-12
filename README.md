# ElevenLabsTTS

[![pub package](https://img.shields.io/pub/v/elevenlabs.svg)](https://pub.dartlang.org/packages/elevenlabs)

A simple wrapper for ElevenLabs's [Text-To-Speech API](https://beta.elevenlabs.io).

## Usage

- add the package as a dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  elevenlabs: ^1.0.0
```

- Initialize ElevenLabsTTS:

```dart
ElevenLabsTTS elevenlabs = ElevenLabsTTS(apiKey: 'API_KEY');
```

VoiceId's can be found here: https://api.elevenlabs.io/v1/voices

- Convert your text to a File object (**api key required**):

```dart
    elevenlabs.textToSpeech(
      text: text,
      voiceId: "ErXwobaYiN019PkySvjV",
      stability: 0.01,
      similarityBoost: 0.6,
    );
```
