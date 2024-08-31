@isTest
private class ContactRepositoryTest {

    @TestSetup
    static void makeData(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
    }


    @isTest
    public static void newContact() {
            // Instantiate the ContactRepository
            ContactRepository contactRepository = new ContactRepository();

            // Call the newContact method
            Test.startTest();
            Contact newContact = contactRepository.newContact('Test', 'Contact');
            Test.stopTest();

            // Verify the new Contact was inserted
            List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :newContact.Id];
            System.assertEquals(1, contacts.size(), 'Size should be 1');
    }

    @isTest
    public static void newContactWithAccount(){
       Account acc = [SELECT Id FROM Account LIMIT 1];
       Id accId = acc.Id;
        // Instantiate the ContactRepository
       ContactRepository contactRepository = new ContactRepository();

       // Call the newContact method
       Test.startTest();
       Contact newContact = contactRepository.newContactWithAccount('Test', 'Contact', accId);
       Test.stopTest();

       // Verify the new Contact was inserted
       List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :newContact.Id];
       System.assertEquals(1, contacts.size(), 'Size should be 1');
       System.assert(contacts[0].Id != null, 'Id should not be null');
    }
}