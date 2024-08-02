public with sharing class CurrencyTypeRepository extends AbstractRepository{
    public CurrencyType getCurrencyTypeByIsoCode(String isoCode) {
        return [SELECT ConversionRate, IsoCode, IsActive FROM CurrencyType WHERE IsoCode = :isoCode WITH SECURITY_ENFORCED];
    }
}