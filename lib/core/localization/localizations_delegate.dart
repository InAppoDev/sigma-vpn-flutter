import 'package:flutter/material.dart';
import 'package:sigmavpnflutter/core/localization/language/language_en.dart';
import 'package:sigmavpnflutter/core/localization/language/language_tr.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ["en", "tr"].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case "en":
        return LanguageEn();
      case "tr":
        return LanguageTr();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
