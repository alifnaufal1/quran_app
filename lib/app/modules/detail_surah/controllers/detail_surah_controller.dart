import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/data/database/bookmark.dart';
import 'package:quran_app/data/models/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class DetailSurahController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;

  void addBookmark(
      bool lastRead, DetailSurah surah, Verse ayat, int indexAyat) async {
    Database db = await database.db;

    if (lastRead == true) {
      await db.delete("bookmark", where: "last_read = 1");
    }

    await db.insert(
      'bookmark',
      {
        'surah': surah.name!.transliteration!.id,
        'ayat': ayat.number!.inSurah!,
        'index_ayat': indexAyat,
        'last_read': lastRead == true ? 1 : 0,
      },
    );

    // var data = await db.query("bookmark");
    // print(data);

    Get.back();
    Get.snackbar(
      'Berhasil',
      'Berhasil menambahkan terakhir baca',
      colorText: Colors.black,
    );
  }

  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)['data'];

    return DetailSurah.fromJson(data);
  }
}
