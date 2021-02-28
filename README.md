# Atomic Design 

<img src="https://miro.medium.com/max/2625/1*V5oi-JrH4RlEQuYdVrQXig.png" width="648">
E ai FLUmiguinhos tudo bem com vocês?

Este curso é do meu canal no youtube, chamado evoluindo juntos.
A ideia é apresentar o atomic design criado por Brad Frost. (te explico o que é no final do texto).
Vamos trazer esta ideia para o flutter.
Já iniciamos as aulas e este será o repositório constantemente alterado.
Abordaremos:
## Atomic Design:  Atomos, Molécula, Organismo, Template, Page

## Seguiremos os princípios:
##  Aplicado : YAGNI. KISS. DRY

YAGNI => You Aren't Gonna Need It
É uma orientação qie sigetre, não adicionar funionalidades ap código
até que estas sejam realmente necessárias

KISS => Keep it Simple Stupid
Simplifique o máxim possível reduzindo o tamanho das funções organizando melhor
o códifo até que estás sejam realmente necessário

DRY => Don't repeat yourself
Torne o código menos ambíguo possível além de não repetir trecho de códigos

## Pastas
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

Play list:  
https://www.youtube.com/watch?v=ch3aVv2Vb5U&list=PL0fdn_Fh-H7x5s-VFTTPctQaJK6ie0qOx


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

<img src="https://raw.githubusercontent.com/paulosoujava/DesignAtomic/main/images/fluxo_atomic.png" width="648">


Ah link para os design pattern em dart:
https://github.com/paulosoujava/patterns_in_dart
