import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _userPreferences;

  static Future<bool> init() async {
    _userPreferences = await SharedPreferences.getInstance();
    return true;
  }


  // User Preferences
  static void setServerName(String serverName) {
    _userPreferences?.setString('serverName', serverName);
  }

  static String getServerName() {
    return _userPreferences?.getString('serverName') ??"";
  }


}
