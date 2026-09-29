/**
 * Supporting controller for the sf:UnescapedSource pages.
 */
public with sharing class SearchController {
    public String searchTerm {
        get {
        String searchTermParam = ApexPages.currentPage().getParameters().get('q');
        String safeSearchTerm = searchTermParam == null ? null : searchTermParam.escapeHtml4();
        return safeSearchTerm;
        }
        set;
    }

    public String returnUrl {
        get {
        String retUrlParam = ApexPages.currentPage().getParameters().get('retURL');
        String safeRetUrlParam = retUrlParam == null ? null : retUrlParam.escapeHtml4();
        return safeRetUrlParam;
        }
        set;
    }
}

