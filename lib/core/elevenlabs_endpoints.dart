import 'package:http/http.dart' as http;

class ElevenLabsEndpoints {
  static const baseUrl = "https://api.elevenlabs.io/v1";
  static const voicesUrl = "$baseUrl/voices";
  static const historyUrl = "$baseUrl/history";
  var client = http.Client();
}
