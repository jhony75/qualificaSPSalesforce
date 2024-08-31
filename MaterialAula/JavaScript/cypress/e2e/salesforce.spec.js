describe('Salesforce Login and Search Account', () => {
    it('deve logar na org do Salesforce e procurar uma conta específica', () => {
        // Visita a página de login do Salesforce
        cy.visit('https://login.salesforce.com');

        // Insere o nome de usuário
        cy.get('#username').type(Cypress.env('SF_USERNAME'));

        // Insere a senha
        cy.get('#password').type(Cypress.env('SF_PASSWORD'), { log: false });

        // Clica no botão de login
        cy.get('#Login').click();

        // Aguarda a página inicial carregar
        cy.url().should('include', '/home');

        // Clica na aba de Contas (adaptar o seletor conforme o layout da org)
        cy.get('a[title="Contas"]').click();

        // Espera a página de Contas carregar
        cy.url().should('include', '/lightning/o/Account/list');

        // Pesquisa a conta específica
        cy.get('input[placeholder="Pesquisar..."]').type('Burlington Textiles of America{enter}');

        // Verifica se a conta aparece nos resultados
        cy.contains('Burlington Textiles of America').should('be.visible');
    });
});
