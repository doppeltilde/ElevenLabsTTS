class ElevenLabsVoicesModel {
  ElevenLabsVoicesModel({
    required this.voices,
  });

  List<Voice> voices;

  factory ElevenLabsVoicesModel.fromJson(Map<String, dynamic> json) =>
      ElevenLabsVoicesModel(
        voices: List<Voice>.from(json["voices"].map((x) => Voice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "voices": List<dynamic>.from(voices.map((x) => x.toJson())),
      };
}

class Voice {
  Voice({
    required this.voiceId,
    required this.name,
    required this.samples,
    required this.category,
    required this.previewUrl,
    required this.availableForTiers,
    this.settings,
  });

  String voiceId;
  String name;
  List<dynamic> samples;
  String category;
  String previewUrl;
  List<dynamic> availableForTiers;
  dynamic settings;

  factory Voice.fromJson(Map<String, dynamic> json) => Voice(
        voiceId: json["voice_id"],
        name: json["name"],
        samples: List<dynamic>.from(json["samples"].map((x) => x)),
        category: json["category"],
        previewUrl: json["preview_url"],
        availableForTiers:
            List<dynamic>.from(json["available_for_tiers"].map((x) => x)),
        settings: json["settings"],
      );

  Map<String, dynamic> toJson() => {
        "voice_id": voiceId,
        "name": name,
        "samples": List<dynamic>.from(samples.map((x) => x)),
        "category": category,
        "preview_url": previewUrl,
        "available_for_tiers":
            List<dynamic>.from(availableForTiers.map((x) => x)),
        "settings": settings,
      };
}
