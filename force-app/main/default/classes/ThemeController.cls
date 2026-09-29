/**
 * Supporting controller for UnescapedSource_Style.page.
 */
public with sharing class ThemeController {
    public String themeColor {
        get {
        String themeColorParam = ApexPages.currentPage().getParameters().get('color');
        String safeThemeColor = themeColorParam == null ? null : themeColorParam.escapeHtml4();
        return safeThemeColor;
        }
        set;
    }
}

