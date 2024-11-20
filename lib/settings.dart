import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final TextStyle textStyle = const TextStyle(
    fontSize: 24,
  );

  late TextEditingController txtWork;
  late TextEditingController txtShort;
  late TextEditingController txtLong;

  late SharedPreferences prefs;

  static const String WORKTIME = 'workTime';
  static const String SHORTBREAK = 'shortBreak';
  static const String LONGBREAK = 'longBreak';

  late int workTime;
  late int shortBreak;
  late int longBreak;

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();

    readSettings();
    super.initState();
  }

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
        SettingsButton(
            const Color(0xff455A64), "-", -1, updateSetting, WORKTIME, 50),
        TextField(
          style: textStyle,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: txtWork,
        ),
        SettingsButton(
            const Color(0xff009688), "+", 1, updateSetting, WORKTIME, 50),
        Text("Short", style: textStyle),
        const Text(""),
        const Text(""),
        SettingsButton(
            const Color(0xff455A64), "-", -1, updateSetting, SHORTBREAK, 50),
        TextField(
          style: textStyle,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: txtShort,
        ),
        SettingsButton(
            const Color(0xff009688), "+", 1, updateSetting, SHORTBREAK, 50),
        Text(
          "Long",
          style: textStyle,
        ),
        const Text(""),
        const Text(""),
        SettingsButton(
            const Color(0xff455A64), "-", -1, updateSetting, LONGBREAK, 50),
        TextField(
          style: textStyle,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: txtLong,
        ),
        SettingsButton(
            const Color(0xff009688), "+", 1, updateSetting, LONGBREAK, 50),
      ],
    );
  }

  readSettings() async {
    prefs = await SharedPreferences.getInstance();

    int workTime = prefs.getInt(WORKTIME) ?? 30;
    int shortBreak = prefs.getInt(SHORTBREAK) ?? 5;
    int longBreak = prefs.getInt(LONGBREAK) ?? 20;

    await prefs.setInt(WORKTIME, workTime);
    await prefs.setInt(SHORTBREAK, shortBreak);
    await prefs.setInt(LONGBREAK, longBreak);

    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  updateSetting(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          int workTime = prefs.getInt(key)!;
          workTime += value;

          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
          }

          setState(() {
            txtWork.text = workTime.toString();
          });
        }
        break;
      case SHORTBREAK:
        {
          int shortBreak = prefs.getInt(key)!;
          shortBreak += value;

          if (shortBreak >= 1 && shortBreak <= 120) {
            prefs.setInt(SHORTBREAK, shortBreak);
          }

          setState(() {
            txtShort.text = shortBreak.toString();
          });
        }
        break;
      case LONGBREAK:
        {
          int longBreak = prefs.getInt(key)!;
          longBreak += value;

          if (longBreak >= 1 && longBreak <= 180) {
            prefs.setInt(LONGBREAK, longBreak);
          }

          setState(() {
            txtLong.text = longBreak.toString();
          });
        }
        break;
    }
  }
}
