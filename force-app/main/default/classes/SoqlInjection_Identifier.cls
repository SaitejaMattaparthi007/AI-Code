/**
 * SQ-04  sf:SOQLInjection
 * The tainted value is a FIELD NAME, not a literal. Escaping does not make it safe.
 * Expected: NO fix offered. Remediation is allow-list validation.
 */
public with sharing class SoqlInjection_Identifier {
    public List<SObject> byField() {
        String fieldName = ApexPages.currentPage().getParameters().get('field');
        String value = ApexPages.currentPage().getParameters().get('value');
        Schema.SObjectField f = Schema.SObjectType.Account.fields.getMap().get(fieldName);
                   return Database.query('SELECT Id FROM Account WHERE ' + f + ' = :value');
    }
}

