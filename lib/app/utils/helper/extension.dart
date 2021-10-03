extension DurationExtension on Duration {
  /// format to Minutes:Second
  /// example 90 seconds -> `1:30`
  String formatMS() {
    int currentSecond = this.inSeconds;

    int minutes = (currentSecond / 60).floor();
    int seconds = currentSecond - (minutes * 60);

    String sMinutes = (minutes > 0) ? "$minutes:" : "0:";
    String sSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";

    return "$sMinutes$sSeconds";
  }
}
