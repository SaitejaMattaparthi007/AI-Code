/**
 * Supporting controller for the sf:UnescapedSource pages.
 */
public with sharing class SearchController {
    public String searchTerm {
        get {
        String rawSearchTerm = ApexPages.currentPage().getParameters().get('q');
        String safeSearchTerm = rawSearchTerm == null ? null : rawSearchTerm.escapeHtml4();
        return safeSearchTerm;
        }
        set;
    }

    public String returnUrl {
        get {
        String retUrlParam = ApexPages.currentPage().getParameters().get('retURL');
        String safeRetUrl = retUrlParam == null ? null : retUrlParam.escapeHtml4();
        return safeRetUrl;
        }
        set;
    }
}

