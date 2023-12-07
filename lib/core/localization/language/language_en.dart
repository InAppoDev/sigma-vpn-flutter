// ignore_for_file: non_constant_identifier_names

import 'package:sigmavpnflutter/core/localization/language/languages.dart';

class LanguageEn extends Languages {
  @override
  String get languageCode => "en";

  @override
  String get home_title_1 => "Sigma";
  @override
  String get home_title_2 => " VPN";
  @override
  String get home_download => "Download";
  @override
  String get home_upload => "Upload";
  @override
  String get home_connected => "Connected";
  @override
  String get home_connecting => "Connecting...";
  @override
  String get home_disconnected => "Disconnected";
  @override
  String get home_disconnecting => "Connection is disconnecting";
  @override
  String get home_disconnect => "Disconnect";
  @override
  String get home_connection_message => "I am doing my best to connect";
  @override
  String get home_connected_server => "Connected {0} server.";
  @override
  String get general_cancel => "Cancel";

  @override
  String get drawer_help => "Help";
  @override
  String get drawer_rate => "Rate Us";
  @override
  String get drawer_share => "Share";
  @override
  String get drawer_about => "About Us";

  @override
  String get drawer_terms => "Terms and Conditions";
  @override
  String get drawer_privacy => "Privacy Policy";

  @override
  String get share_app =>
      "Sigma VPN- Fast, Free VPN Proxy, No Limits! \nSurf on the internet safely and anonymously!\n Download now! https://play.google.com/store/apps/details?id=com.sigma.vpn \n https://apps.apple.com/tr/app/sigma-vpn/id1524035161";
}
