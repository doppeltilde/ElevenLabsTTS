class History {
  final List<HistoryItem> history;

  History({required this.history});

  factory History.fromJson(Map<String, dynamic> json) {
    List<HistoryItem> historyList = List<HistoryItem>.from(
        json['history'].map((item) => HistoryItem.fromJson(item)).toList());

    return History(history: historyList);
  }
}

class HistoryItem {
  final String historyItemId;
  final String voiceId;
  final String voiceName;
  final String text;
  final int dateUnix;
  final int characterCountChangeFrom;
  final int characterCountChangeTo;
  final String contentType;
  final String state;

  HistoryItem({
    required this.historyItemId,
    required this.voiceId,
    required this.voiceName,
    required this.text,
    required this.dateUnix,
    required this.characterCountChangeFrom,
    required this.characterCountChangeTo,
    required this.contentType,
    required this.state,
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      historyItemId: json['history_item_id'],
      voiceId: json['voice_id'],
      voiceName: json['voice_name'],
      text: json['text'],
      dateUnix: json['date_unix'],
      characterCountChangeFrom: json['character_count_change_from'],
      characterCountChangeTo: json['character_count_change_to'],
      contentType: json['content_type'],
      state: json['state'],
    );
  }
}
