import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sigmavpnflutter/core/data/model/firebase_file.dart';
import 'dart:io';

class FirebaseApi {
  // String config = "";

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static const String defaultVpnUsername = "";
  static const String defaultVpnPassword = "";

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items);
    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  static Future downloadFile(Reference ref) async{
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/${ref.name}');
    await ref.writeToFile(file);
   var  config = await file.readAsString();
    file.delete();
    return config;
  }
}

