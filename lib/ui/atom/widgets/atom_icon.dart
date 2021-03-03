import 'package:flutter/material.dart';

class AtomIcon extends Icon {
  final Map<String, dynamic> mapper;
  AtomIcon(this.mapper)
      : super(
          mapper['icon'],
          color: mapper['color'],
          size: mapper['size'],
          semanticLabel: mapper['semanticLabel'],
        );
}
