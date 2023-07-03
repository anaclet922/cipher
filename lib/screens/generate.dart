import 'package:cipher_saver/cipher_model_view.dart';
import 'package:cipher_saver/constants/colors.dart';
import 'package:cipher_saver/constants/variables.dart';
import 'package:cipher_saver/models/cipher.dart';
import 'package:cipher_saver/widgets/cipher_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Generate extends StatelessWidget {
  Generate({Key? key}) : super(key: key);

  final viewModel = Get.put(CipherViewModel());

  @override
  Widget build(BuildContext context) {
    viewModel.getCiphers();

    return Container(
      padding: const EdgeInsets.all(21),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding:  const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: textButtonColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      child: const Text(
                        'TYPE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          decoration: TextDecoration.none,
                          fontFamily: 'Khand',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Obx(() =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              viewModel.changeGenerator(ActiveGenerator.isGenCipher);
                            },
                            child: Text(
                              'CIPHER',
                              style: TextStyle(
                                color: viewModel.activeGen.value == ActiveGenerator.isGenCipher ? yellow :  Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                fontFamily: 'Khand',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              viewModel.changeGenerator(ActiveGenerator.isGenPassword);
                            },
                            child: Text(
                              'PASSWORD',
                              style: TextStyle(
                                color:  viewModel.activeGen.value == ActiveGenerator.isGenPassword ? yellow :  Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                fontFamily: 'Khand',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              viewModel.changeGenerator(ActiveGenerator.isGenKeyword);
                            },
                            child: Text(
                              'KEYWORD',
                              style: TextStyle(
                                color:  viewModel.activeGen.value == ActiveGenerator.isGenKeyword ? yellow :  Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                fontFamily: 'Khand',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      child: const Text(
                        'MARKS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          decoration: TextDecoration.none,
                          fontFamily: 'Khand',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Obx(() =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                             const Text(
                                '3-25',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Khand',
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: viewModel.activeGen.value == ActiveGenerator.isGenPassword ? const Icon(Icons.check, color: textButtonColor,size: 25,) : const Icon(Icons.square_rounded, color: Colors.yellow,size: 25,),
                              )
                            ],
                          ),
                          Row(
                            children: [
                             const Text(
                                '3-8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Khand',
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: viewModel.activeGen.value == ActiveGenerator.isGenCipher ? const Icon(Icons.check, color: textButtonColor,size: 25,) : const Icon(Icons.square_rounded, color: Colors.yellow,size: 25,),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 35,),
                    TextField(
                      controller:
                      viewModel.genController.value,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if(viewModel.genController.value.text.isNotEmpty) {
                              Clipboard.setData(ClipboardData(
                                  text: viewModel.genController.value.text));
                              Get.snackbar("Success", "Copied!",
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white);
                            }else{
                              Get.snackbar("Error", "Not content to copy",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            }
                          },
                          child: Container(
                            width: 67,
                            height: 28,
                            margin:
                            const EdgeInsets.only(top: 20),
                            decoration: ShapeDecoration(
                              color: Colors.black,
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
                                'COPY',
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
                    )
                  ],
                ),
              )
          ),
          GestureDetector(
            onTap: () {

              viewModel.generate();

            },
            child: Container(
              // width: 184.93,
              height: 58,
              margin: const EdgeInsets.fromLTRB(67, 20, 67, 60),
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
                  'GENERATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF515151),
                    fontSize: 33.62,
                    fontFamily: 'BauhausHeavy',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
