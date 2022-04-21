import 'package:flutter/material.dart';
import 'package:playerfrombase64/page/player_page.dart';
import 'package:playerfrombase64/stores/core_store.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  CoreStore coreStore = CoreStore();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.black,
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            await coreStore.saveVideo();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerPage(
                        coreStore: coreStore,
                      )),
            );
          },
          child: Container(
            alignment: Alignment.center,
            width: screenSize.width * 0.2,
            height: screenSize.height * 0.05,
            color: Colors.white,
            child: const Text(
              'Start',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, inherit: false),
            ),
          ),
        ),
      ),
    );
  }
}
