## Pitchup library

This library is a port from the kotlin library https://github.com/techpotatoes/pitchup. It can be used to implement your own instrument tuning app.

## Features

Instruments supported for now: Guitar

## Getting started

To import the library into your project, go to your project pubspec.yaml and add the dependency: 

```dart
dependencies:
  pitchupdart: ^0.0.2
```

## Usage

Call the function handlePitch and give it the pitch you want to evaluate. 

```dart
//Create a PitchHandler and choose the instrument type
final pitchUp = PitchHandler(InstrumentType.guitar);

//Uses the pitchUp library to check if a a given pitch consists of a guitar note and if it's tuned 
final handledPitchResult = pitchUp.handlePitch(pitch);
```

The handledPitchResult containing the result of calculation will return: 
  
  - note: The closest note to the pitch that was given. If any.
  - tuningStatus: 
    - tuned
    - toolow
    - toohigh
    - waytoolow
    - waytoohigh
    - undefined - The pitch is not close to a expected guitar note.
  - expectedFrequency: The expected frequency of the closest note.
  - diffFrequency: The difference of the frequency found in the analised pitch compared to the expected pitch of the closest note. 
  - diffCents: The interval difference in cents to the expected closest tuned note. 

See the full example here how to use the library and how to obtain a pitch given an audio sample: https://github.com/techpotatoes/pitchup_flutter_sample

## Contributing

Please, drop me an email if you have any suggestions, problems or feedback. Feel free to submit a pull request if you improved the library and want to share it. 

### Privacy Policy

This page informs you of our policies regarding the collection, use and disclosure of Personal Information when you use our Service.

The library don't store or share any kind of information. No data is saved or shared through any means. 