import 'package:flutter/material.dart';
import './widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextStyle textStyle = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Text("Work", style: textStyle),
        const Text(""),
        const Text(""),
        const SettingsButton(Color(0xff455A64), "-", -1),
        TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number),
        const SettingsButton(
          Color(0xff009688),
          "+",
          1,
        ),
        Text("Short", style: textStyle),
        const Text(""),
        const Text(""),
        const SettingsButton(
          Color(0xff455A64),
          "-",
          -1,
        ),
        TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number),
        const SettingsButton(Color(0xff009688), "+", 1),
        Text(
          "Long",
          style: textStyle,
        ),
        const Text(""),
        const Text(""),
        const SettingsButton(
          Color(0xff455A64),
          "-",
          -1,
        ),
        TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number),
        const SettingsButton(
          Color(0xff009688),
          "+",
          1,
        ),
      ],
    );
  }
}
