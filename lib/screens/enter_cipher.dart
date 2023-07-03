import 'package:cipher_saver/cipher_model_view.dart';
import 'package:cipher_saver/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterCipher extends StatelessWidget {
  EnterCipher({Key? key}) : super(key: key);

  final viewModel = Get.put(CipherViewModel());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 0, 80, 100),
            child: Stack(
                children: [
              Text(
                'Enter your cipher',
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
                'Enter your cipher',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF5F5F5F),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]),
          ),
          Container(
            // width: dou,
            height: 232,
            margin: const EdgeInsets.fromLTRB(35, 35, 35, 35),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.86, -0.51),
                end: Alignment(-0.86, 0.51),
                colors: [Color(0xFFD5D5D5), Color(0xFF9A9A9A), Colors.black],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            child: Center(
              child: Obx(
                () => PinCodeTextField(
                  length: 4,
                  obscureText:  viewModel.showCipherAtMenu.value,
                  obscuringWidget: const Icon(Icons.star),
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
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
                  errorAnimationController: viewModel.errorController.value,
                  controller: viewModel.loginEditingController.value,
                  onCompleted: (v) {
                    // print("Completed");
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
          GestureDetector(
            onTap: () {
              viewModel.login();
            },
            child: Container(
              width: 184.93,
              height: 58,
              margin: const EdgeInsets.only(top: 80),
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
                  'OK',
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
    ;
  }
}
