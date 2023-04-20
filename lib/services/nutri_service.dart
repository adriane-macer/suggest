import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/models/nutri.dart';


class NutriService extends GetxService {
  static NutriService get to => Get.find();

  List<Nutri> nutris = [];

  Future<NutriService> init() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/vegs.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    try {
      nutris = jsonResponse.map((data) => Nutri.fromJson(data)).toList();
    } catch (e) {
      debugPrint("NutriService.init: $e");
    }

    return this;
  }
}