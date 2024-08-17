/*
Async sempre resolve o retorno como uma Promise e cria um contexto para a utilização de await.
Await, por sua vez, para a execução da função, esperando por algo
*/
// Basic
export const getFruit = async name => {
  const fruits = {
    abacaxi: '🍍',
    pessego: '🍑',
    morango: '🍓'
  };

  return fruits[name];
};

getFruit('pessego').then(console.log);

// Async + Await - Não roda de forma concorrente

export const fazSmoothie = async () => {
  const a = await getFruit('abacaxi');
  const b = await getFruit('morango');

  return [a, b];
};

export const fazSmoothieConcorrente = async () => {
  const a = await getFruit('abacaxi');
  const b = await getFruit('morango');
  const smoothie = Promise.all([a, b]);

  return smoothie
};

const fazSmoothiePromise = () => {
  let a;
  return getFruit('abacaxi')
    .then(v => {
      a = v;
      return getFruit('morango');
    })
    .then(v => [a, v]);
};

console.log(fazSmoothie());
console.log(fazSmoothieConcorrente())
console.log(fazSmoothiePromise());

fazSmoothie().then(console.log)
fazSmoothieConcorrente().then(console.log)
fazSmoothiePromise().then(console.log)
