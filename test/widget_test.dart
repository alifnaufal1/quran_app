// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:quran_app/data/models/detail_surah.dart';
// import 'package:quran_app/data/models/surah.dart';

// void main() async {
//   Uri url = Uri.parse("https://api.quran.gading.dev/surah");
//   var res = await http.get(url);

//   // print(res.body);

//   List data = (json.decode(res.body) as Map<String, dynamic>)['data'];
//   // print(data[113]['number']);

//   // Data dari api (raw data) => model
//   Surah annas = Surah.fromJson(data[113]);

//   // print(annas.name.long);
//   // print(annas.name.translation.id);
//   // print("==============");
//   // print(annas.number);
//   // print("==============");
//   // print(annas.numberOfVerses);
//   // print("==============");
//   // print(annas.revelation.id);
//   // print("==============");
//   // print(annas.sequence);
//   // print("==============");
//   // print(annas.tafsir.id);
//   // print("==============");

//   // Coba masuk ke nested model
//   Uri urlAnnas = Uri.parse(
//     'https://api.quran.gading.dev/surah/${annas.number}',
//   );
//   var resAnnas = await http.get(urlAnnas);

//   // ngubah resAnnas yg merupakan string menjadi objek agar lebih mudah diakses tiap datanya
//   // ubah dulu ke dynamic
//   // var dataAnnas = json.decode(resAnnas.body);
//   // // print(dataAnnas.body);

//   // // habis itu di mapping (keynya string semua, valuenya dinamis)
//   // var dataAnnas2 = (dataAnnas as Map<String, dynamic>)['data'];
//   // // print(dataAnnas2['code']);

//   // // tapi karena yg dibutuhkan cuman data-nya aja
//   // // maka ubah dataAnnas2 ke bentuk model
//   // Map<String, dynamic> dataAnnas3 = dataAnnas2;
//   // DetailSurah annas2 = DetailSurah.fromJson(dataAnnas3);
//   // print(annas2.verses[0].text.arab);

//   // atau disingkat dengan ini:
//   Map<String, dynamic> dataAnnas =
//       (json.decode(resAnnas.body) as Map<String, dynamic>)['data'];

//   DetailSurah annas2 = DetailSurah.fromJson(dataAnnas);
//   print(annas2.verses[0].text.arab);
// }
