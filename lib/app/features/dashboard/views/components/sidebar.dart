part of dashboard;

class _Sidebar extends GetView<DashboardController> {
  _Sidebar({
    Key? key,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(height: 20),
            _profile(),
            SizedBox(height: 10),
            Divider(
              thickness: .5,
              indent: 10,
              endIndent: 10,
            ),
            Obx(
              () => _groupingButton(textHeader: "Browse", items: [
                SidebarPage.home,
                SidebarPage.playlist,
                SidebarPage.artist,
                SidebarPage.albums
              ]),
            ),
            Obx(
              () => _groupingButton(textHeader: "Discover", items: [
                SidebarPage.radio,
                SidebarPage.event,
                SidebarPage.podcast,
                SidebarPage.forYou
              ]),
            ),
            SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }

  Widget _profile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          ShadowImage(
            size: Size(70, 70),
            imageProvider: controller.profil.image,
            borderRadius: BorderRadius.circular(35),
            offset: Offset(-2, 5),
          ),
          SizedBox(height: 15),
          Text(
            controller.profil.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text(
            controller.profil.email,
            style: TextStyle(color: Theme.of(Get.context!).primaryColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _groupingButton(
      {required String textHeader, required List<SidebarPage> items}) {
    final _result = items
        .map(
          (e) => SideBarButton(
            value: e,
            groupValue: controller.pageSelected.value,
            onChanged: (value) {
              controller.pageSelected.value = value;
            },
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 10),
          child: Text(
            textHeader,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
      ]..addAll(_result),
    );
  }
}
