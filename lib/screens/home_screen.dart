import 'package:countdown_timer/extension/extension.dart';
import 'package:countdown_timer/providers/provider.dart';
import 'package:countdown_timer/screens/counter_screen.dart';
import 'package:countdown_timer/utils/colors.dart';
import 'package:countdown_timer/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Countdown"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    'Hours',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: R.sh(10, context),
                  ),
                  SizedBox(
                    width: R.sw(70, context),
                    child: TextField(
                      controller: ref.watch(hourProvider),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: R.sh(40, context)),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: R.sh(40, context)),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber))),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: R.sh(20, context)),
                child: Text(
                  ':',
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: R.sh(30, context)),
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Minutes',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: R.sh(10, context),
                  ),
                  SizedBox(
                    width: R.sw(70, context),
                    child: TextField(
                      controller: ref.watch(minuteProvider),
                      style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: R.sh(40, context)),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: R.sh(40, context)),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber))),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: R.sh(20, context)),
                child: Text(
                  ':',
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: R.sh(30, context)),
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Seconds',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: R.sh(10, context),
                  ),
                  SizedBox(
                    width: R.sw(70, context),
                    child: TextField(
                      controller: ref.watch(secondProvider),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: R.sh(40, context)),
                      decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: R.sh(40, context)),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber))),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: R.sh(100, context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(R.sw(50, context))),
                fixedSize: Size(R.sw(140, context), R.sh(50, context))),
            onPressed: () {
              context.goto(CounterScreen());
            },
            child: Text(
              "Start",
              style:
                  TextStyle(fontSize: R.sh(22, context), color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
