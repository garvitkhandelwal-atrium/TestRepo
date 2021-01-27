public with sharing class TestClass {
    public TestClass() {
        List<Account> accList = [Select id, name FROM Account LIMIT 5];
        system.debug(Account.name);
    }
}