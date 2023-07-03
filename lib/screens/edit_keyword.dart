import 'package:cipher_saver/cipher_model_view.dart';
import 'package:cipher_saver/constants/colors.dart';
import 'package:cipher_saver/constants/variables.dart';
import 'package:cipher_saver/models/cipher.dart';
import 'package:cipher_saver/widgets/cipher_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EditKeyword extends StatelessWidget {

  CipherModel keyword;

  EditKeyword({Key? key, required this.keyword}) : super(key: key);

  final viewModel = Get.put(CipherViewModel());

  @override
  Widget build(BuildContext context) {
    viewModel.cipherNameController.value.text = keyword.name;
    viewModel.cipherCipherController.value.text = keyword.cipher;
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 0.8,
          child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.fromLTRB(20, 37, 20, 37),
              decoration: BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.circular(20)),
              child: Card(
                color: yellow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'NAME',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        fontFamily: 'Khand',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller:
                      viewModel.cipherNameController.value,
                      // obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(
                            20, 5, 20, 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'KEYWORD',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            decoration: TextDecoration.none,
                            fontFamily: 'Khand',
                          ),
                        ),
                        GestureDetector(
                            onTap: () async{
                              ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
                              String? copiedText = cdata?.text;
                              if(copiedText != null){
                                viewModel.cipherCipherController.value.text = copiedText;
                              }
                              viewModel.btnPressedSound();
                            },
                          child: Container(
                            width: 67,
                            height: 28,
                            margin:
                            const EdgeInsets.only(top: 20),
                            decoration: ShapeDecoration(
                              color: textButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(24.38),
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
                                'PASTE',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'BauhausHeavy',
                                    fontWeight: FontWeight.w500,
                                    decoration:
                                    TextDecoration.none),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller:
                      viewModel.cipherCipherController.value,
                      // obscureText: true,
                      // keyboardType: TextInputType.number,
                      maxLength: 8,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(
                            20, 5, 20, 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  viewModel.saveEditedCipher(keyword.id, 'keyword');
                  Get.toNamed('/my-ciphers');
                  viewModel.btnPressedSound();
                },
                child: Container(
                  width: 184.93,
                  height: 58,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: ShapeDecoration(
                    color: yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.38),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: shadowYellow,
                        blurRadius: 0,
                        offset: Offset(0, 5.04),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'SAVE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF515151),
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
                  width: 184.93,
                  height: 58,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: ShapeDecoration(
                    color: yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.38),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: shadowYellow,
                        blurRadius: 0,
                        offset: Offset(0, 5.04),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'CANCEL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF515151),
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
        )
      ],
    );
  }
}
