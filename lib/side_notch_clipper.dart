import 'package:flutter/material.dart';

class SideNotchClipper extends CustomClipper<Path> {
  double? radius;
  double? width = 20;
  double? height;

  void init({double? r, double? notchWidth, double? notchHeight}) {
    radius = r;
    width = notchWidth;
    height = notchHeight;
  }

  @override
  Path getClip(Size size) {
    double factor = radius ?? 40.0;
    double notchHeight = height ?? ((size.height / 3) + 10);
    double notchWidth = width ?? factor;
    double remain = size.height - notchHeight;
    double topNotchY = 0 + (remain / 2);
    double bottomNotchY = size.height - (remain / 2);
    var path = Path();
    path.lineTo(0, size.height - factor);
    path.quadraticBezierTo(0, size.height, factor, size.height);

    path.lineTo(size.width - factor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - factor);
    path.lineTo(size.width, bottomNotchY + factor);
    path.cubicTo(
        size.width,
        bottomNotchY,
        size.width - notchWidth,
        bottomNotchY,
        size.width - notchWidth,
        bottomNotchY - (bottomNotchY / 10));
    path.lineTo(size.width - notchWidth, size.height);
    path.lineTo(size.width - notchWidth, notchHeight);
    path.cubicTo(size.width - notchWidth, topNotchY, size.width, topNotchY - 5,
        size.width, topNotchY - (topNotchY / 3));
    path.lineTo(size.width, factor);
    path.quadraticBezierTo(size.width, 0, size.width - factor, 0);

    path.lineTo(factor, 0);
    path.quadraticBezierTo(0, 0, 0, factor);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
