import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/app/constants/app_constant.dart';

enum SidebarPage {
  home,
  playlist,
  artist,
  albums,
  radio,
  event,
  podcast,
  forYou
}

class SideBarButton extends StatelessWidget {
  const SideBarButton(
      {required this.value, required this.groupValue, this.onChanged, Key? key})
      : super(key: key);

  final SidebarPage value;
  final SidebarPage groupValue;
  final Function(SidebarPage value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: groupValue == value
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Expanded(
          child: Opacity(
            opacity: groupValue == value ? 1 : 0.5,
            child: ListTile(
              leading: Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  getIconsPath(value),
                  height: 16,
                ),
              ),
              title: Text(
                getName(value),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                if (groupValue != value && onChanged != null) {
                  onChanged!(value);
                }
              },
              horizontalTitleGap: 5,
            ),
          ),
        ),
      ],
    );
  }

  String getIconsPath(SidebarPage value) {
    switch (value) {
      case SidebarPage.home:
        return IconConstant.home;

      case SidebarPage.playlist:
        return IconConstant.playlist;

      case SidebarPage.artist:
        return IconConstant.user;
      case SidebarPage.albums:
        return IconConstant.album;

      case SidebarPage.radio:
        return IconConstant.radio;
      case SidebarPage.event:
        return IconConstant.event;

      case SidebarPage.podcast:
        return IconConstant.mic;

      case SidebarPage.forYou:
        return IconConstant.hearth;
    }
  }

  String getName(SidebarPage value) {
    switch (value) {
      case SidebarPage.home:
        return "Home";

      case SidebarPage.playlist:
        return "Playlist";

      case SidebarPage.artist:
        return "Artist";
      case SidebarPage.albums:
        return "Albums";

      case SidebarPage.radio:
        return "Radio";
      case SidebarPage.event:
        return "Event";

      case SidebarPage.podcast:
        return "Podcast";

      case SidebarPage.forYou:
        return "For You";
    }
  }
}
