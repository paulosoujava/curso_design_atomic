import 'package:atomic_design_class/core/index.dart';
import 'package:atomic_design_class/ui/atom/index.dart';
import 'package:flutter/material.dart';

import '../wigets/molecule_checkbox.dart';

mixin CheckboxBehavior on StatelessWidget {
  static final double size = 24;
  active() {
    return MoleculeCheckbox(
      lowerBound: 0.1,
      boxDecoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      checked: true,
      duration: Duration(milliseconds: 500),
      icon: IconRender(behaviors: Behaviors.SUCCESS),
    );
  }

  inactive() {
    return MoleculeCheckbox(
      lowerBound: 0.1,
      boxDecoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      checked: false,
      duration: Duration(milliseconds: 500),
      icon: IconRender(behaviors: Behaviors.SUCCESS),
    );
  }
}
