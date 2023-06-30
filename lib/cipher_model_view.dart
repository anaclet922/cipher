import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:pin_code_fields/pin_code_fields.dart';

enum ActiveMenu { isMenuActive, isMyPasswordActive, isMyCiphersActive, isMyKeywordsActive, isGeneratorActive }

class CipherViewModel extends GetxController {

  Rx<StreamController<ErrorAnimationType>> errorController = StreamController<ErrorAnimationType>().obs;
  Rx<TextEditingController> loginEditingController = TextEditingController().obs;


  Rx<StreamController<ErrorAnimationType>> errorController2 = StreamController<ErrorAnimationType>().obs;
  Rx<TextEditingController> loginEditingController2 = TextEditingController().obs;

  Rx<ActiveMenu> activeMenu = ActiveMenu.isMenuActive.obs;

  RxBool loginWithCipher = true.obs;
  RxBool showCipherAtMenu = false.obs;


  void changeMenu(ActiveMenu newMenu){
    activeMenu.value = newMenu;
  }

  void login(){
    errorController.value.add(ErrorAnimationType.clear);
    Get.toNamed('/menu');
  }
  void pinVisibility(){
    showCipherAtMenu.value = !showCipherAtMenu.value;

  }
}
