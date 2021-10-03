part of dashboard;

class _Header extends StatelessWidget {
  const _Header({this.onTapMenu, Key? key}) : super(key: key);

  final Function()? onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Responsive.isMobile(context))
          ? _mobileHeader()
          : Row(
              children: [
                if (!Responsive.isDesktop(context)) _buttonMenu(),
                SizedBox(
                  width: (Responsive.isDesktop(context)) ? 400 : 250,
                  child: _search(),
                ),
                Spacer(flex: 20),
                _upgradeToPremiumButton(),
                Spacer(flex: 2),
                _settingButton(),
                Spacer(flex: 1),
                _notificationButton(),
              ],
            ),
    );
  }

  Widget _mobileHeader() {
    return Container(
      height: 115,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buttonMenu(),
                Expanded(
                  child: _search(),
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Flexible(
            child: Row(
              children: [
                _upgradeToPremiumButton(),
                Spacer(),
                _settingButton(),
                _notificationButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonMenu() {
    return Padding(
      padding: const EdgeInsets.only(right: kDefaultPadding),
      child: IconButton(
          icon: SvgPicture.asset(IconConstant.menu), onPressed: onTapMenu),
    );
  }

  Widget _search() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(
            IconConstant.search,
            fit: BoxFit.cover,
          ),
        ),
        hintText: "Search for song, artist etc..",
      ),
    );
  }

  Widget _upgradeToPremiumButton() {
    final double _paddingHor = 40;
    final double _paddingVer = 20;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(Get.context!).canvasColor,
        onPrimary: Theme.of(Get.context!).primaryColor,
        side: BorderSide(
          color: Theme.of(Get.context!).primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal:
              _paddingHor * (Responsive.isMobile(Get.context!) ? .5 : 1),
          vertical: _paddingVer * (Responsive.isMobile(Get.context!) ? .5 : 1),
        ),
        elevation: 0,
      ),
      onPressed: () {},
      child: Text("Upgrade To Premium"),
    );
  }

  Widget _settingButton() {
    return IconButton(
      icon: SvgPicture.asset(IconConstant.settings),
      onPressed: () {},
      tooltip: "settings",
    );
  }

  Widget _notificationButton() {
    return IconButton(
      icon: SvgPicture.asset(IconConstant.notification),
      onPressed: () {},
      tooltip: "notification",
    );
  }
}
