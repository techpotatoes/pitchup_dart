library pitchupdart;

import 'package:pitchupdart/tuning_status.dart';

class PitchResult {
  final String note;
  final TuningStatus tuningStatus;
  final double expectedFrequency;
  final double diffFrequency;
  final double diffCents;

  PitchResult(this.note, this.tuningStatus, this.expectedFrequency,
      this.diffFrequency, this.diffCents);
}
