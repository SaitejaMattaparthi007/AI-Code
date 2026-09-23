/**
 * SQ-01  sf:SOQLInjection
 * Page parameter concatenated into a dynamic query.
 * Expected fix: wrap nameParam in String.escapeSingleQuotes(), or convert to a bind variable.
 */
public with sharing class SoqlInjection_Basic {
    public List<Account> findByName() {
        String nameParam = ApexPages.currentPage().getParameters().get('name');
        String q = 'SELECT Id, Name FROM Account WHERE Name = \'' + nameParam + '\'';
        return Database.query(q);
    }
}
