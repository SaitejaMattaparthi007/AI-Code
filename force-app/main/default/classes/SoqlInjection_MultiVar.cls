/**
 * SQ-06  sf:SOQLInjection
 * Two tainted values in one query.
 * Expected fix: both remediated in a single patch; re-scan clean.
 */
public with sharing class SoqlInjection_MultiVar {
    public List<Lead> find() {
        Map<String, String> p = ApexPages.currentPage().getParameters();
        String company = p.get('company');
        String status = p.get('status');
        String q = 'SELECT Id FROM Lead WHERE Company = \'' + company +
                   '\' AND Status = \'' + status + '\'';
        return Database.query(q);
    }
}
