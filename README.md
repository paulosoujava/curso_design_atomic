# atomic_design_class

E ai FLUmiguinhos tudo bem com vocês?

Este curso é do meu canal no youtube, chamado evoluindo juntos.
A idieia é apresentar o atomic design criado por Brad Frost.
Vamor trazer esta ideia para o flutter.
Já iniciamos as aulas e este será o repositório constantemente alterado.
Abarodaremos:
Atomic Design:  Atomos, Molécula, Organismo, Template, Page

Definimos até agora as pastas dentro da lib:
Core [ base, behavioursmenum]
Ui [atom [behaviours], [renders], [ widgets] ]


Nossa  Core temos a pasta base, onde fica o contrato generic :
```
abstract class Base<W, B, S> {
  W render(B context, S s);
}
```
Devemos passar um Widget, BuildContext, Behaviour(um enum com os estados)

Na pasta behaviours temos uma classe concreta que implementa o nosso contrato, nela definimos
os métodos que DEVEM ser sobrescritos e o método render onde renderiza nosso atomo, com seu estilo/estado

```
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

```



Na pasta enum, adivinha o que temos?? Um enum rss
```
enum Behaviours {
  REGULAR,
  LAODING,
  ERROR,
  SUCCESS,
  INFO,
  WARNING,
  DISABLED,
}

mixin BehavioursEnum {
  Behaviours get bRegular => Behaviours.REGULAR;
  get bLoading => Behaviours.LAODING;
  get bError => Behaviours.ERROR;
  get bSuccess => Behaviours.SUCCESS;
  get bInfo => Behaviours.INFO;
  get bDisabled => Behaviours.DISABLED;
}

```

Pronto o core foi definido basta usa-lo.

Ui:
    Na pasta atom temos as pastas:
    behaviours: Aqui estão nossos estilos, um grande mixin que usa o 'on' para nos dizer que precimos usa-lo em uma classe que implente 
    q que vem após o 'on':
    

```

     mixin TextBehaviour on StatelessWidget 

```

    Neste caso qndo formos fazerr um  with TextBehaviour, temos que garantir que a classe extende um StatelessWidget

    renders: este sim vai nos renderizar o atomo com seu estado/estilo, usando o mxin acima
    
```
    class TextRender extends StatelessWidget with TextBehaviour 

```
  
  widgets: este são somente widgets que usaremos em nosso sistema, são classes que estendem o widget que 
  desejamos e passamos para o super da classe extendida o que desejamos alterar.
  
```

  class AtomIcon extends Icon

```

Play list:  
https://www.youtube.com/watch?v=ch3aVv2Vb5U&list=PL0fdn_Fh-H7x5s-VFTTPctQaJK6ie0qOx


Links:
https://drive.google.com/file/d/1NiIGzTaGkwVaYBStwweWI1P4XPEYVlrw/view?usp=sharing
