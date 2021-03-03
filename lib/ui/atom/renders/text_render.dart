import 'package:flutter/material.dart';

import '../../../core/index.dart';

import '../index.dart';

class TextRender extends StatelessWidget with TextBehaviour, BaseBuilder<Widget, BuildContext, Behaviors> {
  final String data;
  final Behaviors behaviors;

  TextRender({this.data, this.behaviors})
      : assert(behaviors != null, 'Precisamos do  behaviours'),
        assert(data != null, "Required data");

  @override
  Widget build(BuildContext context) {
    return render(context, behaviors);
  }

  @override
  Widget render(BuildContext context, Behaviors behaviours) {
    switch (behaviours) {
      case Behaviors.SUCCESS:
        return AtomText(
          data: data,
          maxLines: 3,
          style: success(),
        );
      case Behaviors.INFO:
        return AtomText(
          data: data,
          style: info(),
        );
      case Behaviors.WARNING:
        return AtomText(
          data: data,
          style: warning(),
        );
      case Behaviors.ERROR:
        return AtomText(
          data: data,
          style: error(),
        );
      default:
        return AtomText(
          data: data,
          style: regular(),
        );
    }
  }
}
