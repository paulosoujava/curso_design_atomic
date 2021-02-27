import 'package:flutter/material.dart';

class AtomText extends Text {
  AtomText({
    data,
    style,
    textAlign,
    textDirection,
    overflow,
    maxLines,
  }) : super(
          data,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          overflow: overflow,
          maxLines: maxLines,
        );
}
