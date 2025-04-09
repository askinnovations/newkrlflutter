import 'package:flutter/material.dart';
import 'package:krl/utils/colors.dart';

class HeaderCurved extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.btntheamColor;
    Path path = Path()
      ..relativeLineTo(0, 15)
      ..quadraticBezierTo(size.width / 2, 170.0, size.width, 15)
      ..relativeLineTo(0, -50)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
