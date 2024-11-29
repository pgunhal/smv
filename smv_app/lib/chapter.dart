import 'dart:io';

import 'package:smv_app/shloka.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class Chapter {

  int id;
  String file_path;
  late Future<List<Shloka>> shlokas;

  // ignore: non_constant_identifier_names
  Chapter({required this.id, required this.file_path}) {
      shlokas = readFile(file_path);
  }


  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<List<Shloka>> readFile(String path) async {
      // await loadAsset(path); //returns string 


      return <Shloka>[Shloka(id: '$id.1', content: 'shrI rAma')];


  }


  Future<List<Shloka>> getShlokas() {

    return shlokas;


  }

  int getId() {

    return id;
  }

}