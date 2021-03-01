# Atomic Design 

<img src="https://miro.medium.com/max/2625/1*V5oi-JrH4RlEQuYdVrQXig.png" width="648">


E ai FLUmiguinhos tudo bem com vocês?

Este curso é do meu canal no youtube, chamado evoluindo juntos.
A ideia é apresentar o atomic design criado por Brad Frost. (te explico o que é no final do texto).
Vamos trazer esta ideia para o flutter.
Já iniciamos as aulas e este será o repositório constantemente alterado.
Abordaremos:
 Atomic Design:  Atomos, Molécula, Organismo, Template, Page

 Seguiremos os princípios:
  Aplicado : YAGNI. KISS. DRY
# YAGNI => You Aren't Gonna Need It
É uma orientação que sugere, não adicionar funcionalidades
 ao código até que estas sejam realmente necessárias

# KISS => Keep it Simple Stupid
Simplifique o máximo possível reduzindo o tamanho das funções, 
organizando melhor o código evitando criar coisas desnecessárias

# DRY => Don't repeat yourself
Torne o código menos ambíguo possível além de não repetir trecho de códigos
# Pastas
Definimos até agora as pastas dentro da lib:
Core [ base, enum]
Ui [atom [behaviours], [renders], [ widgets] ]


Nossa  Core temos a pasta base, onde fica o contrato generic :
```
abstract class BaseBuilder<W, B, S> {
  W render(B context, S s);
}
```
Devemos passar um Widget, BuildContext, Behaviour(um enum com os estados)

N



Na pasta enum, adivinha o que temos?? Um enum rss mas não se engane pois ele é quem dita o estilo ou comportamento a se seguir
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

Neste caso qndo formos fazer um  with TextBehaviour, temos que garantir que a classe extende um StatelessWidget 

renders: este sim vai nos renderizar o atomo com seu estado/estilo, usando o mxin acima e também 
temos que trazer nosso método da abstract class BaseBuilder por isso usamos o BaseBuilder<Widget, BuildContext, Behaviours> 
    
```
    class TextRender extends StatelessWidget with TextBehaviour, BaseBuilder<Widget, BuildContext, Behaviours> 

```
  
  widgets: este são somente widgets que usaremos em nosso sistema, são classes que estendem o widget que 
  desejamos e passamos para o super da classe extendida o que desejamos alterar. Mas cuidado pois tem
  widgets MENTIROSOS que na realidade são moléculas
  
```

  class AtomIcon extends Icon

```


<img src="https://raw.githubusercontent.com/paulosoujava/curso_design_atomic/main/asstes/images/core.png" width="648">



# FLUXO

<img src="https://raw.githubusercontent.com/paulosoujava/curso_design_atomic/main/asstes/images/fluxo.png" width="648">


Play list:  
https://www.youtube.com/watch?v=ch3aVv2Vb5U&list=PL0fdn_Fh-H7x5s-VFTTPctQaJK6ie0qOx





# CICLO DE VIDA DE UM WIDGET
createState()
mounted == true
initState()
didChangeDependencies()
build()
didUpdateWidget()
setState()
deactivate()
dispose()
mounted == false

## 1 - createState ()
 Quando o Flutter é instruído a construir um StatefulWidget, ele chama imediatamente createState().
 Este método deve existir. Um StatefulWidget raramente precisa ser mais complicado do que isso.

```
    class MyHomePage extends StatefulWidget {
      @override
      _MyHomePageState createState() => new _MyHomePageState();
    }

```

## 2. montado é verdade
Ao createState criar a classe de estado, um buildContexté atribuído a esse estado.
A BuildContexté, excessivamente simplificado, o local na árvore de widgets em que esse widget é colocado.
Aqui está uma explicação mais longa. Todos os widgets possuem uma bool this.mountedpropriedade. 
Acontece truequando o buildContexté atribuído.  É um erro chamar setStatequando um widget é desmontado. 
 dica: esta propriedade é útil quando um método em seu estado é chamado, setState() 
mas não está claro quando ou com que frequência esse método será chamado. Talvez esteja sendo chamado em resposta a 
uma atualização de fluxo. Você pode usar if (mounted) {... para verificar se o estado existe antes de ligar setState().




## 3. initState ()
Este é o primeiro método chamado quando o widget é criado (após o construtor da classe, é claro).

initStateé chamado uma vez e apenas uma vez . Ele também deve chamar super.initState().

Este @overridemétodo é a melhor hora para:

Inicialize os dados que dependem do BuildContext específico para a instância criada do widget.
Inicialize propriedades que dependem desse widget 'pai' na árvore.
Assine Streams, ChangeNotifiers ou qualquer outro objeto que pode alterar os dados neste widget.

```
  @override
  initState() {
    super.initState();
    // Add listeners to this class
    cartItemStream.listen((data) {
      _updateWidget(data);
    });
  }
```
## 4. didChangeDependencies ()
O método didChangeDependencies é chamado imediatamente após initStatea primeira vez que o widget é construído.
Ele também será chamado sempre que um objeto do qual esse widget depende dos dados for chamado. Por exemplo, 
se ele depende de um InheritedWidget, que é atualizado.
buildé sempre chamado depois de didChangeDependenciesser chamado, então isso raramente é necessário. No entanto, 
esse método é a primeira alteração que você deve chamar BuildContext.inheritFromWidgetOfExactType. 
Isso essencialmente faria com que este estado 'ouvisse' as alterações em um widget do qual está herdando dados.
Os documentos também sugerem que pode ser útil se você precisar fazer chamadas de rede (ou qualquer outra ação cara)
 quando um InheritedWidget é atualizado


## 5. build ()
Este método é chamado frequentemente (pense em fps + render). É obrigatório @overridee deve retornar um Widget.
Lembre-se que no Flutter all gui é um widget com um filho ou filhos, até mesmo 'Padding' , 'Center' 



## 6. didUpdateWidget (Widget oldWidget)
didUpdateWidget()é chamado se o widget pai muda e precisa reconstruir este widget (porque precisa fornecer dados diferentes),
 mas está sendo reconstruído com o mesmo runtimeType, então este método é chamado.
Isso ocorre porque o Flutter está reutilizando o state, que é de longa duração. Nesse caso, é necessário inicializar alguns dados novamente, 
como faria em initState().
Se o build()método do estado depende de um Stream ou outro objeto que pode mudar, cancele a assinatura do objeto antigo e assine novamente a
 nova instância em didUpdateWidget().
dica : Este método é basicamente a substituição de 'initState ()' se for esperado que o Widgetassociado com os statenrrds dos widgets seja reconstruído!
Flutter sempre é chamado build()depois disso, portanto, todas as chamadas subsequentes para setStatesão redundantes.

```
@override
void didUpdateWidget(Widget oldWidget) {
  if (oldWidget.importantProperty != widget.importantProperty) {
    _init();
  }
}
```

## 7. setState ()
O método 'setState ()' é frequentemente chamado a partir da própria estrutura do Flutter e do desenvolvedor.

É usado para notificar a estrutura de que "os dados foram alterados", e o widget build contextdeve ser reconstruído.

setState()recebe um retorno de chamada que não pode ser assíncrono . É por esta razão que pode ser chamado frequentemente

 conforme necessário, porque repintar é barato :-)
```
  void updateProfile(String name) {
  setState(() => this.name = name);
  }
```

## 8. desativar ()
Isso raramente é usado.
'deactivate ()' é chamado quando Stateé removido da árvore, mas pode ser reinserido antes que a alteração do quadro 
atual seja concluída. Esse método existe basicamente porque os Stateobjetos podem ser movidos de um ponto para outro em uma árvore.


## 9. dispor ()
'dispose ()' é chamado quando o Stateobjeto é removido, o que é permanente.
Este método é onde cancelar e cancelar todas as animações, streams, etc.


## 10. montado é falso
O stateobjeto nunca pode remontar e um erro é lançado setState()é chamado.




# Atomic Design

Mas o que é o atomic design?
É uma metodologia que foi desenvolvida por Brand Frost, que cobre tudo que é necessario para criar e manter sistemas de design eficazes.

```

O Atomic Design detalha tudo o que é necessário para criar e manter sistemas de design robustos,
permitindo que sua organização implemente UIs de maior qualidade e consistentes com mais rapidez
do que nunca. Este livro apresenta uma metodologia para pensar em nossas IUs como hierarquias ponderadas,
discute as qualidades de guias de estilo eficazes e apresenta técnicas para transformar
o fluxo de trabalho de design e desenvolvimento de sua equipe.

Fonte:
https://bradfrost.com/

```

Os cinco estágios do Atomic Design são:
 - átomos, 
 - moléculas, 
 - organismos,
- modelos 
- paginas.

<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/atomos.png" width="648">

Os átomos são componentes basicos. ( NÃO complique esta parte ), e devem ser mantidos como basicos
trazendo para o flutter os átomos são WIDGETS:
 EX: Text, Input, Image, Icon 

<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/moleculas.png" width="648">

 Moléculas é a junção de dois ou mais átomos, ou seja, um grupo relativamente simples de elementos da interface que funcionam juntos como uma unidade.
 EX:  Button (button + text), lembra do que falei acima, não complique trazendo o botão para o átomo, até por que um botão SEMPRE terá um,
 icone, texto, algo deste tipo

<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/organismo.png" width="648">

Organismo aqui já entra um pouquinho, mas só um poquinho de complexidade, organismos são componentes de interface relativamente complexos compostos por grupos de moléculas
e/ou  átomos e/ou outros organismos
EX: Um conjunto de inputs -> para virar um formulário de login, registro, profile

<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/template.png" width="648">

Template como o nome diz, é um modelo de como exibir, neste projeto por exemplo eu criei um template para formulários, e chamos meus organismos
de formulários para serem exibidos nele.


<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/page.png" width="648">

chegamos as Páginas, onde os templates seram acionados e a mágica toda acontece.

Fonte:
https://vidadeproduto.com.br/atomic-design/#1_Atomos


# Fluxo by Paulo 
<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/fluxo.png" width="648">

## Fluxo Atomico
Um atom só pode conter ele mesmo e seus estados, exemplo um atom de texto pode ter seus estados tais como TITELE, SUBTITLE, H1 H2, (tamanhos de fontes, tipografia etc..)

Uma Molécula pode conter atomos, e ela mesmo, sim moléculas, você pode aplicar estados também na molécula, expemplo, um botão [Disabilitado, habilitado suas cores, mais
o atom de texto [H1] por exemplo]

Um organismo pode ter um atom, molécula e ele mesmo, !! CUIDADO !! você pode estar criando complexidade desnecessária, vai depender de sua equipe, para colocar ou não 
estados aqui, exemplo, LOADING

Um Template pode conter Atom, Molécula e Organismo, !! NÃO COLOQUE TEMPLATE DENTRO DE TEMPLATE !!
PAGE usam os TEMPLATES E SOMENTE OS TEMPLATES

## IMPORTANTE
Apesar de os Templates poder ter átomos, moléculas e organismos, e até mesmo templates, que dita isso é você,
neste curso, resstringimos as coisas, Page só pode RENDERIZAR templates, templates só podem RENDERIZAR organismos,
organismos, pode conter a si mesmo, moléculas e atoms, moléculas pode ter a sim mesmo e atoms, atomos só atoms, definimos também 
os estados e comportamentos nos Átomos e Moléculas!!

<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/fluxo_atomic.png" width="648">




Ah link para os design pattern em dart:
https://github.com/paulosoujava/patterns_in_dart
