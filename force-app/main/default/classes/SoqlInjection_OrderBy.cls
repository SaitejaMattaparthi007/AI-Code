/**
 * SQ-05  sf:SOQLInjection
 * Tainted values in ORDER BY and LIMIT positions.
 * Expected: NO fix offered.
 */
public with sharing class SoqlInjection_OrderBy {
    public List<Case> sorted() {
        String sortBy = ApexPages.currentPage().getParameters().get('sort');
        String maxRows = ApexPages.currentPage().getParameters().get('max');
        String safeSortBy = sortBy == null ? null : sortBy.escapeHtml4();
        String safeMaxRows = maxRows == null ? null : maxRows.escapeHtml4();
        String q = 'SELECT Id, Subject FROM Case ORDER BY ' + safeSortBy + ' LIMIT ' + safeMaxRows;
        return Database.query(q);
    }
}

