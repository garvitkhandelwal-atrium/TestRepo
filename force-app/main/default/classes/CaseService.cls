global with sharing class CaseService {
    global static void closeCases(Set<Id> Ids, String reason) {
        //validating parameters
        if(Ids.size() == 0 || Ids == NULL)
            throw new CaseServiceException('Cases not specified correctly!');
        if(reason == '')
            throw new CaseServiceException('Please enter a valid reason!');
        List<Case> cases = [SELECT Id, Reason, Status FROM Case WHERE Id in :Ids];
        List<Case> casesToUpdate = new List<Case>();
        //setting for updation
        for(Case c : cases) {
			c.Status = 'Closed';
            c.Reason = reason;
            casesToUpdate.add(c);
        }
        SavePoint sp = Database.setSavepoint();
        try {
            update casesToUpdate;
        }
        catch(Exception e) {
            Database.rollback(sp);
            throw e;
        }
    }
    global class CaseServiceException extends Exception {}
}