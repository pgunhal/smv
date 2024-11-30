import 'dart:io';

import 'package:smv_app/shloka.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class Chapter {


  int id;
  late Future<List<Shloka>> shlokas;
  late int verseCount;

  // ignore: non_constant_identifier_names
  Chapter({required this.id, required file_path}) {
      shlokas = readFile(file_path);
  }


  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<List<Shloka>> readFile(String path) async {
    String text = await loadAsset('assets/$path'); //returns string 

  RegExp regExp = RegExp(r'(?<=\.)\s*');

    List<String> split = text.split(regExp);
    split = split.where((split) => split.trim().isNotEmpty).toList(); //splits based on delim - '.'

    verseCount = split.length;

    List<Shloka> shlokas = []; 
    
    for(int i = 0; i < split.length; i++) {
        shlokas.add(Shloka(id: i+1, content: split[i].substring(0,split[i].length-1))); //drops period
    }


      return shlokas; //returns list of shlokas


  }


  Future<Shloka> getShloka(int i) async {

    List<Shloka> s = await shlokas; 

    return s[i-1];
  }


  Future<List<Shloka>> getShlokas() {

    return shlokas;


  }

  int getId() {

    return id;
  }

  int getVerseCount() {
    return verseCount;
  }

}