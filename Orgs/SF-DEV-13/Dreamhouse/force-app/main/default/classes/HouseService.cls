//public with sharing class HouseService {
    // AuraEnabled - Definição
    // A função pode ser chama pelo frontend para realizar um
    // serviço no backend.
    // cacheable - Definição
    // Se o que retorna desse método pode ser cacheado (guardado em memória)
    // pelo sistema. Isso evita carregamento desncesessário.
//    @AuraEnabled(cacheable=true)
//    public List<House__c> getRecords() { // Busca registros de house__c
//        HouseRepository houseRepository = new HouseRepository();
//        try {
//            return houseRepository.getRecords();
//        } catch (Exception e) {
//            throw new AuraHandledException(e.getMessage());
//        }
//    }
//}

public with sharing class HouseService {
    @AuraEnabled(cacheable=true)
    public static List<House__c> getRecords() {
        try {
            // Create a list of House records from a SOQL query
            List<House__c> lstHouses = [
                SELECT
                   Id,
                   Name,
                   Address__c,
                   State__c,
                   City__c,
                   Zip__c
                   FROM House__c
                   WITH USER_MODE
                   ORDER BY CreatedDate
                   LIMIT 10
                ];
                  return lstHouses;
        }
        // Code to handle exception
        catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
        }
    }
}