import 'package:flutter/material.dart';
import 'dart:math' as math;

class FilledMiddleStar extends StatelessWidget {
  final int fillPercentage; // Pourcentage de remplissage de l'étoile

  const FilledMiddleStar({super.key, required this.fillPercentage});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100), // Ajuster la taille au besoin
      painter: StarPainter(fillPercentage: fillPercentage),
    );
  }
}

class StarPainter extends CustomPainter {
  final int fillPercentage;

  StarPainter({required this.fillPercentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow // Changer la couleur au besoin
      ..style = PaintingStyle.fill;

    Path path = Path();
    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double angle = math.pi / 5; // Angle entre les points de l'étoile

    path.moveTo(centerX, centerY - radius);
    for (int i = 1; i <= 5; i++) {
      double x = centerX + radius * math.sin(i * 2 * angle);
      double y = centerY - radius * math.cos(i * 2 * angle);
      path.lineTo(x, y);

      x = centerX + (radius / 2) * math.sin((i * 2 * angle) + angle);
      y = centerY - (radius / 2) * math.cos((i * 2 * angle) + angle);
      path.lineTo(x, y);
    }

    path.close();

    // Calcul du chemin pour le remplissage partiel en fonction du pourcentage
    double fillRadians = (fillPercentage / 100) * (2 * math.pi);
    Path clippedPath = Path();
    clippedPath.moveTo(centerX, centerY - radius);
    for (int i = 1; i <= 5; i++) {
      double x = centerX + radius * math.sin(i * 2 * angle);
      double y = centerY - radius * math.cos(i * 2 * angle);
      clippedPath.lineTo(x, y);

      if ((i * 2 * angle) < fillRadians) {
        x = centerX + (radius / 2) * math.sin((i * 2 * angle) + angle);
        y = centerY - (radius / 2) * math.cos((i * 2 * angle) + angle);
        clippedPath.lineTo(x, y);
      } else {
        double partialFillRadians = fillRadians - ((i - 1) * 2 * angle);
        double partialX = centerX +
            (radius / 2) *
                math.sin((i * 2 * angle) - (angle - partialFillRadians));
        double partialY = centerY -
            (radius / 2) *
                math.cos((i * 2 * angle) - (angle - partialFillRadians));
        clippedPath.lineTo(partialX, partialY);
        break;
      }
    }

    clippedPath.close();
    canvas.drawPath(clippedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
