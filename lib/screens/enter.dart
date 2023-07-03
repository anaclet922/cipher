import 'dart:async';

import 'package:cipher_saver/constants/variables.dart';
import 'package:cipher_saver/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EnterIndex extends StatefulWidget {
  const EnterIndex({Key? key}) : super(key: key);

  @override
  State<EnterIndex> createState() => _EnterIndexState();
}

class _EnterIndexState extends State<EnterIndex> with TickerProviderStateMixin {

  late AnimationController _animationController;

  bool isCipherActive = false;

  @override
  void initState() {
    initAnimationController();
    var box = Hive.box(loginBoxName);
    var cipher = box.get('isCipherActive');

    if(cipher != null){
      isCipherActive = cipher;
    }

    Timer(const Duration(seconds: 3), () {
      _animationController.stop();
      if(isCipherActive){
        Get.toNamed('/enter-cipher');
      }else{
        Get.toNamed('/menu');
      }
      // Navigator.pushReplacementNamed(context, '/enter-cipher');
    });
    super.initState();
  }

  void initAnimationController(){
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(47, 0, 47, 100),
            child: Stack(
                children: [
              Text(
                'MAKE SURE NO ONE IS PEEKING INTO YOUR PHONE',
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
                'MAKE SURE NO ONE IS PEEKING INTO YOUR PHONE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF5F5F5F),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]),
          ),

          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child:  GradientCircularProgressIndicator(
              radius: 50,
              gradientColors: [
                Colors.black,
                Colors.white.withOpacity(0.09000000357627869),
              ],
              strokeWidth: 10.0,
            ),
          ),

        ],
      ),
    );
  }
}
