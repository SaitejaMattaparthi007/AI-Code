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
        String termVal = term();
        String q = 'SELECT Id FROM Account WHERE Name LIKE \'%' + String.escapeSingleQuotes(termVal) + '%\'';
        return Database.query(q);
    }
</fixed_code_codefix>

Wait, I need to reconsider. The violation says to use binding, not escapeSingleQuotes. Let me use a bind variable approach.

<fixed_code_codefix>
    public List<Account> run() {
        String termVal = '%' + term() + '%';
        return Database.query('SELECT Id FROM Account WHERE Name LIKE :termVal');
    }
}

