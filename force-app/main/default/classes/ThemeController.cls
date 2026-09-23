/**
 * Supporting controller for UnescapedSource_Style.page.
 */
public with sharing class ThemeController {
    public String themeColor {
        get { return ApexPages.currentPage().getParameters().get('color'); }
        set;
    }
}
