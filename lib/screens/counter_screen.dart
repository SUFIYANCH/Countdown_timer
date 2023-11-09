import 'package:audioplayers/audioplayers.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:countdown_timer/providers/provider.dart';
import 'package:countdown_timer/utils/colors.dart';
import 'package:countdown_timer/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  CounterScreen({super.key});

  final AudioPlayer audioPlayer = AudioPlayer();
  final CountDownController countDownController = CountDownController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int hour = int.parse(ref.watch(hourProvider).text) * 3600;
    int min = int.parse(ref.watch(minuteProvider).text) * 60;
    int sec = int.parse(ref.watch(secondProvider).text);
    int startCount = hour + min + sec;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Countdown"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: R.sh(300, context),
              width: R.sw(300, context),
              child: CountDownProgressIndicator(
                controller: countDownController,
                strokeWidth: R.sw(6, context),
                valueColor: primaryColor,
                backgroundColor: Colors.grey.shade900,
                initialPosition: 0,
                duration: startCount,
                labelTextStyle: const TextStyle(color: Colors.white),
                timeTextStyle: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: R.sh(50, context)),
                timeFormatter: (seconds) {
                  return Duration(seconds: seconds)
                      .toString()
                      .split('.')[0]
                      .padLeft(8, '0');
                },
                onComplete: () {
                  audioPlayer.play(
                    AssetSource('censor-beep-joshua-chivers-short-2-00-00.mp3'),
                  );
                  ref.read(isPausedProvider.notifier).state = false;
                },
                autostart: true,
              ),
            ),
            SizedBox(
              height: R.sh(70, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(R.sw(50, context))),
                      fixedSize: Size(R.sw(120, context), R.sh(40, context))),
                  onPressed: () {
                    countDownController.restart(
                        duration: startCount, initialPosition: 0);
                    ref.read(isPausedProvider.notifier).state = false;
                  },
                  child: const Text("Restart"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(R.sw(50, context))),
                      fixedSize: Size(R.sw(120, context), R.sh(40, context))),
                  onPressed: () {
                    ref.read(isPausedProvider.notifier).state =
                        !ref.read(isPausedProvider.notifier).state;
                    ref.watch(isPausedProvider)
                        ? countDownController.pause()
                        : countDownController.resume();
                  },
                  child: Text(
                    ref.watch(isPausedProvider) ? "Resume" : "Pause",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
