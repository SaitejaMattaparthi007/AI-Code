/**
 * PF-08  sf:AvoidPublicFields
 * Four public fields. Expected: four issues, four fixes, class still compiles after all four.
 */
public class AvoidPublicFields_Multiple {
    public String accountName { get; set; }
    public Integer employeeCount { get; set; }
    public Boolean active { get; set; }
    public Date lastReviewed { get; set; }

    public String summary() {
        return accountName + ' (' + employeeCount + ')';
    }
}

