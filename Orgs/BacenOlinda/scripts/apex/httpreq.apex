HttpRequestWrapper wrapper = new HttpRequestWrapper();

// String bacenOlinda = 'https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoMoedaDia(moeda=\'EUR\',dataCotacao=\'07-26-2024\')?$format=json';

String moeda = 'EUR';
String dataCotacao = '07-26-2024';

// String endpoint = 'https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoMoedaDia(moeda=\'' + moeda + '\',dataCotacao=\'' + dataCotacao + '\')?$format=json';

String endpoint =
      'https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarDia(dataCotacao=@dataCotacao)?@dataCotacao=\'' +
      dataCotacao +
      '\'&$top=1&$format=json';

System.debug('#### endpoint: ' + endpoint);

wrapper.getRes(endpoint);