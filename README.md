## Pitchup library

This library is a port from the kotlin library https://github.com/techpotatoes/pitchup. It can be used to implement your own instrument tuning app.

## Features

Instruments supported: Guitar

## Getting started

To import the library into your project, go to your project pubspec.yaml and add the dependency.

## Usage

Call the function handlePitch and give it the pitch you want to evaluate. The result of the calculation will contain: 
  
  - note: The closest note to the pitch that was given. 
  - tuningStatus: tuned, toolow, toohigh, waytoolow, waytoohigh, undefined.
  - expectedFrequency: The expected frequency of the closest note.
  - diffFrequency: The difference of the frequency found in the analised pitch compared to the expected pitch of the closest note. 
  - diffCents: The interval difference in cents to the expected closest tuned note. 

See a sample of the library usage here: https://github.com/techpotatoes/pitchup-flutter-sample

## Additional information

This is an open-source library. Feel free to copy and modify it as you wish. You are also more than encoraged to submit pull request to fix or improve the library.