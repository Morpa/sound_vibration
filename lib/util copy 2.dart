import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';

enum AudioType { error, success }

/// The `AudioVibrationUtil` class provides methods to play audio and vibrate the
/// device based on the specified audio type.
class AudioVibrationUtil {
  static late AudioPlayer _errorAudio;
  static late AudioPlayer _successAudio;

  static void _initializeAudioPlayer() {
    _errorAudio = AudioPlayer()..setAsset('assets/sounds/negative.wav');
    _successAudio = AudioPlayer()..setAsset('assets/sounds/positive.wav');
  }

  static void _disposeAudioPlayer() async {
    await _successAudio.dispose();
    await _errorAudio.dispose();
  }

  static Future<void> playAudioAndVibrate(AudioType audioType) async {
    _initializeAudioPlayer();

    if (audioType == AudioType.error) {
      await Vibration.vibrate(duration: 1500, amplitude: 255);
      await _errorAudio.play();
    }

    if (audioType == AudioType.success) {
      await Vibration.vibrate(duration: 1000, amplitude: 155);
      await _successAudio.play();
    }

    _disposeAudioPlayer();
  }
}
