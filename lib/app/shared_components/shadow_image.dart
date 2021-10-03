import 'dart:ui';

import 'package:flutter/material.dart';

class ShadowImage extends StatelessWidget {
  const ShadowImage(
      {required this.imageProvider,
      this.size = const Size(100, 100),
      this.offset = const Offset(-5, 10),
      this.borderRadius = BorderRadius.zero,
      this.shadowOpacity = .2,
      this.elevation = 3,
      key})
      : super(key: key);

  final ImageProvider imageProvider;
  final Size size;
  final Offset offset;
  final BorderRadius borderRadius;
  final double elevation;
  final double shadowOpacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: offset,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Opacity(
                  opacity: shadowOpacity,
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: borderRadius,
                  child: BackdropFilter(
                    filter:
                        ImageFilter.blur(sigmaX: elevation, sigmaY: elevation),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          borderRadius: borderRadius),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height,
          width: size.width,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
