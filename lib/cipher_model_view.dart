import 'dart:async';
import 'dart:math';

import 'package:cipher_saver/constants/variables.dart';
import 'package:cipher_saver/models/cipher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uuid/uuid.dart';

enum ActiveMenu {
  isMenuActive,
  isMyPasswordActive,
  isMyCiphersActive,
  isMyKeywordsActive,
  isGeneratorActive
}

enum ActiveGenerator { isGenCipher, isGenPassword, isGenKeyword }

class CipherViewModel extends GetxController {
  Rx<StreamController<ErrorAnimationType>> errorController =
      StreamController<ErrorAnimationType>().obs;
  Rx<TextEditingController> loginEditingController =
      TextEditingController().obs;

  Rx<StreamController<ErrorAnimationType>> errorController2 =
      StreamController<ErrorAnimationType>.broadcast().obs;
  Rx<TextEditingController> loginEditingController2 =
      TextEditingController().obs;

  Rx<ActiveMenu> activeMenu = ActiveMenu.isMenuActive.obs;
  Rx<ActiveGenerator> activeGen = ActiveGenerator.isGenCipher.obs;

  RxBool loginWithCipher = true.obs;
  RxBool showCipherAtMenu = false.obs;

  Box<CipherModel> ciphersBox = Hive.box(cipherBoxName);

  RxList<CipherModel> ciphers = <CipherModel>[].obs;
  RxList<CipherModel> passwords = <CipherModel>[].obs;
  RxList<CipherModel> myKeywords = <CipherModel>[].obs;

  Rx<TextEditingController> cipherNameController = TextEditingController().obs;
  Rx<TextEditingController> cipherCipherController =
      TextEditingController().obs;

  Rx<TextEditingController> genController = TextEditingController().obs;

  List<String> keywords = [
    'percentage',
    'crap',
    'sunrise',
    'oxide',
    'clock',
    'tsunami',
    'cooking',
    'national park',
    'raisin',
    'scheme',
    'manifesto',
    'corridor',
    'lacquer',
    'preface',
    'process',
    'land',
    'throat',
    'slope',
    'napkins',
    'patriot',
    'admission',
    'score',
    'angina',
    'fashion',
    'surveillance',
    'connection',
    'tram',
    'classroom',
    'pig',
    'editor',
    'fear',
    'freshman',
    'garbage',
    'biceps',
    'visitor',
    'transformation',
    'experiment',
    'arcade',
    'aquarius',
    'amenities',
    'rule',
    'submarine',
    'section',
    'drill',
    'feather',
    'toenail',
    'wave',
    'population',
    'cherry pie',
    'bud'
  ];

  var charsCipher = '1234567890';
  String charsPassword =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#\$%^&*()-_=+[{]};:\'",<.>/?';
  Random rnd = Random();

  String getRandomCipherString(int length) =>
      String.fromCharCodes(Iterable.generate(length,
          (_) => charsCipher.codeUnitAt(rnd.nextInt(charsCipher.length))));

  String getRandomPasswordString(int length) =>
      String.fromCharCodes(Iterable.generate(length,
          (_) => charsPassword.codeUnitAt(rnd.nextInt(charsPassword.length))));

  AudioPlayer player = AudioPlayer();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getLoginCipher();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    player.dispose();
  }

  void getLoginCipher() {
    var box = Hive.box(loginBoxName);
    var savedCipher = box.get('cipher');
    if(savedCipher != null){
      loginEditingController.value.text = savedCipher;
    }
    showCipherAtMenu.value = false;
  }

  void btnPressedSound() async {
    String audioAsset = "assets/cyber_click.mp3";
    await player.setAsset(audioAsset);
    player.play();
    // player.dispose();
  }

  void correctSound() async {
    String audioAsset = "assets/correct_cipher.mp3";
    await player.setAsset(audioAsset);
    player.play();
  }

  void errorSound() async {
    String audioAsset = "assets/mistake_cipher.mp3";
    await player.setAsset(audioAsset);
    player.play();
  }

  void changeMenu(ActiveMenu newMenu) {
    activeMenu.value = newMenu;
    switch (newMenu) {
      case ActiveMenu.isMenuActive:
        {
          Get.toNamed('/menu');
        }
        break;
      case ActiveMenu.isMyCiphersActive:
        {
          Get.toNamed('/my-ciphers');
          // errorController2.value.close();
        }
        break;
      case ActiveMenu.isMyPasswordActive:
        {
          Get.toNamed('/my-passwords');
        }
        break;
      case ActiveMenu.isMyKeywordsActive:
        {
          Get.toNamed('/my-keywords');
        }
        break;
      case ActiveMenu.isGeneratorActive:
        {
          Get.toNamed('/generator');
        }
        break;
      default:
        {
          activeMenu.value = ActiveMenu.isMenuActive;
          activeMenu.value = ActiveMenu.isMenuActive;
        }
        break;
    }
  }

  void changeGenerator(ActiveGenerator newGen) {
    activeGen.value = newGen;
    btnPressedSound();
  }

  void login() {
    btnPressedSound();
    String cipher = loginEditingController.value.text;
    if (cipher.isNotEmpty && cipher.length == 4) {
      var box = Hive.box(loginBoxName);
      var savedCipher = box.get('cipher');
      if (savedCipher.toString() == cipher) {
        correctSound();
        loginEditingController2.value.text = savedCipher;
        Get.toNamed('/menu');
      } else {
        errorController.value.add(ErrorAnimationType.shake);
        errorSound();
      }
    } else {
      errorController.value.add(ErrorAnimationType.shake);
      errorSound();
    }
  }

  void pinVisibility() {
    showCipherAtMenu.value = !showCipherAtMenu.value;
  }

  void turnOffCipherLogin() {print(loginWithCipher.value);
    btnPressedSound();
    var box = Hive.box(loginBoxName);
    var cipher = box.put('isCipherActive', false);
    loginWithCipher.value = false;
  }

  void turnOnCipherLogin() {print(loginWithCipher.value);
    btnPressedSound();
    String cipher = loginEditingController2.value.text;
    if (cipher.isNotEmpty && cipher.length == 4) {
      var box = Hive.box(loginBoxName);
      box.put('isCipherActive', true);
      box.put('cipher', cipher);
      showCipherAtMenu.value = false;
      loginWithCipher.value = true;
      correctSound();
    } else {
      errorController2.value.add(ErrorAnimationType.shake);
      errorSound();
    }
  }

  void getCiphers() async {
    ciphers.value = ciphersBox.values
        .where((CipherModel) => CipherModel.type == 'cipher')
        .toList();
  }

  void getPasswords() async {
    passwords.value = ciphersBox.values
        .where((CipherModel) => CipherModel.type == 'password')
        .toList();
  }

  void getKeywords() async {
    myKeywords.value = ciphersBox.values
        .where((CipherModel) => CipherModel.type == 'keyword')
        .toList();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void saveCipher(String type) {
    String name = cipherNameController.value.text.toString();
    String cipher = cipherCipherController.value.text.toString();
    bool error = false;
    if (name.isEmpty) {
      Get.snackbar('Error', 'Enter name',
          backgroundColor: Colors.red, colorText: Colors.white);
      error = true;
    }

    if (cipher.isEmpty) {
      Get.snackbar('Error', 'Enter ${type.toUpperCase()}',
          backgroundColor: Colors.red, colorText: Colors.white);
      error = true;
    }

    if (type == 'cipher') {
      if (cipher.isEmpty) {
        Get.snackbar('Error', '${type.toUpperCase()} can\'t be empty',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      } else if (cipher.length < 3) {
        Get.snackbar('Error', '${type.toUpperCase()} must be characters 3 - 8',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      } else if (!isNumeric(cipher)) {
        Get.snackbar('Error', '${type.toUpperCase()} must be numbers.',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      }
    } else if (type == 'password') {
      if (cipher.isEmpty) {
        Get.snackbar('Error', '${type.toUpperCase()} can\'t be empty',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      } else if (cipher.length < 3 || cipher.length > 8) {
        Get.snackbar('Error', '${type.toUpperCase()} must be characters 3 - 23',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      }
    }

    if (!error) {
      CipherModel c = CipherModel(
          id: const Uuid().v1(),
          name: name,
          cipher: cipher,
          type: type,
          createdAt: DateTime.now().toString());
      ciphersBox.put(c.id, c);
      Get.snackbar('Success', '${type.toUpperCase()} saved!',
          backgroundColor: Colors.green, colorText: Colors.white);
      getCiphers();
      getPasswords();
      getKeywords();
      cipherNameController.value.clear();
      cipherCipherController.value.clear();
    }
  }

  void saveEditedCipher(String cipherId, String type) {
    String name = cipherNameController.value.text.toString();
    String cipher = cipherCipherController.value.text.toString();
    bool error = false;
    if (name.isEmpty) {
      Get.snackbar('Error', 'Enter name',
          backgroundColor: Colors.red, colorText: Colors.white);
      error = true;
    }

    if (cipher.isEmpty) {
      Get.snackbar('Error', 'Enter ${type.toUpperCase()}',
          backgroundColor: Colors.red, colorText: Colors.white);
      error = true;
    }

    if (type == 'cipher') {
      if (cipher.isEmpty) {
        Get.snackbar('Error', '${type.toUpperCase()} can\'t be empty',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      } else if (cipher.length < 3 || cipher.length > 8) {
        Get.snackbar('Error', '${type.toUpperCase()} must be characters 3 - 8',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      } else if (!isNumeric(cipher)) {
        Get.snackbar('Error', '${type.toUpperCase()} must be numbers.',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      }
    } else if (type == 'password') {
      if (cipher.isEmpty) {
        Get.snackbar('Error', '${type.toUpperCase()} can\'t be empty',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      } else if (cipher.length < 3 || cipher.length > 8) {
        Get.snackbar('Error', '${type.toUpperCase()} must be characters 3 - 23',
            backgroundColor: Colors.red, colorText: Colors.white);
        error = true;
      }
    }

    if (!error) {
      CipherModel c = CipherModel(
          id: const Uuid().v1(),
          name: name,
          cipher: cipher,
          type: type,
          createdAt: DateTime.now().toString());
      ciphersBox.put(cipherId, c);
      Get.snackbar('Success', '${type.toUpperCase()} updated!',
          backgroundColor: Colors.green, colorText: Colors.white);
      getCiphers();
      getPasswords();
      getKeywords();
      cipherNameController.value.clear();
      cipherCipherController.value.clear();
    }
  }

  void deleteCipher(String cipherId, int listIndex, String type) async {
    await ciphersBox.delete(cipherId);

    if (type == 'cipher') {
      ciphers.removeAt(listIndex);
    } else if (type == 'password') {
      passwords.removeAt(listIndex);
    } else {
      myKeywords.removeAt(listIndex);
    }
  }

  void generate() {
    if (activeGen.value == ActiveGenerator.isGenKeyword) {
      Random random = Random();
      int randomIndex = 0 + random.nextInt((keywords.length + 1) - 0);
      genController.value.text = keywords[randomIndex];
    } else if (activeGen.value == ActiveGenerator.isGenCipher) {
      Random random = Random();
      int randomIndex = 3 + random.nextInt((8 + 1) - 3);
      genController.value.text = getRandomCipherString(randomIndex);
    } else if (activeGen.value == ActiveGenerator.isGenPassword) {
      Random random = Random();
      int randomIndex = 3 + random.nextInt((23 + 1) - 3);
      genController.value.text = getRandomPasswordString(randomIndex);
    }
  }
}
