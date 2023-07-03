import 'package:cipher_saver/cipher_model_view.dart';
import 'package:cipher_saver/constants/colors.dart';
import 'package:cipher_saver/constants/variables.dart';
import 'package:cipher_saver/models/cipher.dart';
import 'package:cipher_saver/widgets/cipher_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPasswords extends StatelessWidget {
  MyPasswords({Key? key}) : super(key: key);

  final viewModel = Get.put(CipherViewModel());

  @override
  Widget build(BuildContext context) {

    viewModel.getPasswords();

    return Container(
      padding: const EdgeInsets.all(21),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: viewModel.passwords.value.isEmpty
                  ? const Center(
                      child: Text(
                        'CREATE THE PASSWORD THAT DON\'T FORGET IT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 48,
                          fontFamily: 'Khand',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  // : GetBuilder<CipherViewModel>(
                  //     builder: (cvm) => ListView.builder(
                  //       itemCount: cvm.passwords.value.length,
                  //       itemBuilder: (context, index) =>
                  //           CipherItem(cipher: cvm.passwords.value[index], listIndex: index, type: 'password'),
                  //     ),
                  //   )
            : Obx(() => ListView.builder(
                  itemCount: viewModel.passwords.value.length,
                  itemBuilder: (context, index) =>
                      CipherItem(cipher: viewModel.passwords.value[index], listIndex: index, type: 'password'),
                ),
              )

          ),
          GestureDetector(
            onTap: () {
              viewModel.cipherNameController.value.clear();
              viewModel.cipherCipherController.value.clear();
              Get.toNamed('/new-password');
              viewModel.btnPressedSound();
            },
            child: Container(
              // width: 184.93,
              height: 58,
              margin: const EdgeInsets.only(top: 20, bottom: 60),
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
                  'CREATE PASSWORD',
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
