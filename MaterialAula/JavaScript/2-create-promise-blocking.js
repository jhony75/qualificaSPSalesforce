const tick = Date.now();
const log = (v) => console.log(`${v} \n Passou: ${Date.now() - tick}ms`);

const codeBlocker = () => {

    // Blocking - congela a aplicação pela duração do loop
    let i = 0;
    while(i < 1000000000) { i++;}

    return 'Loop rodou 1 bilhão de vezes';

}

const asyncCodeBlocker = () => {

    // Async blocking - Executa com macro e micro tarefa
    return new Promise((resolve, reject) => {

        let i = 0;
        while(i < 1000000000) { i++;}

        resolve('Loop rodou 1 bilhão de vezes');
    })
}

const promiseCodeBlocker = () => {

    // Non-blocking - Executa ao fim da tarefa macro
    return Promise.resolve().then(v =>  {
        let i = 0;
        while(i < 1000000000) { i++; }
        return 'Loop rodou um bilhão de vezes';
    })

}

// Blocker
log('Blocker');
log('Sync 1');
log(codeBlocker());
log('Sync 2');

log('\n----------\n');

// Async
log('Async');
log('Sync 1');
asyncCodeBlocker().then(log);
log('Sync 2');

log('\n----------\n');

// Promise
log('Promise')
log('Sync 1');
promiseCodeBlocker().then(log)
log('Sync 2');