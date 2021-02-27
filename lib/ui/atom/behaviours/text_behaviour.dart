import 'package:flutter/material.dart';

// este mixin só pode ser usado a classe que estendem StatelessWidget por q?
// precisamos do method build para renderizar e isto vai nos garantir o build

mixin TextBehaviour on StatelessWidget {
  static final double fontSize = 18;

  TextStyle regular() {
    return TextStyle(
      color: Colors.black,
      fontSize: fontSize,
    );
  }

  TextStyle error() {
    return TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  TextStyle success() {
    return TextStyle(
      color: Colors.green,
      fontSize: fontSize,
    );
  }

  TextStyle warning() {
    return TextStyle(
      color: Colors.amberAccent,
      fontSize: fontSize,
    );
  }

  TextStyle info() {
    return TextStyle(
      color: Colors.blue,
      fontSize: fontSize,
    );
  }
}
