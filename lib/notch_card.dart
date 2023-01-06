import 'package:coba/clip_shadow_painter.dart';
import 'package:coba/side_notch_clipper.dart';
import 'package:flutter/material.dart';

class NotchCard extends StatelessWidget {
  final double radius;
  final double width;
  final double height;
  final Color notchColor;
  final Color cardColor;
  final Widget child;

  const NotchCard(
      {super.key,
      this.radius = 40,
      required this.width,
      required this.height,
      this.notchColor = Colors.greenAccent,
      this.cardColor = const Color(0xfff5f4f0),
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height + 6,
          width: width,
          // color: Colors.green,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: const Color(0xffedece8),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xffece3a5),
                    offset: Offset(0, 24),
                    blurRadius: 29, spreadRadius: 6)
              ]),
        ),
        Container(
          height: height,
          width: width,
          // color: Colors.green,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: notchColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.white, offset: Offset(0, -2), blurRadius: 0)
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: CustomPaint(
            painter: ClipShadowPainter(
                shadow: const BoxShadow(
                    offset: Offset(0, 5), blurRadius: 7, color: Colors.black54),
                clipper: SideNotchClipper()),
            child: ClipPath(
              clipper: SideNotchClipper(),
              child: Container(
                height: height,
                width: width,
                color: cardColor,
                child: child,
              ),
            ),
          ),
        )
      ],
    );
  }
}
