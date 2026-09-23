/**
 * PF-01  sf:AvoidPublicFields
 * Assigned only in the constructor. Expected fix: add the final modifier, keep it public.
 */
public class AvoidPublicFields_NeverReassigned {
    public String region;

    public AvoidPublicFields_NeverReassigned(String region) {
        this.region = region;
    }

    public String describe() {
        return 'Region: ' + region;
    }
}
