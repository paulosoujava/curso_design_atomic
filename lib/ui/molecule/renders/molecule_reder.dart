import 'package:atomic_design_class/core/index.dart';
import 'package:atomic_design_class/ui/molecule/behaviors/checkbox_behavior.dart';
import 'package:flutter/material.dart';

class CheckboxRender extends StatelessWidget with CheckboxBehavior, BaseBuilder<Widget, BuildContext, Behaviors> {
  final Behaviors behaviours;

  const CheckboxRender({Key key, this.behaviours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviours);
  }

  @override
  Widget render(BuildContext context, Behaviors behaviors) {
    switch (behaviours) {
      case Behaviors.ACTIVE:
        return active();
      case Behaviors.INACTIVE:
        return inactive();
      default:
        return inactive();
    }
  }
}
