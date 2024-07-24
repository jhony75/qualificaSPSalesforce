# Javascript

## Conceitos Básicos

- É uma linguagem interpretada
- Single threaded
- Utiliza o "Event Loop" para definir o que deve estar na "queue" ou na stack
  - A stack executa o que veio da queue (fila passa para pilha)
- Existem diversas "engines" que rodam js, como V8 (Chromium) e Gecko (Mozilla)
- O Js é atualizado utilizando como base a padronização do ECMAScript
- A adoção de APIs não é universal. Um navegador pode ter mais que outro

## Caracteristicas importantes

Js é uma linguagem "Case sensitive" (A != a)

Para declarar váriaveis, utilizamos o seguinte:

| Keyword | Escopo | Mutável? |
|---------|--------|----------|
| var     | função | Sim      |
| let     | bloco  | Sim      |
| const   | bloco  | Sim      |

Isso posto, o "const" apenas impede a alteração do objeto que está sendo trabalhado, não do seu valor

A coerção de tipos é implicita e pode ser confusa, exemplo:

```javasript
let num1 = 9 * "3" => 27 -> Número
let num2 = 9 + "3" => 93 -> String
```

Não é recomendado utilizar essa coerção por conta de comportamentos estranhos da linguagem, como:

```javascript
false == ""; // true
false == "0"; // true
"" == "0"; // false
[0] == 0; // true

false === ""; // false
false === "0"; // false
"" === "0"; // false
[0] === 0; // false
```

Para fazer comparações booleanas então, é recomendado utilizar os operadores === e !==.

Truphy e Falsy são caracteristicas dadas a valores para que possamos utilizar a coerção e consequentemente fazer operações booleanas, sendo eles:

false -> false
0 -> false
"" ou '' -> false
null -> false
undefined -> false
NaN -> false
todo o resto -> true

## Document Object Model - DOM

A DOM é uma representação em árvore de tudo que é contido na janela do navegador. Em muitas situações é utilizada uma Shadow DOM, para modularizar e/ou encapsular partes da UI e as proteger de mudanças.

## LWC

O LWC utiliza uma Shadow DOM e se comunica com a DOM para permitir a utilização dos mais diversos valores. Uma vez que ela permite a manipulação da DOM no entanto, havendo necessidade, embora desaconselhavel, é possível.

Utilizando as tags de template: `lwc:if`, `lwc:elseif` e `lwc:else` podemos fazer a renderização condicional de algo na tela.

## Escopo e "Elevação de Variável"

No JavaScript existe um comportamento chamado "variable hoisting" ou "elevação de variável".

Esse comportamento nada mais é do que o interpretador de código movendo a declaração de uma variável para o topo de seu escopo (função ou bloco de código).

Embora a variável possa ser declarada "préviamente" por conta desse comportamento, apenas variáveis do tipo "var" são movidas e inicializadas. Variáveis de "let" e "const" não apresentam esse comportamento.

Funçoes, no entanto são completamente elevadas e podem ser chamadas a qualquer momento (quase uma herança de C) no entanto, expressões de função não são elevadas. A declaração da variável é elevada, no entanto não a atribuição da mesma. A expressão, nada mais é do que uma função sendo atribuída a uma variável.

Em resumo, temos que:

- Declarações de variáveis: Movidas ao topo, mas a inicialização permanece no local.
- var: Inicializada como undefined até ser definida.
- let e const: Não inicializadas até a linha de definição, resultando em ReferenceError se acessadas antes.
- Declarações de função: Completamente elevadas, incluindo o corpo da função.
- Expressões de função: Apenas a declaração da variável é elevada, não a atribuição da função.

## This

O this, no contexto de JS é definido não na declaração de uma função, mas sim na sua invocação, por exemplo:

```javascript
var obj = {
  aValue: 0,
  increment: function(incrementBy) {
    this.aValue = this.aValue + incrementBy;
  }
}

// Se acessarmos a função "increment", elá terá o comportamento esperado.
obj.increment(2);
console.log(obj.aValue); // 2

// Porém, caso façamos a atribuição dessa função para outra variável, não será assim
// Nova atribuição
var newIncrement = obj.increment;
// Nova chamada
newIncrement(2);
console.log(obj.aValue); // Ainda 2 não 4

// Podemos dizer então que essa função roda em contexto global.
```

Podemos utilizar `Function.apply()`,`Function.call()`,`Function.bind()` para invocar uma função enquanto explicitamente vinculando a um contexto de objeto diferente.

## Referências

[Event Loop](https://www.youtube.com/watch?v=8aGhZQkoFbQ)
[Código fonte - Surf](https://surf.suckless.org/)
[Código fonte - Chromium](https://github.com/chromium/chromium)
[Código fonte - Firefox](https://searchfox.org/mozilla-central/source)
