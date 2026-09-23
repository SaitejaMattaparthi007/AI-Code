/**
 * PF-06  sf:AvoidPublicFields
 * Public field inside an @IsTest class. Expected: no fix offered.
 */
@IsTest
public class AvoidPublicFields_TestClass {
    public static Account fixture;

    @IsTest
    static void buildsFixture() {
        fixture = new Account(Name = 'Test');
        System.assertNotEquals(null, fixture);
    }
}
