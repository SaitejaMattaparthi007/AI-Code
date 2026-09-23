/**
 * PF-08  sf:AvoidPublicFields
 * Four public fields. Expected: four issues, four fixes, class still compiles after all four.
 */
public class AvoidPublicFields_Multiple {
    public String accountName;
    public Integer employeeCount;
    public Boolean active;
    public Date lastReviewed;

    public String summary() {
        return accountName + ' (' + employeeCount + ')';
    }
}
