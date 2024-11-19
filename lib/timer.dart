import 'dart:async';
import './timermodel.dart';

class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;
  late Timer timer;
  late Duration _time;
  late Duration _fullTime;

  String returnTime(Duration t) {
    String minutes =
        (t.inMinutes < 10) ? '0${t.inMinutes}' : t.inMinutes.toString();

    int numSeconds = t.inSeconds - (t.inMinutes * 60);

    String seconds = (numSeconds < 10) ? '0$numSeconds' : numSeconds.toString();
    String formattedTime = '$minutes:$seconds';
    return formattedTime;
  }

  Stream<TimerModel> stream() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int a) {
      String time;
      if (_isActive) {
        _time = _time - const Duration(seconds: 1);
        _radius = _time.inSeconds / _fullTime.inSeconds;

        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }

      time = returnTime(_time);
      return TimerModel(time, _radius);
    });
  }
}
