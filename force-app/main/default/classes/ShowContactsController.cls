public class ShowContactsController {
	@AuraEnabled
    public static List<Contact> getContacts(String recordId) {
        return [Select Id, Account.Name, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId=:recordId];
    }

}