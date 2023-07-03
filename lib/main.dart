import 'package:cipher_saver/constants/variables.dart';
import 'package:cipher_saver/layouts/enter_layout.dart';
import 'package:cipher_saver/layouts/main_layout.dart';
import 'package:cipher_saver/models/cipher.dart';
import 'package:cipher_saver/screens/enter.dart';
import 'package:cipher_saver/screens/enter_cipher.dart';
import 'package:cipher_saver/screens/generate.dart';
import 'package:cipher_saver/screens/my_keywords.dart';
import 'package:cipher_saver/screens/menu.dart';
import 'package:cipher_saver/screens/my_ciphers.dart';
import 'package:cipher_saver/screens/new_cipher.dart';
import 'package:cipher_saver/screens/new_keyword.dart';
import 'package:cipher_saver/screens/new_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/my_password.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CipherModelAdapter());
  await Hive.openBox(loginBoxName);
  await Hive.openBox<CipherModel>(cipherBoxName);

  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Khand',
        primaryColor: const Color(0xFFFFD600)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const EnterLayout(pageContent: EnterIndex(),),
        '/enter-cipher': (context) => EnterLayout(pageContent: EnterCipher(),),
        '/menu': (context) => MainLayout(pageContent: Menu()),
        '/my-ciphers': (context) => MainLayout(pageContent: MyCiphers()),
        '/new-cipher': (context) => MainLayout(pageContent: NewCipher()),
        '/my-passwords': (context) => MainLayout(pageContent: MyPasswords()),
        '/new-password':  (context) => MainLayout(pageContent: NewPassword()),
        '/generator': (context) => MainLayout(pageContent: Generate()),
        '/my-keywords': (context) => MainLayout(pageContent: Keywords()),
        '/new-keyword':  (context) => MainLayout(pageContent: NewKeyword()),
      },
    );
  }
}
