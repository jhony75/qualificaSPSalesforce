public with sharing class HouseRepository {
    public List<House__c> getRecords() {
            // List<House__c> lstHouses = [] - Má prática, tipo da variavel no nome
            List<House__c> houses = [
                SELECT Id,
                       Name,
                       Address__c,
                       State__c,
                       City__c,
                       Zip__c
                FROM House__c
                WITH USER_MODE // É para usar o modo do usuário que disparou a chamada, respeitando suas permissões
                ORDER BY CreatedDate // Ordena a listagem de resultados por data de criação do registro
                LIMIT 10 // Limita o número de registros retornados pela query
            ];
            return houses;
    }
}