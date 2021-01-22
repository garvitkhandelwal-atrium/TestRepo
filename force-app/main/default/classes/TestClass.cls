public with sharing class TestClass {
    public static void TestClass() {
        List<Account> accList = [Select id, name FROM Account LIMIT 5];
        system.debug(Account.name);
    }
}
