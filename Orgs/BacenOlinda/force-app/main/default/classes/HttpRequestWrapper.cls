public with sharing class HttpRequestWrapper {
    private final Integer ok = 200;
    public void getRes(String endpoint) {
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint(endpoint);
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        if (response.getStatusCode() == ok) {
            Map<String,Object> responseMap = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            
            List<Object> values = (List<Object>) responseMap.get('values');
            
            Map<String, Object> firstValue = (Map<String, Object>) ((List<Object>) values).get(0);

            System.debug(responseMap);
            System.debug(values);
            System.debug(firstValue.get('value'));
            
        }
    }
}