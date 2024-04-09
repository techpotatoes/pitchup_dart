/// @nodoc
library pitchupdart;

import 'package:pitchupdart/tuning_status.dart';

/// Indicates the result of validating a pitch for a instrument
class PitchResult {
  final String note;
  final TuningStatus tuningStatus;

  ///The expected frequency of the closest note.
  final double expectedFrequency;

  /// The difference of the frequency found in the analised pitch compared to the expected pitch of the closest note.
  final double diffFrequency;

  /// The interval difference in cents to the expected closest tuned note.
  final double diffCents;

  PitchResult(this.note, this.tuningStatus, this.expectedFrequency,
      this.diffFrequency, this.diffCents);
}
