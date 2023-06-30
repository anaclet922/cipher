import 'package:flutter/material.dart';


class EnterLayout extends StatelessWidget {
  final Widget pageContent;
  const EnterLayout({Key? key, required this.pageContent}) : super(key: key);

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
                  fit: BoxFit.fill
              )
          ),
          child: pageContent
        ),
      ),
    );
  }
}
