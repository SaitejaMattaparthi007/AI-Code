/**
 * SQ-08  sf:SOQLInjection  (negative case)
 * Already escaped. Expected: no issue raised at all.
 */
public with sharing class SoqlInjection_Safe {
    public List<Account> findByName(String nameParam) {
        String safe = String.escapeSingleQuotes(nameParam);
        String q = 'SELECT Id, Name FROM Account WHERE Name = \'' + safe + '\'';
        return Database.query(q);
    }
}
