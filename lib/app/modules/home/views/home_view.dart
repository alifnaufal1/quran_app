import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quran_app/app/routes/app_pages.dart';
import 'package:quran_app/data/models/surah.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: controller.getLastRead(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          HexColor('#BCA3DB'),
                          HexColor('#9549F1'),
                        ],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -50,
                              right: 0,
                              child: Opacity(
                                opacity: 0.4,
                                child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(
                                    'assets/images/quran.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.menu_book_rounded,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Terakhir dibaca',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                Map<String, dynamic>? lastRead = snapshot.data;

                return Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        HexColor('#BCA3DB'),
                        HexColor('#9549F1'),
                      ],
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -50,
                            right: 0,
                            child: Opacity(
                              opacity: 0.4,
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  'assets/images/quran.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Terakhir dibaca',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 30),
                                if (lastRead != null)
                                  Text(
                                    "${lastRead['surah']}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                Text(
                                  lastRead == null
                                      ? "Tidak ada save terakhir"
                                      : "Ayat ${lastRead['ayat']}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: FutureBuilder<List<Surah>>(
                future: controller.getAllSurah(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Surah surah = snapshot.data![index];
                      return ListTile(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
                        },
                        leading: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/octagon.png'),
                            ),
                          ),
                          child: Center(
                            child: Text('${surah.number}'),
                          ),
                        ),
                        title: Text("${surah.name?.transliteration?.id}"),
                        subtitle: Text(
                          '${surah.name?.translation?.id} | ${surah.revelation?.id}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Text(
                          "${surah.name?.short}\n${surah.numberOfVerses} Ayat",
                          textAlign: TextAlign.end,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
