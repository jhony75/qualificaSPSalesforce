public with sharing class CurrencyTypeRepository extends AbstractRepository{
    public CurrencyType getCurrencyTypeByIsoCode(String isoCode) {
        return [SELECT ConversionRate, IsoCode, IsActive FROM CurrencyType WHERE IsoCode = :isoCode WITH SECURITY_ENFORCED];
    }

    public CurrencyType save(Currency conversionRate, String isoCode, Boolean isActive) {
        CurrencyType currency = new CurrencyType(
            conversionRate = conversionRate,
            IsoCode = isoCode,
            IsActive = isActive
        );
    }
}