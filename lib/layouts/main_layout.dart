import 'package:cipher_saver/cipher_model_view.dart';
import 'package:cipher_saver/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  final Widget pageContent;
   MainLayout({Key? key, required this.pageContent}) : super(key: key);


  final viewModel = Get.put(CipherViewModel());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Expanded(child: pageContent),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: double.infinity,
                      // height: 183,
                      decoration: const ShapeDecoration(
                        gradient: LinearGradient(
                          end: Alignment(0.1, -0.1),
                          begin: Alignment(-0.9, 0.5),
                          colors: [
                            // Color(0xFFD5D5D5),
                            Color(0xFF3F3F3F),
                            Color(0xFF040000)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(29),
                              topRight: Radius.circular(29)),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Color(0xFF424242), width: 2),
                                      bottom: BorderSide(color: Color(0xFF424242), width: 4)
                                    )
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      viewModel.changeMenu(ActiveMenu.isMenuActive);
                                    },
                                    child: Obx(() =>
                                      Text(
                                        'MENU',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: viewModel.activeMenu.value == ActiveMenu.isMenuActive ? yellow :  Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Khand',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(color: Color(0xFF424242), width: 2),
                                          bottom: BorderSide(color: Color(0xFF424242), width: 4)
                                      )
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      viewModel.changeMenu(ActiveMenu.isMyCiphersActive);
                                    },
                                    child: Obx(() =>
                                      Text(
                                        'MY CIPHERS',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:  viewModel.activeMenu.value == ActiveMenu.isMyCiphersActive ? yellow :  Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Khand',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right: BorderSide(color: Color(0xFF424242), width: 2),
                                          bottom: BorderSide(color: Color(0xFF424242), width: 4)
                                      )
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      viewModel.changeMenu(ActiveMenu.isMyPasswordActive);
                                    },
                                    child: Obx(() =>
                                      Text(
                                        'MY PASSWORDS',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:  viewModel.activeMenu.value == ActiveMenu.isMyPasswordActive ? yellow :  Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Khand',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          left: BorderSide(color: Color(0xFF424242), width: 2),
                                          bottom: BorderSide(color: Color(0xFF424242), width: 4)
                                      )
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      viewModel.changeMenu(ActiveMenu.isMyKeywordsActive);
                                    },
                                    child: Obx(() =>
                                      Text(
                                        'MY KEYWORDS',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:  viewModel.activeMenu.value == ActiveMenu.isMyKeywordsActive ? yellow :  Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Khand',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: GestureDetector(
                                    onTap: (){
                                      viewModel.changeMenu(ActiveMenu.isGeneratorActive);
                                    },
                                    child: Obx(() =>
                                      Text(
                                        'GENERATOR',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:  viewModel.activeMenu.value == ActiveMenu.isGeneratorActive ? yellow :  Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Khand',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
