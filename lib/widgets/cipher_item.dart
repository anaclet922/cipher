import 'package:cipher_saver/cipher_model_view.dart';
import 'package:cipher_saver/constants/colors.dart';
import 'package:cipher_saver/layouts/main_layout.dart';
import 'package:cipher_saver/models/cipher.dart';
import 'package:cipher_saver/screens/edit_cipher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class CipherItem extends StatelessWidget {
  CipherModel cipher;
  final int listIndex;
  final String type;
  CipherItem({super.key, required this.cipher, required this.listIndex, required this.type});

  final viewModel = Get.put(CipherViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        color: textButtonColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.to(MainLayout(pageContent: EditCipher(cipher: cipher)));
              viewModel.btnPressedSound();
            },
              child: Text(cipher.name, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),)
          ),
          GestureDetector(
            onTap: (){
                Get.dialog(
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Opacity(
                              opacity: 0.9,
                              child: Container(
                                width: double.infinity,
                                  margin: const EdgeInsets.fromLTRB(20, 120, 20,20),
                                  padding: const EdgeInsets.fromLTRB(20, 37, 20, 37),
                                  decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                                        child: Center(
                                          child: Stack(
                                              children: [
                                                Text(
                                                  'SURE?',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      decoration: TextDecoration.none,
                                                      fontWeight: FontWeight.w700,
                                                      foreground: Paint()
                                                        ..style = PaintingStyle.stroke
                                                        ..strokeWidth = 3
                                                        ..color = Colors.black),
                                                ),
                                                const Text(
                                                  'SURE?',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontSize: 40,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              viewModel.deleteCipher(cipher.id, listIndex, type);
                                              Navigator.of(context).pop();
                                              viewModel.btnPressedSound();
                                            },
                                            child: Container(
                                              width: 150,
                                              height: 58,
                                              margin: const EdgeInsets.only(top: 20),
                                              decoration: ShapeDecoration(
                                                color: textButtonColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(24.38),
                                                ),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 0,
                                                    offset: Offset(0, 5.04),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'YES',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 33.62,
                                                      fontFamily: 'BauhausHeavy',
                                                      fontWeight: FontWeight.w500,
                                                      decoration: TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              viewModel.btnPressedSound();
                                            },
                                            child: Container(
                                              width: 150,
                                              height: 58,
                                              margin: const EdgeInsets.only(top: 20),
                                              decoration: ShapeDecoration(
                                                color: textButtonColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(24.38),
                                                ),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 0,
                                                    offset: Offset(0, 5.04),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'NO',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 33.62,
                                                      fontFamily: 'BauhausHeavy',
                                                      fontWeight: FontWeight.w500,
                                                      decoration: TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        // barrierColor: textButtonColor,
                        barrierDismissible: false
                    );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(3)
              ),
              child: const Icon(Icons.close, color: textButtonColor,size: 25,),
            ),
          )
        ],
      ),
    );
  }
}
