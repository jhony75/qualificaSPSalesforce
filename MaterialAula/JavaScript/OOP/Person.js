// Baseado no vídeo https://youtube.com/shorts/xI0yBzTsqsI?si=HS8wQ1lUinfhvOkj

/*
Classes são uma adição do ES6, que apenas são syntax sugar para criar um novo objeto
baseado em um protótipo.
O construtor, que cria o "objeto" é uma função, que torna a "classe" em uma função.

Dentro do JS, tudo é um objeto que herda de um "protótipo", que é o objeto mais alto na hierarquia.
*/

class Person {
    constructor(name) {
        this.name = name;
    }

    logName() {
        console.log(this.name);
    }
}

console.log(typeof Person);