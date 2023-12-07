// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get languageCode;

  ///LOGIN - SIGNUP

  String get home_title_1;
  String get home_title_2;
  String get home_download;
  String get home_upload;
  String get home_connected;
  String get home_connecting;
  String get home_disconnecting;
  String get home_disconnected;
  String get home_disconnect;
  String get home_connection_message;
  String get home_connected_server;
  String get general_cancel;

  /// Drawer
  String get drawer_help;
  String get drawer_rate;
  String get drawer_share;
  String get drawer_about;


  String get drawer_terms;
  String get drawer_privacy;


  /// Share App

  String get share_app;




}
