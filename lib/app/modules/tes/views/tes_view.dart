import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tes_controller.dart';

class TesView extends GetView<TesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
