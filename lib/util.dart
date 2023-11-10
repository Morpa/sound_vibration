import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';

enum AudioType { error, success }

class AudioVibrationUtil {
  static Future<void> playAudioAndVibrate(AudioType audioType) async {
    final errorAudio = AudioPlayer()..setAsset('assets/sounds/negative.wav');
    final successAudio = AudioPlayer()..setAsset('assets/sounds/positive.wav');

    if (audioType == AudioType.error) {
      await Vibration.vibrate(duration: 1500, amplitude: 255);
      try {
        await errorAudio.play();
      } catch (e) {
        log("Error playing error audio: $e");
      } finally {
        await errorAudio.dispose();
      }
    }

    if (audioType == AudioType.success) {
      await Vibration.vibrate(duration: 1000, amplitude: 155);
      try {
        await successAudio.play();
      } catch (e) {
        log("Error playing success audio: $e");
      } finally {
        await successAudio.dispose();
      }
    }

    // await errorAudio.dispose();
    // await successAudio.dispose();
  }
}
