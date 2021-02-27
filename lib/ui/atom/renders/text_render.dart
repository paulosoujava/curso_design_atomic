import 'package:atomic_design_class/core/enum/behaviors.dart';
import 'package:atomic_design_class/ui/atom/behaviours/text_behaviour.dart';
import 'package:atomic_design_class/ui/atom/widgets/atom_text.dart';
import 'package:flutter/material.dart';

class TextRender extends StatelessWidget with TextBehaviour {
  final String data;
  final Behaviours behaviours;

  TextRender({this.data, this.behaviours})
      : assert(behaviours != null, 'Precisamos do  behaviours'),
        assert(data != null, "Required data");

  @override
  Widget build(BuildContext context) {
    return render(context, behaviours);
  }

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
