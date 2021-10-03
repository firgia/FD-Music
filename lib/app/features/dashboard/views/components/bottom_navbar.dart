part of dashboard;

class _BottomNavbar extends GetView<DashboardPlayMusicController> {
  _BottomNavbar({Key? key}) : super(key: key);

  final _sliderValue = 0.6.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (Responsive.isMobile(context)) ? 80 : 120,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        elevation: 10,
        shadowColor: Colors.black26,
        color: Colors.white,
        child: (Responsive.isMobile(context))
            ? _mobileNavbar()
            : Row(
                children: [
                  Flexible(flex: 1, child: _label()),
                  Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          _button(),
                          _slider(),
                        ],
                      )),
                  Flexible(flex: 1, child: _actionsButton()),
                ],
              ),
      ),
    );
  }

  Widget _mobileNavbar() {
    return InkWell(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      onTap: () => showBottomSheetDetailSong(),
      child: Row(
        children: [
          Flexible(flex: 1, child: _label()),
          Flexible(
            flex: 1,
            child: _button(),
          ),
        ],
      ),
    );
  }

  Widget _label() {
    return Row(
      children: [
        SizedBox(width: 20),
        ShadowImage(
          imageProvider: controller.musicPlay.image,
          size: Size(60, 60),
          borderRadius: BorderRadius.circular(30),
          offset: Offset(0, 5),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.musicPlay.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
                controller.musicPlay.singerName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget _button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 30,
          icon: Icon(
            Icons.fast_rewind_outlined,
          ),
          onPressed: () {},
          tooltip: "previous song",
        ),
        Obx(
          () => IconButton(
            iconSize: 40,
            icon: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: controller.animationPausePlay,
              color: Theme.of(Get.context!).primaryColor,
            ),
            tooltip: (controller.isPlaying.value) ? "pause" : "play",
            onPressed: () => controller.playOrPause(),
          ),
        ),
        IconButton(
          iconSize: 30,
          icon: Icon(
            Icons.fast_forward_outlined,
          ),
          onPressed: () {},
          tooltip: "next song",
        ),
      ],
    );
  }

  Widget _slider() {
    return Obx(
      () => Row(
        children: [
          Text(Duration(
                  seconds: (controller.musicPlay.duration.inSeconds *
                          _sliderValue.value)
                      .toInt())
              .formatMS()),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(Get.context!).copyWith(
                  thumbColor: Colors.transparent,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0)),
              child: Obx(
                () => Slider(
                  value: _sliderValue.value,
                  activeColor: Theme.of(Get.context!).primaryColor,
                  onChanged: (value) => _sliderValue.value = value,
                ),
              ),
            ),
          ),
          Text(controller.musicPlay.duration.formatMS()),
        ],
      ),
    );
  }

  Widget _actionsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(flex: 5),
        IconButton(
            icon: SvgPicture.asset(IconConstant.hearth),
            onPressed: () {},
            tooltip: "Liked song"),
        Spacer(flex: 1),
        IconButton(
          icon: SvgPicture.asset(IconConstant.music),
          onPressed: () {},
          tooltip: "List music",
        ),
        Spacer(flex: 1),
        IconButton(
          icon: SvgPicture.asset(IconConstant.repeat),
          onPressed: () {},
          tooltip: "Repeat",
        ),
        SizedBox(width: 20),
      ],
    );
  }

  void showBottomSheetDetailSong() {
    Get.bottomSheet(
        SizedBox(
          height: Get.height * .95,
          child: Column(
            children: [
              Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: kDefaultPadding),
                  IconButton(
                    icon: Icon(Icons.arrow_downward_rounded),
                    onPressed: () {
                      if (Get.isBottomSheetOpen ?? false) {
                        Get.back();
                      }
                    },
                    tooltip: "close",
                  ),
                  Flexible(child: _actionsButton()),
                ],
              ),
              Spacer(flex: 2),
              ShadowImage(
                imageProvider: controller.musicPlay.image,
                size: Size(Get.width * .7, Get.width * .7),
                borderRadius: BorderRadius.circular(20),
              ),
              Spacer(flex: 2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  controller.musicPlay.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  controller.musicPlay.singerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: _slider(),
              ),
              Spacer(flex: 1),
              _button(),
              Spacer(flex: 3),
            ],
          ),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white);
  }
}
