import 'package:flutter/material.dart';

// este mixin só pode ser usado a classe que estendem StatelessWidget por q?
// precisamos do method build para renderizar e isto vai nos garantir o build
//assim “bloqueamos” o uso do mixin para uma classe e
// todas as classes que dele herdaram
mixin IconBehaviour on StatelessWidget {
  static final double size = 24;
  Map<String, dynamic> success({String accessibility}) {
    return {
      'icon': Icons.check,
      'color': Colors.green,
      'size': size,
      'semanticLabel': accessibility ?? '',
    };
  }

  Map<String, dynamic> error() {
    return {
      'icon': Icons.error,
      'color': Colors.red,
      'size': size,
      'semanticLabel': 'Text to announce in accessibility modes',
    };
  }

  Map<String, dynamic> warning() {
    return {
      'icon': Icons.warning,
      'color': Colors.amberAccent,
      'size': size,
      'semanticLabel': 'Text to announce in accessibility modes',
    };
  }

  Map<String, dynamic> info() {
    return {
      'icon': Icons.info,
      'color': Colors.blueAccent,
      'size': size,
      'semanticLabel': 'Text to announce in accessibility modes',
    };
  }
}
