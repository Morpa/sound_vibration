import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';

class AudioVibrationUtil {
  static AudioPlayer? _errorAudio;
  static AudioPlayer? _successAudio;

  static void initializeAudioPlayer() {
    _errorAudio = AudioPlayer()..setAsset('assets/sounds/negative.wav');
    _successAudio = AudioPlayer()..setAsset('assets/sounds/positive.wav');
  }

  static Future<void> playAudioAndVibrate(bool checker) async {
    if (_errorAudio == null || _successAudio == null) {
      initializeAudioPlayer();
    }

    Vibration.vibrate(duration: 1000, amplitude: 255);
    await _successAudio!.play();

    if (checker) {
      Vibration.vibrate(duration: 1000, amplitude: 255);
      await _errorAudio!.play();
    } else {
      Vibration.vibrate(duration: 1000, amplitude: 255);
      await _successAudio!.play();
    }
  }
}
