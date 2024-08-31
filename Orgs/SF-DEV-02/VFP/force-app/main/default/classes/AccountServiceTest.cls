@IsTest
private class AccountServiceTest {
  @IsTest
  static void should_create_account() {
    String acctName = 'Salesforce';
    String acctNumber = 'SFDC';
    String tickerSymbol = 'CRM';
    Test.startTest();
      AccountService service = new AccountService();
      Account newAcct = service.createAccount( acctName, acctNumber, tickerSymbol );
      insert newAcct;
    Test.stopTest();
    List<Account> accts = [ SELECT Id, Name, AccountNumber, TickerSymbol FROM Account WHERE Id = :newAcct.Id ];
    Assert.areEqual( 1, accts.size(), 'should have found new account' );
    Assert.areEqual( acctName, accts[0].Name, 'incorrect name' );
    Assert.areEqual( acctNumber, accts[0].AccountNumber, 'incorrect account number' );
    Assert.areEqual( tickerSymbol, accts[0].TickerSymbol, 'incorrect ticker symbol' );
  }
}