import 'package:cipher_saver/cipher_model_view.dart';
import 'package:cipher_saver/constants/colors.dart';
import 'package:cipher_saver/constants/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Menu extends StatelessWidget {

  Menu({Key? key}) : super(key: key);


  final viewModel = Get.put(CipherViewModel());


  @override
  Widget build(BuildContext context) {



    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // width: dou,
            height: 232,
            margin: const EdgeInsets.fromLTRB(35, 35, 35, 35),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                  end: Alignment(0.9, -0.9),
                  begin: Alignment(-0.5, 0.1),
                  colors: [
                    // Color(0xFFD5D5D5),
                    Color(0xFF3F3F3F),
                    Color(0xFF040000)
                  ]
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(16),
                      child: Obx(() => GestureDetector(
                         onTap: (){
                           viewModel.pinVisibility();
                         },
                          child: viewModel.showCipherAtMenu.value ?
                          Image.asset('assets/open_eye.png', width: 28,height: 28,) :
                          Image.asset('assets/closed_eye.png', width: 28,height: 28,))),
                    )
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Obx(
                          () => PinCodeTextField(
                        length: 4,
                        obscureText: !viewModel.showCipherAtMenu.value,
                        keyboardType: TextInputType.number,
                        // obscuringWidget: const Icon(Icons.star),
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(0),
                            fieldHeight: 80,
                            fieldWidth: 65,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            inactiveBorderWidth: 0,
                            borderWidth: 0,
                            activeColor: yellow,
                            selectedColor: yellow,
                            inactiveColor: Colors.white,
                            errorBorderColor: Colors.red,
                            selectedFillColor: yellow),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        errorAnimationController: viewModel.errorController2.value,
                        controller: viewModel.loginEditingController2.value,
                        onCompleted: (v) {

                        },
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          // print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              viewModel.turnOnCipherLogin();
            },
            child: Obx(() =>
              Container(
                width: 184.93,
                height: 58,
                margin: const EdgeInsets.only(top: 30),
                decoration: ShapeDecoration(
                  color: viewModel.loginWithCipher.value ? shadowYellow : yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.38),
                  ),
                  shadows:  [
                    BoxShadow(
                      color: viewModel.loginWithCipher.value ? yellow : shadowYellow,
                      blurRadius: 0,
                      offset: const Offset(0, 5.04),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'ON',
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
          ),
          GestureDetector(
            onTap: () {
              viewModel.turnOffCipherLogin();
            },
            child: Obx(() =>
              Container(
                width: 184.93,
                height: 58,
                margin: const EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                  color: !viewModel.loginWithCipher.value ? shadowYellow : yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.38),
                  ),
                  shadows:  [
                    BoxShadow(
                      color:  !viewModel.loginWithCipher.value ? yellow : shadowYellow,
                      blurRadius: 0,
                      offset: const Offset(0, 5.04),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'OFF',
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
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Stack(
                children: [
                  Text(
                    'ENTER BY CIPHER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        // color: Color(0xFF5F5F5F),
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black),
                  ),
                  const Text(
                    'ENTER BY CIPHER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF5F5F5F),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
