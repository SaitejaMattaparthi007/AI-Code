/**
 * SQ-07  sf:SOQLInjection  (snippet-level boundary probe)
 * The taint source lives in a different method from the query.
 * Expected: a correct fix, or no fix. Never a fix that escapes the wrong expression.
 */
public with sharing class SoqlInjection_CrossMethod {
    private String term() {
        return ApexPages.currentPage().getParameters().get('term');
    }

    public List<Account> run() {
        String q = 'SELECT Id FROM Account WHERE Name LIKE \'%' + term() + '%\'';
        return Database.query(q);
    }
}
