import 'package:atomic_design_class/core/base/base.dart';
import 'package:atomic_design_class/core/enum/behaviors.dart';

import 'package:flutter/material.dart';

class BehavioursStates implements Base<Widget, BuildContext, Behaviours> {
  Widget whenRegular(BuildContext context, Behaviours behaviours) {
    debugPrint('$this does not implements behaviours.REGULAR');
    return whenRegular(context, behaviours);
  }

  Widget whenSuccess(BuildContext context, Behaviours behaviours) {
    debugPrint('$this does not implements behaviours.SUCCESS');
    return whenSuccess(context, behaviours);
  }

  Widget whenInfo(BuildContext context, Behaviours behaviours) {
    debugPrint('$this does not implements behaviours.INFO');
    return whenInfo(context, behaviours);
  }

  Widget whenWarning(BuildContext context, Behaviours behaviours) {
    debugPrint('$this does not implements behaviours.WARNING');
    return whenWarning(context, behaviours);
  }

  Widget whenError(BuildContext context, Behaviours behaviours) {
    debugPrint('$this does not implements behaviours.ERROR');
    return whenError(context, behaviours);
  }

  Widget render(BuildContext context, Behaviours behaviours) {
    switch (behaviours) {
      case Behaviours.REGULAR:
        return whenRegular(context, behaviours);
      case Behaviours.INFO:
        return whenInfo(context, behaviours);
      case Behaviours.WARNING:
        return whenWarning(context, behaviours);
      case Behaviours.SUCCESS:
        return whenSuccess(context, behaviours);
      case Behaviours.ERROR:
        return whenError(context, behaviours);
      default:
        return whenRegular(context, behaviours);
    }
  }
}
