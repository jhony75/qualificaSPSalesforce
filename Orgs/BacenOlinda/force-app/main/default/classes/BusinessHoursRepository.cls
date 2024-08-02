public with sharing class BusinessHoursRepository extends AbstractRepository{
    public BusinessHours getBusinessHours(String name) {
        return [SELECT Id, Name FROM BusinessHours WHERE Name = :name WITH SECURITY_ENFORCED];
    }
}