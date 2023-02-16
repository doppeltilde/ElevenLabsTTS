class VoicesModel {
  VoicesModel({
    required this.voices,
  });

  List<Voice> voices;

  factory VoicesModel.fromJson(Map<String, dynamic> json) => VoicesModel(
        voices: List<Voice>.from(json["voices"].map((x) => Voice.fromJson(x))),
      );
}

class Voice {
  Voice({
    required this.voiceId,
    required this.name,
    required this.samples,
    required this.category,
    required this.labels,
    this.previewUrl,
    required this.availableForTiers,
    this.settings,
  });

  String voiceId;
  String name;
  List<Sample> samples;
  String category;
  Labels labels;
  String? previewUrl;
  List<dynamic> availableForTiers;
  dynamic settings;

  factory Voice.fromJson(Map<String, dynamic> json) => Voice(
        voiceId: json["voice_id"],
        name: json["name"],
        samples:
            List<Sample>.from(json["samples"].map((x) => Sample.fromJson(x))),
        category: json["category"],
        labels: Labels.fromJson(json["labels"]),
        previewUrl: json["preview_url"],
        availableForTiers:
            List<dynamic>.from(json["available_for_tiers"].map((x) => x)),
        settings: json["settings"],
      );
}

class Labels {
  Labels();

  factory Labels.fromJson(Map<String, dynamic> json) => Labels();

  Map<String, dynamic> toJson() => {};
}

class Sample {
  Sample({
    required this.sampleId,
    required this.fileName,
    required this.mimeType,
    required this.sizeBytes,
    required this.hash,
  });

  String sampleId;
  String fileName;
  String mimeType;
  int sizeBytes;
  String hash;

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        sampleId: json["sample_id"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        sizeBytes: json["size_bytes"],
        hash: json["hash"],
      );
}
