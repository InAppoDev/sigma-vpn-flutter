import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class InitializeRemoteConfig {
  static FirebaseRemoteConfig? _remoteConfig;

  static Future<bool> init() async {
    _remoteConfig = FirebaseRemoteConfig.instance;
    return true;
  }

  static remoteConfigInitialize() async {
    await _remoteConfig?.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 10),
    ));
    await _remoteConfig?.fetchAndActivate();
  }

  static getServerName(int randomNumber) {
    return jsonDecode(_remoteConfig!.getValue("vpn_loc").asString())[
        randomNumber]["location"];
  }

  static getHelpPageContent() {
    return jsonDecode(_remoteConfig!.getValue("faq").asString());
  }

  static getTermsContent() {
    return jsonDecode(_remoteConfig!.getValue("terms").asString());
  }

  static getPrivacyPolicyContent() {
    return jsonDecode(_remoteConfig!.getValue("privacy").asString());
  }
}
