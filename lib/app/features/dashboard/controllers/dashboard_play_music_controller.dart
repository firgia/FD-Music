part of dashboard;

class DashboardPlayMusicController extends GetxController
    with SingleGetTickerProviderMixin {
  late final AnimationController animationPausePlay;
  final isPlaying = false.obs;
  final musicPlay = DashboardMusic(
    image: AssetImage(ImageRasterConstant.maroon5),
    title: "Memories",
    singerName: "Maroon 5",
    duration: Duration(seconds: 221),
  );
  final currentDurationPlayInSecond = 0.obs;

  @override
  void onInit() {
    super.onInit();
    animationPausePlay = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _play();
  }

  void playOrPause() {
    if (isPlaying.value) {
      _pause();
    } else {
      _play();
    }
  }

  void _play() {
    isPlaying.value = true;
    animationPausePlay.forward();
    log("music is playing");
  }

  void _pause() {
    isPlaying.value = false;
    animationPausePlay.reverse();
    log("music is paused");
  }
}
