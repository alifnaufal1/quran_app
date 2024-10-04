import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_app/data/database/bookmark.dart';
import 'package:quran_app/data/models/surah.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data == null) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  Future<Map<String, dynamic>?> getLastRead() async {
    Database db = await database.db;

    List<Map<String, dynamic>> dataLastRead = await db.query(
      'bookmark',
      where: 'last_read = 1',
    );

    if (dataLastRead.isEmpty) {
      return null;
    } else {
      return dataLastRead.first;
    }
  }
}
