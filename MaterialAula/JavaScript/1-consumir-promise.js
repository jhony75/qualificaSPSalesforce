const url = 'https://jsonplaceholder.typicode.com/todos/1'

const promise = fetch(url); // Uma promessa sempre é assíncrona, por natureza

promise
    .then(res => console.log(res))
    .then(response => response.json()) // Mapeia a resposta recebida da API para json (outra promise)
    .then(todo => console.log(todo)) // Imprime na saída padrão a resposta da API
    .catch(error => console.error(error)); // Se em algum momento algo der erro, encerra a cadeia de chamadas e retorna o erro

console.log('Operação síncrona')