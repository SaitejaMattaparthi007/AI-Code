/**
 * SQ-03  sf:SOQLInjection
 * Numeric comparison built from a String parameter.
 * Expected fix: cast/validate (Decimal.valueOf) and bind. Must NOT apply escapeSingleQuotes.
 */
public with sharing class SoqlInjection_NonString {
    public List<Opportunity> above(String amountParam) {
        Double amountValue = Double.valueOf(amountParam);
        return Database.query('SELECT Id, Name FROM Opportunity WHERE Amount > :amountValue');
    }
}

