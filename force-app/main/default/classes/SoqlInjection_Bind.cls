/**
 * SQ-02  sf:SOQLInjection
 * Query shape is fixed, only the value varies.
 * Expected fix: static SOQL with :lastName. No escapeSingleQuotes.
 */
public with sharing class SoqlInjection_Bind {
    public List<Contact> search(String lastName) {
        return [SELECT Id, Email FROM Contact WHERE LastName = :lastName LIMIT 50];
    }
}

