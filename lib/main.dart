import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productivity_timer/timermodel.dart';
import 'package:productivity_timer/widgets.dart';
import './timer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Work Timer',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: TimerHomePage());
  }
}

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;
  final CountDownTimer timer = CountDownTimer();

  TimerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    timer.startWork();

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Work Timer'),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;
          return Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: const Color.fromARGB(255, 146, 115, 201),
                    text: 'Work',
                    onPressed: timer.startWork,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: const Color.fromARGB(255, 125, 86, 192),
                    text: 'Short Break',
                    onPressed: () => timer.startBreak(true),
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: const Color(0xFF7C50C7),
                    text: 'Long Break',
                    onPressed: () => timer.startBreak(false),
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding))
                ],
              ),
              StreamBuilder(
                  initialData: '00:00',
                  stream: timer.stream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    TimerModel timer = (snapshot.data == '00:00')
                        ? TimerModel('00:00', 1)
                        : snapshot.data;

                    return Expanded(
                        child: CircularPercentIndicator(
                      radius: availableWidth / 2.5,
                      lineWidth: 8.0,
                      percent: timer.percent,
                      progressColor: const Color(0xFF7C50C7),
                      center: Text(
                        timer.time,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ));
                  }),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: Colors.redAccent,
                    text: 'Stop',
                    onPressed: timer.stopTimer,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: Colors.lightGreen,
                    text: 'Restart',
                    onPressed: timer.startTimer,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding))
                ],
              )
            ],
          );
        }));
  }
}
