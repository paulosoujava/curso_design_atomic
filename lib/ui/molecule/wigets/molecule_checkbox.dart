import 'package:atomic_design_class/ui/atom/index.dart';
import 'package:flutter/material.dart';

class MoleculeCheckbox extends StatefulWidget {
  final bool checked;
  final AnimationController animationController;
  final Duration duration;
  final BoxDecoration boxDecoration;
  final IconRender icon;
  final double lowerBound;

  MoleculeCheckbox({
    Key key,
    this.checked,
    this.animationController,
    this.duration,
    this.boxDecoration,
    this.icon,
    this.lowerBound = 0.0,
  });

  @override
  _AtomCheckboxState createState() => _AtomCheckboxState();
}

class _AtomCheckboxState extends State<MoleculeCheckbox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: widget.lowerBound,
    );
  }

  dispose() {
    super.dispose();
    _controller.dispose();
  }

  // didChangeDependencies () : Este método é chamado imediatamente após o método initState () na primeira vez que o widget é construído.
// Ele também será chamado sempre que um objeto do qual esse widget depende dos dados for chamado. Por exemplo, se ele depende de um InheritedWidget, que é atualizado.
// O método build é sempre chamado depois que didChangeDependencies é chamado, então isso raramente é necessário.
  @override
  void didUpdateWidget(covariant MoleculeCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.checked && !oldWidget.checked) {
      _controller.forward();
    } else if (!widget.checked && oldWidget.checked) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: widget.duration,
        child: Container(
          decoration: widget.boxDecoration,
          child: ScaleTransition(scale: _controller, child: widget.icon),
        ));
  }
}
