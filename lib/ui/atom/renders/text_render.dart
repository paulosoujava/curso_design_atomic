import 'package:flutter/material.dart';

import '../../../core/index.dart';

import '../index.dart';

class TextRender extends StatelessWidget with TextBehaviour, BaseBuilder<Widget, BuildContext, Behaviours> {
  final String data;
  final Behaviours behaviours;

  TextRender({this.data, this.behaviours})
      : assert(behaviours != null, 'Precisamos do  behaviours'),
        assert(data != null, "Required data");

  @override
  Widget build(BuildContext context) {
    return render(context, behaviours);
  }

  @override
  Widget render(BuildContext context, Behaviours behaviours) {
    switch (behaviours) {
      case Behaviours.SUCCESS:
        return AtomText(
          data: data,
          style: success(),
        );
      case Behaviours.INFO:
        return AtomText(
          data: data,
          style: info(),
        );
      case Behaviours.WARNING:
        return AtomText(
          data: data,
          style: warning(),
        );
      case Behaviours.ERROR:
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
