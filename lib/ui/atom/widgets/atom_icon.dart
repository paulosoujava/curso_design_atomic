import 'package:flutter/material.dart';

class AtomIcon extends Icon {
  AtomIcon({IconData icon, double size, Color color, String semanticLabel})
      : super(
          icon,
          color: color,
          size: size,
          semanticLabel: semanticLabel,
        );
}
