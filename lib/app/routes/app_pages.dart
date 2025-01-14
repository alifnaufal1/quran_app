import 'package:get/get.dart';

import 'package:quran_app/app/modules/detail_surah/bindings/detail_surah_binding.dart';
import 'package:quran_app/app/modules/detail_surah/views/detail_surah_view.dart';
import 'package:quran_app/app/modules/home/bindings/home_binding.dart';
import 'package:quran_app/app/modules/home/views/home_view.dart';
import 'package:quran_app/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:quran_app/app/modules/introduction/views/introduction_view.dart';
import 'package:quran_app/app/modules/last_read/bindings/last_read_binding.dart';
import 'package:quran_app/app/modules/last_read/views/last_read_view.dart';
import 'package:quran_app/app/modules/tes/bindings/tes_binding.dart';
import 'package:quran_app/app/modules/tes/views/tes_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.LAST_READ,
      page: () => LastReadView(),
      binding: LastReadBinding(),
    ),
    GetPage(
      name: _Paths.TES,
      page: () => TesView(),
      binding: TesBinding(),
    ),
  ];
}
