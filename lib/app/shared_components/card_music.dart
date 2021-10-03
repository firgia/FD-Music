import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/app/constants/app_constant.dart';
import 'package:music_app/app/shared_components/shadow_image.dart';
import 'package:music_app/app/utils/helper/extension.dart';

enum _CardMusicType {
  normal,
  large,
}

class CardMusicData {
  final ImageProvider image;
  final String title;
  final String subtitle;
  final Duration duration;
  final bool isPlaying;

  CardMusicData(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.duration,
      required this.isPlaying});
}

class CardMusic extends StatelessWidget {
  CardMusic(
      {required this.data,
      this.isDense = false,
      required this.onPressedPlayOrPause,
      required this.onPressedLikedSong,
      Key? key})
      : _type = _CardMusicType.normal,
        size = Size.zero,
        super(key: key);

  final _CardMusicType _type;
  final CardMusicData data;
  final bool isDense;
  final Function()? onPressedPlayOrPause;
  final Function()? onPressedLikedSong;
  final Size size;

  CardMusic.large(
      {required this.data, this.size = const Size(320, 320), Key? key})
      : _type = _CardMusicType.large,
        this.isDense = false,
        this.onPressedLikedSong = null,
        this.onPressedPlayOrPause = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return (_type == _CardMusicType.normal)
        ? _Normal(
            data: data,
            isDense: isDense,
            onPressedPlayOrPause: onPressedPlayOrPause ?? () {},
            onPressedLikedSong: onPressedLikedSong ?? () {},
          )
        : _Large(data: data, size: size);
  }
}

class _Normal extends StatelessWidget {
  const _Normal(
      {required this.data,
      this.isDense = false,
      required this.onPressedPlayOrPause,
      required this.onPressedLikedSong,
      Key? key})
      : super(key: key);

  final CardMusicData data;
  final bool isDense;
  final Function() onPressedPlayOrPause;
  final Function() onPressedLikedSong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        color: (data.isPlaying) ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              (isDense)
                  ? _combineButtonAndImage()
                  : Row(
                      children: [
                        IconButton(
                          iconSize: 40,
                          icon: Icon((!data.isPlaying)
                              ? Icons.play_arrow_rounded
                              : Icons.pause_rounded),
                          onPressed: () => onPressedPlayOrPause(),
                        ),
                        SizedBox(width: 30),
                        ShadowImage(
                          imageProvider: data.image,
                          size: Size(60, 60),
                          borderRadius: BorderRadius.circular(30),
                          offset: Offset(-5, 5),
                        ),
                      ],
                    ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.subtitle,
                      style: TextStyle(color: Colors.black45),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              SizedBox(width: 20),
              Text(data.duration.formatMS()),
              SizedBox(width: 20),
              IconButton(
                icon: SvgPicture.asset(IconConstant.hearth),
                onPressed: () => onPressedLikedSong(),
                tooltip: "liked song",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _combineButtonAndImage() {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            minRadius: 30,
            backgroundImage: data.image,
          ),
          CircleAvatar(
            minRadius: 30,
            backgroundColor: Colors.white70,
          ),
          IconButton(
            iconSize: 40,
            icon: Icon((!data.isPlaying)
                ? Icons.play_arrow_rounded
                : Icons.pause_rounded),
            onPressed: () => onPressedPlayOrPause(),
          ),
        ],
      ),
    );
  }
}

class _Large extends StatelessWidget {
  const _Large({required this.data, required this.size, Key? key})
      : super(key: key);

  final CardMusicData data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShadowImage(
            imageProvider: data.image,
            size: size,
            borderRadius: BorderRadius.circular(10),
            offset: Offset(-5, 15),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: size.width,
            child: Text(
              data.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: size.width,
            child: Text(
              data.subtitle,
              style: TextStyle(color: Colors.black45),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
