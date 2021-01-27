@RestResource(urlMapping='/case/*/close')
global class CaseCloseResource {
	@HttpPost
    global static void closeCase (String reason) {
        RestRequest req = RestContext.request;
        List<String> uriParts = req.requestURI.split('/');
        Id caseId = uriParts[2];
        Set<Id> setOfId = new Set<Id>();
        setOfId.add(caseId);
        CaseService.closeCases(setOfId, reason);
    }
}