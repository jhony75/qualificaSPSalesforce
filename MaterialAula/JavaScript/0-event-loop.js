/* Programação assincrona é necessária visto que a maior parte das interações na web são "blocking"
o que quer dizer que são ações que impedem que o programa siga seu fluxo sem que algo aconteça.

Event Loop
O js e o browser rodam usando apenas uma thread. Usando async, podemos separar as atividades,
de forma que o sistema utilize mais ou melhor organize o loop
*/

// Exemplo 1

console.log('Sinc 1'); // Primeira linha a rodar
setTimeout(_ => console.log('Timeout 2'), 0); // Última linha a rodar, por prioridade da Promise
Promise.resolve().then(_ => console.log('Promise')) // Terceira linha a rodar, porque ela "resolve" quando a operação assíncrona termina
console.log('Sinc 4'); // Segunda linha a rodar, porque as duas anterirores estão na fila