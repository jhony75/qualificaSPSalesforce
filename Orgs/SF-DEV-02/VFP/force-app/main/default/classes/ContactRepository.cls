public with sharing class ContactRepository {

    public Contact newContact(String firstName, String lastName) {
        Contact contact = new Contact(
                FirstName = firstName, 
                LastName = lastName
            );
        Database.insert(contact, true, AccessLevel.USER_MODE);
        return contact;
    }

    public Contact newContactWithAccount(String firstName, String lastName, ID accountId) {
        Contact contact = new Contact(
                FirstName = firstName, 
                LastName = lastName,
                AccountId = accountId
        );
        Database.insert(contact, true, AccessLevel.USER_MODE);
        return contact;
    }
}