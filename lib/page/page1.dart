import 'package:errovideo/page/player_page.dart';
import 'package:errovideo/stores/core_store.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
