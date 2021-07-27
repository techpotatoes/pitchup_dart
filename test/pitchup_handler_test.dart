// ignore_for_file: constant_identifier_names

import "package:test/test.dart";
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:pitchupdart/pitch_result.dart';
import 'package:pitchupdart/tuning_status.dart';

void main() {
  const epsilon = 0.05;
  const NOTE_E4 = 329.63;
  const NOTE_B3 = 246.94;
  const NOTE_G3 = 196.00;
  const NOTE_D3 = 146.83;
  const NOTE_A2 = 110.00;
  const NOTE_E2 = 82.41;
  const NOTE_E2_TOO_LOW = 82.10;
  const NOTE_E2_WAY_TOO_LOW = 81.40;
  const NOTE_E2_TOO_HIGH = 82.80;
  const NOTE_E2_WAY_TOO_HIGH = 83.50;

  const FREQUENCY_LESS_MINIMUM = 70.00;
  const FREQUENCY_MORE_MAXIMUM = 1100.00;

  final data = [
    [NOTE_E4, PitchResult("E", TuningStatus.tuned, NOTE_E4, 0.00, 0.00)],
    [NOTE_B3, PitchResult("B", TuningStatus.tuned, NOTE_B3, 0.00, 0.00)],
    [NOTE_G3, PitchResult("G", TuningStatus.tuned, NOTE_G3, 0.00, 0.00)],
    [NOTE_D3, PitchResult("D", TuningStatus.tuned, NOTE_D3, 0.00, 0.00)],
    [NOTE_A2, PitchResult("A", TuningStatus.tuned, NOTE_A2, 0.00, 0.00)],
    [NOTE_E2, PitchResult("E", TuningStatus.tuned, NOTE_E2, 0.00, 0.00)],
    [
      NOTE_E2_TOO_LOW,
      PitchResult("E", TuningStatus.toolow, NOTE_E2, 0.31, 4.47)
    ],
    [
      NOTE_E2_WAY_TOO_LOW,
      PitchResult("E", TuningStatus.waytoolow, NOTE_E2, 1.01, 14.75)
    ],
    [
      NOTE_E2_TOO_HIGH,
      PitchResult("E", TuningStatus.toohigh, NOTE_E2, -0.39, -5.70)
    ],
    [
      NOTE_E2_WAY_TOO_HIGH,
      PitchResult(
          "E", TuningStatus.waytoohigh, NOTE_E2, -1.10, -15.81310955724478)
    ],
    [
      FREQUENCY_LESS_MINIMUM,
      PitchResult("", TuningStatus.undefined, 0.00, 0.00, 0.00)
    ],
    [
      FREQUENCY_MORE_MAXIMUM,
      PitchResult("", TuningStatus.undefined, 0.00, 0.00, 0.00)
    ]
  ];
  group("given a pitch handler for a guitar", () {
    final pitchHandler = PitchHandler(InstrumentType.guitar);

    group('should return expected value for a given a pitch', () {
      for (var element in data) {
        final givenPitchStr = 'given the pitch: ' + element[0].toString();
        test(
            givenPitchStr +
                ' should return the note: ' +
                (element[1] as PitchResult).note, () {
          final result = pitchHandler.handlePitch(element[0] as double);
          expect(result.note, (element[1] as PitchResult).note);
        });

        test(
            givenPitchStr +
                ' should return the status: ' +
                (element[1] as PitchResult).tuningStatus.toString(), () {
          final result = pitchHandler.handlePitch(element[0] as double);
          expect(result.tuningStatus, (element[1] as PitchResult).tuningStatus);
        });
        test(
            givenPitchStr +
                ' should return the expected frequency: ' +
                (element[1] as PitchResult).expectedFrequency.toString(), () {
          final result = pitchHandler.handlePitch(element[0] as double);
          expect((element[1] as PitchResult).expectedFrequency,
              closeTo(result.expectedFrequency, epsilon));
        });

        test(
            givenPitchStr +
                ' should return the freq diff: ' +
                (element[1] as PitchResult).diffFrequency.toString(), () {
          final result = pitchHandler.handlePitch(element[0] as double);
          expect((element[1] as PitchResult).diffFrequency,
              closeTo(result.diffFrequency, epsilon));
        });

        test(
            givenPitchStr +
                ' should return the diff cents: ' +
                (element[1] as PitchResult).diffCents.toString(), () {
          final result = pitchHandler.handlePitch(element[0] as double);
          expect(
            (element[1] as PitchResult).diffCents,
            closeTo(result.diffCents, epsilon),
          );
        });
      }
    });
  });
}
