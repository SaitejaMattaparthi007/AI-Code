# CodeScan AI Fix test data

Test fixtures for enabling AI Code Assistant fix support on three rules.

| Rule | Spike | Recommended snippet level |
| --- | --- | --- |
| sf:SOQLInjection | CD-9477 | Method |
| sf:AvoidPublicFields | CD-9473 | Class |
| sf:UnescapedSource | CD-9488 | Block (enclosing tag) |

## Layout

    force-app/main/default/classes/   Apex fixtures + supporting controllers
    force-app/main/default/pages/     Visualforce fixtures
    force-app/main/default/aura/      Aura fixture

Every file names its scenario ID in a header comment. Expected behaviour is stated
in the same comment, so a file can be read on its own.

## Scenario IDs

sf:SOQLInjection

    SQ-01  SoqlInjection_Basic          fix escapes the tainted value
    SQ-02  SoqlInjection_Bind           fix converts to a bind variable
    SQ-03  SoqlInjection_NonString      numeric: cast, do not escape
    SQ-04  SoqlInjection_Identifier     field-name position: NO fix
    SQ-05  SoqlInjection_OrderBy        ORDER BY / LIMIT position: NO fix
    SQ-06  SoqlInjection_MultiVar       both values remediated
    SQ-07  SoqlInjection_CrossMethod    taint source outside the method
    SQ-08  SoqlInjection_Safe           negative: no issue

sf:AvoidPublicFields

    PF-01  AvoidPublicFields_NeverReassigned  add final
    PF-02  AvoidPublicFields_ReadOnly         get; private set;
    PF-03  AvoidPublicFields_ReadWrite        private field + property
    PF-04  AvoidPublicFields_Collision        must not collide with getName()
    PF-05  AvoidPublicFields_Constant         negative: no issue
    PF-06  AvoidPublicFields_TestClass        @IsTest: NO fix
    PF-07  AvoidPublicFields_Property         negative: no issue
    PF-08  AvoidPublicFields_Multiple         four issues, four fixes

sf:UnescapedSource

    US-01  UnescapedSource_OutputText     escape="false"
    US-02  UnescapedSource_Script         JSENCODE
    US-03  UnescapedSource_Attribute      HTMLENCODE
    US-04  UnescapedSource_Url            URLENCODE
    US-05  UnescapedSource_Style          CSS context: NO fix
    US-06  UnescapedSource_Aura           aura:unescapedHtml
    US-07  UnescapedSource_MultiLineTag   tag spans five lines
    US-08  UnescapedSource_Clean          negative: no issue

## Cross-cutting checks

Run against every fix produced:

    Re-scan clears the issue and raises no new one
    Idempotency: a second fix request on the fixed file changes nothing
    Compiles / deploys to a scratch org
    Blast radius: nothing changed outside the reported construct
    Snippet boundary: SQ-07, PF-04 and US-07 contain the context the fix needed
    Determinism: three runs produce the same remediation strategy

## Deploying

    sf project deploy start --source-dir force-app --target-org <alias>

The fixtures are deliberately vulnerable. Deploy them only to a scratch or
sandbox org used for rule testing.
