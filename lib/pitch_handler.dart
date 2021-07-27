library pitchupdart;

import 'dart:math';

import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_result.dart';
import 'package:pitchupdart/tuning_status.dart';

class PitchHandler {
  final InstrumentType _instrumentType;
  dynamic _minimumPitch;
  dynamic _maximumPitch;
  dynamic _noteStrings;

  PitchHandler(this._instrumentType) {
    switch (_instrumentType) {
      case InstrumentType.guitar:
        _minimumPitch = 80.0;
        _maximumPitch = 1050.0;
        _noteStrings = [
          "C",
          "C#",
          "D",
          "D#",
          "E",
          "F",
          "F#",
          "G",
          "G#",
          "A",
          "A#",
          "B"
        ];
        break;
    }
  }

  PitchResult handlePitch(double pitch) {
    if (_isPitchInRange(pitch)) {
      final noteLiteral = _noteFromPitch(pitch);
      final expectedFrequency = _frequencyFromNoteNumber(_midiFromPitch(pitch));
      final diff = _diffFromTargetedNote(pitch);
      final tuningStatus = _getTuningStatus(diff);
      final diffCents =
          _diffInCents(expectedFrequency, expectedFrequency - diff);

      return PitchResult(
          noteLiteral, tuningStatus, expectedFrequency, diff, diffCents);
    }

    return PitchResult("", TuningStatus.undefined, 0.00, 0.00, 0.00);
  }

  bool _isPitchInRange(double pitch) {
    return pitch > _minimumPitch && pitch < _maximumPitch;
  }

  String _noteFromPitch(double frequency) {
    final noteNum = 12.0 * (log((frequency / 440.0)) / log(2.0));
    return _noteStrings[
        ((noteNum.roundToDouble() + 69.0).toInt() % 12.0).toInt()];
  }

  double _diffFromTargetedNote(double pitch) {
    final targetPitch = _frequencyFromNoteNumber(_midiFromPitch(pitch));
    return targetPitch - pitch;
  }

  double _diffInCents(double expectedFrequency, double frequency) {
    return 1200.0 * log(expectedFrequency / frequency);
  }

  TuningStatus _getTuningStatus(double diff) {
    if (diff >= -0.3 && diff <= 0.3) {
      return TuningStatus.tuned;
    } else if (diff >= -1.0 && diff <= 0.0) {
      return TuningStatus.toohigh;
    } else if (diff > 0.0 && diff <= 1.0) {
      return TuningStatus.toolow;
    } else if (diff >= double.negativeInfinity && diff <= -1.0) {
      return TuningStatus.waytoohigh;
    } else {
      return TuningStatus.waytoolow;
    }
  }

  int _midiFromPitch(double frequency) {
    final noteNum = 12.0 * (log((frequency / 440.0)) / log(2.0));
    return (noteNum.roundToDouble() + 69.0).toInt();
  }

  double _frequencyFromNoteNumber(int note) {
    final exp = (note - 69.0).toDouble() / 12.0;
    return (440.0 * pow(2.0, exp)).toDouble();
  }
}
