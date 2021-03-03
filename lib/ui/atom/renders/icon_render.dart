import 'package:flutter/material.dart';

import '../../../core/index.dart';

import '../index.dart';

class IconRender extends StatelessWidget with IconBehaviour, BaseBuilder<Widget, BuildContext, Behaviors> {
  final String data;
  final Behaviors behaviors;

  IconRender({this.data, this.behaviors}) : assert(behaviors != null, 'Precisamos do  behaviours');

  @override
  Widget build(BuildContext context) {
    return render(context, behaviors);
  }

  @override
  Widget render(BuildContext context, Behaviors behaviours) {
    switch (behaviours) {
      case Behaviors.SUCCESS:
        return AtomIcon(success());
      case Behaviors.ERROR:
        return AtomIcon(error());
      case Behaviors.INFO:
        return AtomIcon(info());
      case Behaviors.WARNING:
        return AtomIcon(warning());
      default:
        return AtomIcon(
          success(),
        );
    }
  }
}
