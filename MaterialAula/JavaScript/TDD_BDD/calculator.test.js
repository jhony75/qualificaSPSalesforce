const Calculator = require('./calculator');

describe('Calculator', () => {
    let calculator;

    beforeEach(() => {
        calculator = new Calculator();
    });

    test('deve somar dois números corretamente', () => {
        expect(calculator.add(5, 3)).toBe(8);
    });

    test('deve subtrair o segundo número do primeiro corretamente', () => {
        expect(calculator.subtract(9, 4)).toBe(5);
    });

    test('deve multiplicar dois números corretamente', () => {
        expect(calculator.multiply(3, 7)).toBe(21);
    });

    test('deve dividir o primeiro número pelo segundo corretamente', () => {
        expect(calculator.divide(10, 2)).toBe(5);
    });

    test('deve lançar erro ao tentar dividir por zero', () => {
        expect(() => calculator.divide(10, 0)).toThrow('Divisão por zero não é permitida.');
    });

    test('deve calcular a potência de um número corretamente', () => {
        expect(calculator.power(2, 3)).toBe(8);
    });

    test('deve calcular a raiz quadrada de um número corretamente', () => {
        expect(calculator.sqrt(16)).toBe(4);
    });

    test('deve lançar erro ao tentar calcular a raiz quadrada de um número negativo', () => {
        expect(() => calculator.sqrt(-4)).toThrow('Raiz quadrada de número negativo não é permitida.');
    });
});
