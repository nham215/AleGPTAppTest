import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String serviceUrl = dotenv.get("SERVICE_URL");
}
