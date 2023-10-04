import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hourProvider = Provider<TextEditingController>((ref) {
  return TextEditingController(text: "00");
});
final minuteProvider = Provider<TextEditingController>((ref) {
  return TextEditingController(text: "00");
});
final secondProvider = Provider<TextEditingController>((ref) {
  return TextEditingController(text: "05");
});

final isPausedProvider = StateProvider<bool>((ref) {
  return false;
});
final isRestartedProvider = StateProvider<bool>((ref) {
  return false;
});
