import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productivity_timer/widgets.dart';

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
        home: const TimerHomePage());
  }
}

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;
  const TimerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: emptyMethod,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: const Color.fromARGB(255, 125, 86, 192),
                    text: 'Short Break',
                    onPressed: emptyMethod,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: const Color(0xFF7C50C7),
                    text: 'Long Break',
                    onPressed: emptyMethod,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding))
                ],
              ),
              Expanded(
                  child: CircularPercentIndicator(
                radius: availableWidth / 2.5,
                lineWidth: 8.0,
                percent: 1,
                progressColor: const Color(0xFF7C50C7),
                center: Text(
                  '30:00',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              )),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: Colors.redAccent,
                    text: 'Stop',
                    onPressed: emptyMethod,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                      child: ProductivityButton(
                    color: Colors.lightGreen,
                    text: 'Restart',
                    onPressed: emptyMethod,
                  )),
                  Padding(padding: EdgeInsets.all(defaultPadding))
                ],
              )
            ],
          );
        }));
  }

  void emptyMethod() {}
}
