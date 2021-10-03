part of dashboard;

class _TopMusic extends GetView<DashboardController> {
  const _TopMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Top Music",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 1),
            IconButton(
              icon: Icon(FontAwesomeIcons.longArrowAltLeft),
              onPressed: () {},
              tooltip: "previous",
            ),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(FontAwesomeIcons.longArrowAltRight),
              onPressed: () {},
              tooltip: "next",
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.listTopMusic
                  .map(
                    (e) => CardMusic.large(
                      size: (Responsive.isMobile(context))
                          ? Size(170, 170)
                          : (Responsive.isTablet(context))
                              ? Size(240, 240)
                              : Size(320, 320),
                      data: CardMusicData(
                          image: e.image,
                          title: e.title,
                          subtitle: e.singerName,
                          duration: e.duration,
                          isPlaying: false),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
