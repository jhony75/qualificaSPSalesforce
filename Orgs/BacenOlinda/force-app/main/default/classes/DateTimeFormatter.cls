public with sharing class DateTimeFormatter {
    public String formatBacenDateTime() {

        DateTime now = DateTime.now();
        BusinessHoursRepository businessHoursRepository = new BusinessHoursRepository();
        BusinessHours bacenHours = businessHoursRepository.getBusinessHours('bacen');
        Boolean isBusinessHours = BusinessHours.isWithin(bacenHours.Id, now);
        String formatedNow = now.format('E');

        if(!isBusinessHours) {
            now = now.addDays(-1);
        }

        if(formatedNow == 'Sat'){
            now = now.addDays(-1);
        }

        if(formatedNow == 'Sun'){
            now = now.addDays(-2);
        }

        String validDate = now.format('MM-dd-yyyy');
        return validDate;
    }
}