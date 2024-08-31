/**
 * Classe Calculator - Implementa operações matemáticas básicas.
 */
class Calculator {
    /**
     * Soma dois números.
     * @param {number} a - Primeiro número.
     * @param {number} b - Segundo número.
     * @returns {number} - Resultado da soma.
     */
    add(a, b) {
        return a + b;
    }

    /**
     * Subtrai o segundo número do primeiro.
     * @param {number} a - Primeiro número.
     * @param {number} b - Segundo número.
     * @returns {number} - Resultado da subtração.
     */
    subtract(a, b) {
        return a - b;
    }

    /**
     * Multiplica dois números.
     * @param {number} a - Primeiro número.
     * @param {number} b - Segundo número.
     * @returns {number} - Resultado da multiplicação.
     */
    multiply(a, b) {
        return a * b;
    }

    /**
     * Divide o primeiro número pelo segundo.
     * @param {number} a - Primeiro número.
     * @param {number} b - Segundo número.
     * @returns {number} - Resultado da divisão.
     * @throws {Error} - Lança um erro se a divisão for por zero.
     */
    divide(a, b) {
        if (b === 0) {
            throw new Error("Divisão por zero não é permitida.");
        }
        return a / b;
    }

    /**
     * Eleva o primeiro número à potência do segundo número.
     * @param {number} base - Número base.
     * @param {number} exponent - Expoente.
     * @returns {number} - Resultado da exponenciação.
     */
    power(base, exponent) {
        return Math.pow(base, exponent);
    }

    /**
     * Calcula a raiz quadrada de um número.
     * @param {number} number - Número para o qual calcular a raiz quadrada.
     * @returns {number} - Resultado da radiciação.
     * @throws {Error} - Lança um erro se o número for negativo.
     */
    sqrt(number) {
        if (number < 0) {
            throw new Error("Raiz quadrada de número negativo não é permitida.");
        }
        return Math.sqrt(number);
    }
}

module.exports = Calculator;
